# Maintainer: qie2035 <qie2035@users.noreply.github.com>
#
# GreenBoost Gaming Suite, packaged from the upstream v0.2 tag.
#
# Notes for future maintainers:
#
#  * The Vulkan layer MUST be built with `make vulkan`, not with the compile
#    line upstream's own install.sh uses.  install.sh links only
#    greenboost_vulkan_layer.c, leaving nis_*_spv_* and gb_hud_spv_* undefined;
#    the resulting .so fails dlopen() and the layer silently never loads.
#    `make vulkan` embeds the SPIR-V blobs (nis_blobs.S / hud_blobs.S) and
#    needs the NIS shader source at ../NVIDIAImageScaling/NIS/NIS_Main.glsl,
#    which prepare() unpacks next to the source tree.
#
#  * install.sh itself is deliberately NOT shipped or run here: it requires
#    root, installs OS packages, writes to /usr/local, runs groupadd and
#    regenerates initramfs images.  Everything it does is reproduced below
#    into $pkgdir, and the GUI's layer-install buttons are redirected to the
#    package manager by arch-packaged-paths.patch.
#
#  * Upstream's initramfs exclusion hooks (initramfs-tools/dracut) are not
#    packaged: mkinitcpio only copies systemd.conf and 20-systemd-stub.conf
#    into the image, so /usr/lib/tmpfiles.d/greenboost-gaming.conf never
#    reaches early userspace on Arch and there is nothing to exclude it from.
pkgname=greenboost-gaming-suite
pkgver=0.2
pkgrel=3
pkgdesc="Gaming optimisation suite for GreenBoost: Vulkan and OpenGL memory-tiering layers, a GUI for DLSS/power/display profiles, and Steam Proton integration"
arch=('x86_64')
url="https://gitlab.com/IsolatedOctopi/greenboost_gaming_suite"
# Upstream's SPDX headers (27 files) are GPL-2.0-only and the README says
# "GPL v2"; its LICENSE additionally permits per-file MIT and frames the
# combined work as dual MIT/GPLv2-compatible.  Distribution of the whole
# package is therefore under GPL-2.0-only; the LICENSE text is installed
# verbatim for the per-file details.
license=('GPL-2.0-only')
install="${pkgname}.install"

depends=(
  'python'                   # gb_gaming backend, fan daemon, Proton wrapper
  'vulkan-icd-loader'        # consumes the implicit-layer manifest
  'gtk3'
  'webkit2gtk-4.1'           # Tauri WebView runtime
  'libsoup3'
  'libayatana-appindicator'  # system tray icon
  'python-gobject'           # gi: GNOME/Wayland VRR and display settings
  'polkit'                   # pkexec helpers
  'sudo'                     # sudo -n helpers (fan/power control)
)
makedepends=(
  'git'                      # the Proton wrapper's syntax gate
  'gcc'
  'pkgconf'                  # Makefile probes `pkg-config --variable=includedir vulkan`
  'nodejs'
  'npm'
  'rust'                     # provides cargo
  'shaderc'                  # glslc, for the NIS and HUD SPIR-V blobs
  'vulkan-headers'
)
checkdepends=('python-pytest')
optdepends=(
  'greenboost: memory tiering / VRAM inflation (kernel module + CUDA shim); without it the layers still load but the tier pool stays inert'
  'nvidia-utils: NVML for fan curves, power and clock limits, live GPU stats'
  'steam: deploy the bundled Proton compatibility tool'
  'mangohud: memory-tier occupancy shown in the game overlay'
)

source=(
  # GitLab's archive keeps the tag's "v" in its top-level directory, so the
  # extracted tree is greenboost_gaming_suite-v${pkgver}.
  "${url}/-/archive/v${pkgver}/greenboost_gaming_suite-v${pkgver}.tar.gz"
  "NVIDIAImageScaling-1.0.3.tar.gz::https://github.com/NVIDIAGameWorks/NVIDIAImageScaling/archive/refs/tags/v1.0.3.tar.gz"
  "arch-packaged-paths.patch"
  "arch-proton-gb-gaming-paths.patch"
)
sha256sums=(
  'f5387243bc769563eb1ebe79123c1034acb14f8023a83584cefd0d47b70f6faa'
  'e34a67c5cc3459476d12c440845dcaf1210e92b89f8876069107973d88d944e1'
  '7703cd99867a249d10fdabf9738930a5db0a9def78578a156205ba09d3252873'
  '3abb6a932a8e9e6cc1379363d42834a2d4acae993be8f48a61ddf83bcdf625e8'
)

