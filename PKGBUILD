# Maintainer: Better Niri packaging <packaging@better-niri.invalid>
#
# Split package for the Better Niri integration branch. One source checkout and
# one `build()` produce every subpackage, so installing a single companion does
# not rebuild niri or any other Rust crate:
#
#   niri-better       compositor, session files, niri.portal, docs
#   better-portal     standalone Screenshot/ScreenCast portal backend
#   better-companion  automation/parking daemon and companionctl
#   better-monitor    output profiles
#   better-session    named workspace/window/output contexts
#   better-shot       screenshot capture
#   better-wallpaper  per-workspace wallpaper scenes
#   better-settings   GTK4 settings UI and better-settingsctl
#   better-audio      rule-based PipeWire audio routing
#   better-sidepanels layer-shell panels
#   better-noctalia-plugins  Noctalia plugin source (Luau widgets)
#   better-desktop    meta package depending on every package above
#
# niri-better installs the same `niri` binary and niri-session as the official
# `niri` package, therefore it conflicts with it and provides `niri`. The
# companion packages are independent and can be installed on their own.
#
# This is the non-VCS AUR recipe: it points at one explicit commit so the
# package version and source are stable. It produces the same split package
# names as the -git recipe (niri-better, better-*). Bump _commit together with
# _tag/pkgver when releasing; niri-better-git tracks the branch instead.
# Publish by copying PKGBUILD, .SRCINFO, the desktop file, the meta README and
# the meta install file into the AUR repository; this tree never pushes
# automatically.

pkgbase=niri-better
pkgname=(
  niri-better
  better-portal
  better-companion
  better-monitor
  better-session
  better-shot
  better-wallpaper
  better-settings
  better-audio
  better-sidepanels
  better-noctalia-plugins
  better-desktop
)
_pkgname=better-niri
pkgver=26.4.0.elite
pkgrel=3
_commit=644e02812e34b17697cc972f726d771c54ccf5fe
pkgdesc="Scrollable-tiling Wayland compositor with the Better Desktop companion apps"
arch=(x86_64 aarch64)
url="https://github.com/fram446742/better-niri"
license=(GPL-3.0-or-later)
makedepends=(clang git pkgconf rust)

_app_manifests=(
  better-portal
  better-companion
  better-monitor
  better-session
  better-shot
  better-wallpaper
  better-settings
  better-audio
  better-sidepanels
)

source=(
  "${_pkgname}::git+${url}.git#commit=${_commit}"
  better-settings.desktop
  better-desktop.README.md
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "${_pkgname}"

  # Keep all crates and git checkouts inside srcdir instead of the build user's
  # home directory.
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
  for manifest in "${_app_manifests[@]}"; do
    cargo fetch --locked --manifest-path "${manifest}/Cargo.toml"
  done
}

build() {
  cd "${_pkgname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"
  # bindgen (pipewire/SPA bindings) does not always find libclang on its own.
  export LIBCLANG_PATH=/usr/lib
  export NIRI_BUILD_COMMIT="$(git rev-parse --short HEAD)"

  # Default features on purpose: the package must match what a normal
  # `cargo build --release` of this branch produces.
  cargo build --frozen --release -p niri

  local manifest
  for manifest in "${_app_manifests[@]}"; do
    cargo build --frozen --release --manifest-path "${manifest}/Cargo.toml"
  done
}

# Install the shared license and per-component README without letting two
# subpackages claim the same path.
_install_doc() {
  local pkg=$1 doc=$2
  install -Dm644 "$doc" "${pkgdir}/usr/share/doc/${pkg}/README.md"
}

_install_license() {
  local pkg=$1
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkg}/LICENSE"
}

_install_completions() {
  local bin=$1
  install -Dm644 "${srcdir}/${_pkgname}/packaging/completions/bash/${bin}" \
    "${pkgdir}/usr/share/bash-completion/completions/${bin}"
  install -Dm644 "${srcdir}/${_pkgname}/packaging/completions/fish/${bin}.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/${bin}.fish"
  install -Dm644 "${srcdir}/${_pkgname}/packaging/completions/zsh/_${bin}" \
    "${pkgdir}/usr/share/zsh/site-functions/_${bin}"
}