prepare() {
  # The Makefile resolves NIS_SRC as $(CURDIR)/../NVIDIAImageScaling/NIS/NIS_Main.glsl,
  # so the shader SDK has to sit one level above the extracted source tree.
  rm -rf "$srcdir/NVIDIAImageScaling"
  mv "$srcdir/NVIDIAImageScaling-1.0.3" "$srcdir/NVIDIAImageScaling"

  cd "$srcdir/greenboost_gaming_suite-v${pkgver}"
  patch -p1 -i "$srcdir/arch-packaged-paths.patch"
  patch -p1 -i "$srcdir/arch-proton-gb-gaming-paths.patch"
}

build() {
  cd "$srcdir/greenboost_gaming_suite-v${pkgver}"

  # C layers.  -march=native / -C target-cpu=native are intentionally NOT used
  # (upstream's install.sh uses both): packages have to stay portable.
  make vulkan
  make gl

  # Tauri GUI (React frontend -> dist/, then the Rust binary).
  cd src
  npm ci --no-fund --no-audit
  npm run build
  cd src-tauri

  # tauri/custom-protocol is what makes the generated context embed ../dist
  # instead of pointing the webview at tauri.conf.json's devUrl.  The macro
  # decides with `dev: cfg!(not(feature = "custom-protocol"))`, and the app
  # crate declares no [features] of its own, so it has to be enabled through
  # the dependency.  Without it the GUI starts and shows only
  # "Could not connect to localhost: Connection refused".
  cargo build --release --locked --features tauri/custom-protocol

  # Hard guard: prove the frontend really was embedded.  dist/index.html names
  # its hashed bundles, and Tauri keeps asset *keys* (the request paths)
  # uncompressed even though it brotli-compresses asset bodies, so at least one
  # of those paths must appear in the binary.  The devUrl string cannot be used
  # for this: the whole tauri.conf.json is embedded in both dev and release
  # builds, so it is present either way (a false positive that hid this bug).
  local _asset _embedded=0
  for _asset in $(grep -oE 'assets/[A-Za-z0-9._-]+\.(js|css)' ../dist/index.html | sort -u); do
    grep -aq "$_asset" target/release/tauri-app && _embedded=$((_embedded + 1))
  done
  if (( _embedded == 0 )); then
    echo "ERROR: no frontend bundle path found inside target/release/tauri-app;" >&2
    echo "       the tauri/custom-protocol feature did not take effect." >&2
    exit 1
  fi
}

check() {
  cd "$srcdir/greenboost_gaming_suite-v${pkgver}"
  python -m pytest tests/ -q
  # Static guard that the layer manifest keeps disable_environment and that the
  # HOOK macro still compares against real vk* names.
  bash tests/run_layer_contract_test.sh
}

package() {
  cd "$srcdir/greenboost_gaming_suite-v${pkgver}"

  # ── Vulkan implicit layer + OpenGL interposer ──────────────────────
  install -Dm755 libVkLayer_greenboost.so "$pkgdir/usr/lib/libVkLayer_greenboost.so"
  install -Dm755 libgb_gl.so              "$pkgdir/usr/lib/libgb_gl.so"

  # Manifest mirroring upstream's write_layer_manifest(), with library_path
  # pointing at /usr/lib.  disable_environment is mandatory: without it the
  # Vulkan loader treats the manifest as malformed and skips the layer.
  install -d "$pkgdir/usr/share/vulkan/implicit_layer.d"
  cat > "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_greenboost.json" <<'MANIFEST'
{
    "file_format_version": "1.0.0",
    "layer": {
        "name": "VK_LAYER_GREENBOOST_memory",
        "type": "GLOBAL",
        "library_path": "/usr/lib/libVkLayer_greenboost.so",
        "api_version": "1.3.0",
        "implementation_version": "1",
        "description": "GreenBoost virtual VRAM , inflates device-local heap and routes overflow allocations to T2/T3 DDR via DMA-BUF",
        "enable_environment": {
            "GREENBOOST_VULKAN": "1"
        },
        "disable_environment": {
            "GREENBOOST_VULKAN_DISABLE": "1"
        }
    }
}
MANIFEST
  chmod 644 "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_greenboost.json"

  # ── GUI + Python backend ───────────────────────────────────────────
  # /usr/lib/greenboost-gaming is the layout the Rust frontend (manager.rs,
  # optimizer.rs) and the shipped polkit/sudoers rules already hard-code.
  install -Dm755 src/src-tauri/target/release/tauri-app \
    "$pkgdir/usr/lib/greenboost-gaming/greenboost-gaming-gui"

  install -d "$pkgdir/usr/lib/greenboost-gaming/gb_gaming"
  install -m644 gb_gaming/*.py "$pkgdir/usr/lib/greenboost-gaming/gb_gaming/"

  # ── launcher ───────────────────────────────────────────────────────
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/greenboost-gaming" <<'LAUNCHER'
#!/usr/bin/env bash
# GreenBoost Gaming Suite launcher
#
# Deliberately does NOT export GREENBOOST_VULKAN=1: the Vulkan layer is
# implicit, so setting it here would enable it for this process and therefore
# for Steam and everything Steam spawns.  The Proton wrapper exports it itself
# right before it execs the game, which is the only place that knows it is
# looking at a game.
export GREENBOOST_ACTIVE=1

# GDK / Wayland niceties
export GDK_BACKEND=${GDK_BACKEND:-wayland,x11}

# ── NVIDIA + Wayland WebKitGTK quirk ─────────────────────────────────
# WebKitGTK's DMA-BUF renderer presents explicit-sync surfaces that the
# NVIDIA proprietary driver supplies no acquire point for, so the compositor
# kills the client and GTK3 dies with:
#   Gdk-Message: Error 71 (Protocol error) dispatching to Wayland display.
# (upstream trace: wl_display.error(wp_linux_drm_syncobj_surface_v1, 4,
#  "explicit sync is used, but no acquire point is set"))
# Disabling that renderer keeps the GUI usable; see the Tauri issue
# tauri-apps/tauri#10702 for the full history.
#
# This is preferred over __NV_DISABLE_EXPLICIT_SYNC=1 here: that switch is
# read by the NVIDIA driver libraries, so Steam and every game launched from
# this Suite would inherit it as well.  WEBKIT_DISABLE_DMABUF_RENDERER only
# affects the webview in this process tree.
#
# Applied only on Wayland with the proprietary driver loaded, never overrides
# a value you set yourself, and GREENBOOST_WEBKIT_GPU=1 opts out completely
# (e.g. once a driver or GTK fix lands).
if [[ -z "${GREENBOOST_WEBKIT_GPU:-}" && -z "${WEBKIT_DISABLE_DMABUF_RENDERER+x}" ]]; then
    case "${GDK_BACKEND%%,*}" in
        wayland|"*"|"")
            if { [[ -e /sys/module/nvidia ]] \
              || [[ -e /sys/module/nvidia_drm ]] \
              || [[ -e /proc/driver/nvidia/version ]]; } \
              && [[ ! -e /sys/module/nouveau ]]; then
                export WEBKIT_DISABLE_DMABUF_RENDERER=1
            fi
            ;;
    esac
fi

# Enable Proton's Wayland backend when the session is Wayland
_XDG="${XDG_SESSION_TYPE:-}"
if [[ "$_XDG" == "wayland" ]] || [[ -n "${WAYLAND_DISPLAY:-}" ]]; then
    export PROTON_ENABLE_WAYLAND=${PROTON_ENABLE_WAYLAND:-1}
fi

APP_LIB_DIR="/usr/lib/greenboost-gaming"

# The Proton wrapper and the fan daemon import gb_gaming from here as well.
export PYTHONPATH="$APP_LIB_DIR:${PYTHONPATH:-}"

exec "$APP_LIB_DIR/greenboost-gaming-gui" "$@"
LAUNCHER
  chmod 755 "$pkgdir/usr/bin/greenboost-gaming"

  # ── .desktop + icon ────────────────────────────────────────────────
  # The basename must match APP_ID (tauri.conf.json's identifier), which is
  # what GTK reports to Wayland as the app_id; GNOME Shell looks up
  # "<app_id>.desktop" for the running window's icon.
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/com.ferran.greenboost-gaming-suite.desktop" <<'DESKTOP'
[Desktop Entry]
Version=1.0
Type=Application
Name=GreenBoost Gaming Suite
GenericName=Gaming Optimization Suite
Comment=Manage Steam games, DLSS/FSR libraries, and GPU profile under GreenBoost
Exec=/usr/bin/greenboost-gaming %U
Icon=greenboost-gaming
Terminal=false
Categories=Game;Settings;System;
Keywords=greenboost;gaming;steam;proton;dlss;vulkan;vram;gpu;
StartupNotify=true
StartupWMClass=com.ferran.greenboost-gaming-suite
DESKTOP
  chmod 644 "$pkgdir/usr/share/applications/com.ferran.greenboost-gaming-suite.desktop"

  install -Dm644 src/src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/greenboost-gaming.png"

  # ── per-game profiles ──────────────────────────────────────────────
  install -d "$pkgdir/usr/share/greenboost-gaming/profiles/per-game"
  install -m644 profiles/per-game/*.json \
    "$pkgdir/usr/share/greenboost-gaming/profiles/per-game/"

  # ── runtime root used by the patched GUI ───────────────────────────
  # arch-packaged-paths.patch makes gaming_project_root() return
  # /usr/share/greenboost-gaming when greenboost_proton/install.sh is there,
  # which is what the GUI's Proton install/uninstall buttons need.  The
  # in-tree install.sh is NOT installed: it needs root and would shadow the
  # package's own /usr/lib layers from /usr/local.
  install -d "$pkgdir/usr/share/greenboost-gaming/greenboost_proton"
  install -m755 greenboost_proton/install.sh "$pkgdir/usr/share/greenboost-gaming/greenboost_proton/install.sh"
  install -m755 greenboost_proton/proton      "$pkgdir/usr/share/greenboost-gaming/greenboost_proton/proton"
  install -m644 greenboost_proton/gb_proton_main.py \
                greenboost_proton/compatibilitytool.vdf \
                greenboost_proton/toolmanifest.vdf \
                greenboost_proton/version \
                greenboost_proton/channel \
    "$pkgdir/usr/share/greenboost-gaming/greenboost_proton/"

  # ── Steam compatibility tools (system-wide) ────────────────────────
  # Same location the proton-ge-custom-bin AUR package uses.  Mirrors
  # greenboost_proton/install.sh: identical payload in two directories, the
  # VDF renamed per variant and the channel sidecar preset.
  local _variant _name _display _dst
  for _variant in stable experimental; do
    if [[ "$_variant" == "stable" ]]; then
      _name="greenboost-proton"
      _display="GreenBoost Proton"
    else
      _name="greenboost-proton-experimental"
      _display="GreenBoost Proton Experimental"
    fi
    _dst="$pkgdir/usr/share/steam/compatibilitytools.d/$_name"
    install -d "$_dst"
    install -m755 greenboost_proton/proton "$_dst/proton"
    install -m644 greenboost_proton/gb_proton_main.py \
                  greenboost_proton/compatibilitytool.vdf \
                  greenboost_proton/toolmanifest.vdf \
                  greenboost_proton/version \
      "$_dst/"
    sed -i "s|greenboost-proton|$_name|g; s|GreenBoost Proton|$_display|g" \
      "$_dst/compatibilitytool.vdf"
    echo "$_variant" > "$_dst/channel"
    chmod 644 "$_dst/channel"
  done

  # ── fan daemon (per-user unit) ─────────────────────────────────────
  install -Dm644 scripts/gb-gaming-fan-daemon.service \
    "$pkgdir/usr/lib/systemd/user/gb-gaming-fan-daemon.service"
  # The unit's PYTHONPATH points at upstream's /usr/local install location,
  # and its explanatory comment names it too; both have to say /usr/lib here.
  sed -i -e 's|/usr/local/lib/greenboost-gaming|/usr/lib/greenboost-gaming|g' \
         -e 's|# bundled gb_gaming package (when installed in /usr/local).|# bundled gb_gaming package (installed at /usr/lib/greenboost-gaming).|' \
    "$pkgdir/usr/lib/systemd/user/gb-gaming-fan-daemon.service"

  # ── privileged helper rules ────────────────────────────────────────
  # /usr/share/polkit-1/rules.d is the packaging-friendly location; the rule
  # already authorises /usr/lib/greenboost-gaming paths.
  install -Dm644 scripts/60-greenboost-fan.rules \
    "$pkgdir/usr/share/polkit-1/rules.d/60-greenboost-fan.rules"
  install -Dm440 scripts/60-greenboost-fan.sudoers \
    "$pkgdir/etc/sudoers.d/60-greenboost-fan"

  # ── gaming_mode group-write access ─────────────────────────────────
  install -Dm644 scripts/99-greenboost-gaming.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-greenboost-gaming.rules"
  install -Dm644 scripts/greenboost-gaming.tmpfiles.conf \
    "$pkgdir/usr/lib/tmpfiles.d/greenboost-gaming.conf"
  # Replaces install.sh's `groupadd -r greenboost`; the pacman sysusers hook
  # creates the group, which the tmpfiles rule and the udev rule both need.
  install -d "$pkgdir/usr/lib/sysusers.d"
  echo 'g greenboost - -' > "$pkgdir/usr/lib/sysusers.d/greenboost-gaming.conf"
  chmod 644 "$pkgdir/usr/lib/sysusers.d/greenboost-gaming.conf"

  # ── docs + license ─────────────────────────────────────────────────
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README.md CHANGELOG.md ARCHITECTURE.md CONTRIBUTING.md \
                GREENBOOST_PROTON.md DLSS_UPDATER.md \
    "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 docs/FEATURES.md \
    "$pkgdir/usr/share/doc/$pkgname/FEATURES.md"
  install -m644 greenboost_proton/architecture.md \
    "$pkgdir/usr/share/doc/$pkgname/greenboost-proton-architecture.md"
}