package_niri-better() {
  pkgdesc="Scrollable-tiling Wayland compositor with the Better Desktop integration"
  depends=(
    cairo
    gcc-libs
    glib2
    glibc
    libdisplay-info
    libdrm
    libglvnd
    libinput
    libpipewire
    libxkbcommon
    mesa
    pango
    pixman
    seatd
    systemd-libs
    vulkan-icd-loader
    wayland
  )
  optdepends=(
    'xdg-desktop-portal: portal broker for niri.portal'
    'xdg-desktop-portal-gtk: file chooser, notifications and other fallback portals'
    'xdg-desktop-portal-gnome: fallback ScreenCast backend'
    'dbus: dbus-update-activation-environment used by niri-session'
    'systemd: systemctl, loginctl and busctl for session and idle integration'
    'pipewire: screencasting server'
    'wireplumber: PipeWire session manager'
    'libnotify: notify-send for user hooks and scripts'
    'alacritty: terminal in the default niri configuration'
    'fuzzel: application launcher in the default niri configuration'
    'mako: notification daemon'
    'waybar: panel used by the default niri configuration'
    'swaylock: screen locker in the default niri configuration'
    'polkit-gnome: authentication agent for privileged applications'
    'xwayland-satellite: run X11 applications in XWayland'
    'vulkan-radeon: Vulkan driver for AMD GPUs'
    'vulkan-intel: Vulkan driver for Intel GPUs'
    'nvidia-utils: GL/Vulkan driver for NVIDIA GPUs'
  )
  provides=("niri=$pkgver" "niri-elite=$pkgver" wayland-compositor xdg-desktop-portal-impl)
  conflicts=(niri niri-git niri-elite niri-elite-git)
  # niri records panic backtraces; its release profile only carries line tables,
  # so stripping would make crash reports useless.
  options=(!strip)

  cd "${_pkgname}"
  local target="${srcdir}/target/release"

  install -Dm755 "${target}/niri" "${pkgdir}/usr/bin/niri"
  install -Dm755 resources/niri-session "${pkgdir}/usr/bin/niri-session"
  install -Dm644 resources/niri.desktop "${pkgdir}/usr/share/wayland-sessions/niri.desktop"

  install -Dm644 resources/niri.portal \
    "${pkgdir}/usr/share/xdg-desktop-portal/portals/niri.portal"
  install -Dm644 resources/niri-portals.conf \
    "${pkgdir}/usr/share/xdg-desktop-portal/niri-portals.conf"

  install -Dm644 resources/niri.service "${pkgdir}/usr/lib/systemd/user/niri.service"
  install -Dm644 resources/niri-shutdown.target \
    "${pkgdir}/usr/lib/systemd/user/niri-shutdown.target"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/niri-better/README.md"
  # The pinned source commit may predate this document; install it when the
  # checkout has it (the -git package and later pinned bumps do).
  if [ -f docs/PACKAGING.md ]; then
    install -Dm644 docs/PACKAGING.md "${pkgdir}/usr/share/doc/niri-better/PACKAGING.md"
  fi
  install -Dm644 resources/default-config.kdl \
    "${pkgdir}/usr/share/doc/niri-better/default-config.kdl"
  _install_license niri-better

  # Man pages are installed when the tree grows them; there are none today.
  if compgen -G 'resources/man/*.1' >/dev/null; then
    install -d "${pkgdir}/usr/share/man/man1"
    install -Dm644 resources/man/*.1 -t "${pkgdir}/usr/share/man/man1/"
  fi

  # Shell completions are generated by the binary itself.
  local shell
  for shell in bash fish zsh nushell; do
    "${target}/niri" completions "${shell}" > "${srcdir}/niri.${shell}"
  done
  install -Dm644 "${srcdir}/niri.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/niri"
  install -Dm644 "${srcdir}/niri.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/niri.fish"
  install -Dm644 "${srcdir}/niri.zsh" \
    "${pkgdir}/usr/share/zsh/site-functions/_niri"
  install -Dm644 "${srcdir}/niri.nushell" \
    "${pkgdir}/usr/share/nushell/completions/niri.nu"
}

package_better-portal() {
  _install_completions better-portal
  _install_completions better-portal-picker
  pkgdesc="Standalone Screenshot/ScreenCast xdg-desktop-portal backend for Better Niri"
  depends=(dbus gcc-libs glibc systemd)
  optdepends=(
    'xdg-desktop-portal: broker that loads better.portal'
    'xdg-desktop-portal-gtk: fallback for interfaces better-portal does not implement'
  )

  cd "${_pkgname}"
  local target="${srcdir}/target/release"

  install -Dm755 "${target}/better-portal" "${pkgdir}/usr/bin/better-portal"
  install -Dm755 "${target}/better-portal-picker" \
    "${pkgdir}/usr/bin/better-portal-picker"

  # niri's and better-portal's descriptors are installed side by side; the
  # per-desktop portals.conf selects the backend. The example file shows how to
  # select `better` explicitly.
  install -Dm644 better-portal/better.portal \
    "${pkgdir}/usr/share/xdg-desktop-portal/portals/better.portal"

  # The templates contain @BETTER_PORTAL@. Render the packaged path so both the
  # optional unit and the D-Bus activation file work without running
  # better-portal/scripts/install.sh.
  install -d "${pkgdir}/usr/lib/systemd/user"
  sed 's|@BETTER_PORTAL@|/usr/bin/better-portal|g' \
    better-portal/packaging/better-portal.service \
    > "${pkgdir}/usr/lib/systemd/user/better-portal.service"
  install -d "${pkgdir}/usr/share/dbus-1/services"
  sed 's|@BETTER_PORTAL@|/usr/bin/better-portal|g' \
    better-portal/packaging/org.freedesktop.impl.portal.desktop.better.service \
    > "${pkgdir}/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.better.service"
  chmod 644 \
    "${pkgdir}/usr/lib/systemd/user/better-portal.service" \
    "${pkgdir}/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.better.service"

  install -Dm644 better-portal/packaging/portals.conf \
    "${pkgdir}/usr/share/doc/better-portal/portals.conf.better.example"
  _install_doc better-portal better-portal/README.md
  _install_license better-portal
}

package_better-companion() {
  _install_completions better-companion
  _install_completions companionctl
  pkgdesc="Automation and parking daemon for Better Niri"
  depends=(gcc-libs glibc)
  optdepends=(
    'systemd: loginctl, busctl and systemctl for idle and lock actions, plus the optional user unit'
    'libpulse: pactl probe for idle detection'
    'libnotify: notify-send in user hooks'
  )

  cd "${_pkgname}"
  local target="${srcdir}/target/release"

  install -Dm755 "${target}/better-companion" "${pkgdir}/usr/bin/better-companion"
  install -Dm755 "${target}/companionctl" "${pkgdir}/usr/bin/companionctl"
  # Optional user unit; enable it after niri has imported NIRI_SOCKET.
  install -Dm644 better-companion/packaging/better-companion.service \
    "${pkgdir}/usr/lib/systemd/user/better-companion.service"
  _install_doc better-companion better-companion/README.md
  _install_license better-companion
}

package_better-monitor() {
  _install_completions better-monitor
  pkgdesc="Output profile save, apply and rollback for Better Niri"
  depends=(gcc-libs glibc)

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/better-monitor" \
    "${pkgdir}/usr/bin/better-monitor"
  _install_doc better-monitor better-monitor/README.md
  _install_license better-monitor
}

package_better-session() {
  _install_completions better-session
  pkgdesc="Named workspace, window and output contexts for Better Niri"
  depends=(gcc-libs glibc)

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/better-session" \
    "${pkgdir}/usr/bin/better-session"
  _install_doc better-session better-session/README.md
  _install_license better-session
}

package_better-shot() {
  _install_completions better-shot
  pkgdesc="Screenshot capture for Better Niri with annotations and clipboard support"
  depends=(gcc-libs glibc)
  optdepends=(
    'satty: interactive annotation for better-shot --annotate'
    'wl-clipboard: wl-copy/wl-paste for better-shot --copy'
  )

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/better-shot" "${pkgdir}/usr/bin/better-shot"
  _install_doc better-shot better-shot/README.md
  _install_license better-shot
}

package_better-wallpaper() {
  _install_completions better-wallpaper
  pkgdesc="Per-workspace wallpaper scenes for Better Niri"
  depends=(gcc-libs glibc wayland)
  optdepends=(
    'swaybg: default wallpaper command for the command backend'
    'swww: alternative wallpaper daemon for the command backend'
  )

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/better-wallpaper" \
    "${pkgdir}/usr/bin/better-wallpaper"
  _install_doc better-wallpaper better-wallpaper/README.md
  _install_license better-wallpaper
}

package_better-settings() {
  _install_completions better-settings
  _install_completions better-settingsctl
  pkgdesc="GTK4/libadwaita control center and CLI for Better Niri"
  depends=(gcc-libs glibc gtk4 libadwaita)

  cd "${_pkgname}"
  local target="${srcdir}/target/release"

  install -Dm755 "${target}/better-settings" "${pkgdir}/usr/bin/better-settings"
  install -Dm755 "${target}/better-settingsctl" \
    "${pkgdir}/usr/bin/better-settingsctl"
  install -Dm644 "${srcdir}/better-settings.desktop" \
    "${pkgdir}/usr/share/applications/better-settings.desktop"
  _install_doc better-settings better-settings/README.md
  _install_license better-settings
}

package_better-audio() {
  _install_completions better-audio
  pkgdesc="Rule-based PipeWire audio routing for Better Niri"
  # The default `native` feature links libpipewire-0.3 directly. The pactl and
  # wpctl backends are probed at runtime and only need their optional tools.
  depends=(gcc-libs glibc libpipewire)
  optdepends=(
    'pipewire: audio server used by the native backend'
    'wireplumber: PipeWire session manager providing wpctl'
    'libpulse: pactl backend for PipeWire PulseAudio compatibility'
    'pulseaudio: alternative sound server providing pactl'
  )

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/better-audio" "${pkgdir}/usr/bin/better-audio"
  _install_doc better-audio better-audio/README.md
  _install_license better-audio
}

package_better-sidepanels() {
  _install_completions better-sidepanels
  pkgdesc="Layer-shell panels with exclusive zones for Better Niri"
  depends=(cairo gcc-libs glib2 glibc wayland)
  optdepends=(
    'playerctl: media module'
    'libpulse: pactl backend for the volume module'
    'wireplumber: wpctl backend for the volume module'
    'libnotify: notify-send actions'
  )

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/better-sidepanels" \
    "${pkgdir}/usr/bin/better-sidepanels"
  _install_doc better-sidepanels better-sidepanels/README.md
  _install_license better-sidepanels
}

package_better-noctalia-plugins() {
  pkgdesc="Noctalia bar plugins for the Better Desktop companion apps"
  arch=(any)
  depends=()
  optdepends=(
    'noctalia: shell that loads these Luau plugins'
    'better-companion: status and action widgets'
    'better-monitor: output profile widget'
    'better-session: context switcher widget'
    'better-shot: screenshot widget'
    'better-audio: default sink widget'
    'better-wallpaper: scene widget'
    'better-sidepanels: panel reload widget'
  )

  cd "${_pkgname}"
  install -d "${pkgdir}/usr/share/better-desktop/noctalia-plugins"
  cp -a "${srcdir}/${_pkgname}/better-noctalia-plugins/." \
    "${pkgdir}/usr/share/better-desktop/noctalia-plugins/"
  rm -f "${pkgdir}/usr/share/better-desktop/noctalia-plugins/.gitignore" \
    "${pkgdir}/usr/share/better-desktop/noctalia-plugins/LICENSE"
  find "${pkgdir}/usr/share/better-desktop/noctalia-plugins" -name verify.sh \
    -exec chmod 755 {} +
  _install_doc better-noctalia-plugins better-noctalia-plugins/README.md
  _install_license better-noctalia-plugins
}

package_better-desktop() {
  pkgdesc="Meta package for the Better Niri desktop: compositor, portal and companion apps"
  depends=(
    niri-better
    better-portal
    better-companion
    better-monitor
    better-session
    better-shot
    better-wallpaper
    better-settings
    better-audio
    better-sidepanels
    better-noctalia-plugins
  )
  optdepends=(
    'xdg-desktop-portal: portal broker for niri.portal and better.portal'
    'xdg-desktop-portal-gtk: fallback portal for file chooser and friends'
    'pipewire: audio and screencasting server'
    'wireplumber: PipeWire session manager and wpctl'
    'dbus: dbus-update-activation-environment used by niri-session'
    'systemd: systemctl, loginctl and busctl integration'
  )
  install=better-desktop.install

  # A pinned source commit can predate the unified selector; the git recipe
  # always builds it. Release pins include it from this commit onward.
  if [ -f "${srcdir}/target/release/better" ]; then
    install -Dm755 "${srcdir}/target/release/better" "${pkgdir}/usr/bin/better"
  fi
  install -Dm644 "${srcdir}/better-desktop.README.md" \
    "${pkgdir}/usr/share/doc/better-desktop/README.md"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/better-desktop/LICENSE"
}
