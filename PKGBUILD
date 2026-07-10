# Maintainer: Kenan Pelit <kenanpelit@gmail.com>
#
# margo — a Rust + Smithay Wayland tiling compositor in the dwl/mango
# tradition. Ships:
#   * compositor binary `margo` + the `start-margo` launcher
#   * first-party helpers: `mctl` (dwl-ipc-v2 client), `mlock` (PAM
#     lockscreen), `mlayout` (per-tag layout profile manager),
#     `mscreenshot` (grim/slurp pipeline), `mvisual` (output
#     monitor-profile manager), `mpicker` (native colour picker —
#     frozen screencap + zoom lens, drops the hyprpicker dep),
#     `mvpn` (native Mullvad VPN control — full CLI + GTK4 layer-shell
#     panel; drives the `mullvad` daemon, optional), `mcal` (read-only
#     calendar CLI over local .ics + remote iCal subscriptions)
#   * `mshell` first-party desktop shell (GTK4 + relm4 + layer-shell)
#     and its `mshellctl` / `mshellshare` IPC siblings
#   * `mwizard` first-launch setup wizard (writes the shell profile
#     YAML + xkb_rules_layout into config.conf the first time the
#     user runs margo with no existing profile)
#   * `mlogind` TUI login / display manager (fork of lemurs): a
#     bare-TTY greeter (PAM auth + session launch) themed from the
#     margo matugen palette. Binary is shipped; its config / PAM /
#     systemd templates land under doc/ for deliberate install (a
#     login manager must not auto-clobber the PAM stack). See NOTE.
#
# mshell speaks `dwl-ipc-v2` against `margo`. The bundle replaces
# the previous "compositor-only" `margo-git` so a single
# `pacman -S margo-git` gives the full first-party desktop. Users
# who prefer a different bar (noctalia, waybar-dwl, fnott, …) can
# simply not run `mshell`; the helper binaries are still useful.

pkgname=margo-git
pkgver=r2115.24455f9d
pkgrel=1
pkgdesc="Rust/Smithay Wayland tiling compositor with a first-party GTK4 desktop shell (mshell)"
url="https://github.com/kenanpelit/margo"
arch=("x86_64")
license=("GPL-3.0-or-later")

# Runtime libraries — split into compositor-side and mshell-side so
# trimming this list back to a shell-less build later is mechanical.
# Verified with `ldd /usr/bin/margo /usr/bin/mlock /usr/bin/mshell
# /usr/bin/mshellctl /usr/bin/mpicker /usr/bin/mwizard` against a
# fresh release build.
depends=(
  # ── Compositor + helpers ────────────────────────────────────────
  glibc
  gcc-libs
  libinput
  libxkbcommon
  wayland
  mesa            # libgbm / libEGL / libGLESv2 for DRM/KMS
  seatd           # libseat.so.1
  pixman
  libdrm
  systemd-libs    # libudev, libsystemd, sd-bus
  libgudev
  glib2
  pcre2           # `regex` crate's PCRE backend → window-rule regexes
  pam             # `mlock` authenticates the session owner
  cairo           # `mlock` software renderer
  pango           # `mlock` + mshell text shaping
  dbus            # screencast / portal D-Bus shims
  uwsm            # the installed wayland-session entry launches margo via uwsm
  # ── mlogind greeter host (native per-monitor login resolution) ──
  # `[display] host = "cage"` (the default) runs the login greeter inside
  # a cage+foot kiosk so every connected monitor lights up at its own
  # native KMS mode — dynamic, EDID-derived, no hardcoded resolution.
  # mlogind falls back to the classic single-framebuffer TTY greeter if
  # either binary is missing, so these are functionally required only for
  # the native-resolution path.
  cage            # wlroots kiosk compositor that hosts the greeter
  foot            # Wayland terminal the greeter renders into
  # ── Portals (gnome-free) ────────────────────────────────────────
  # Frontend daemon reads our margo.portal + margo-portals.conf and
  # activates margo-portal for ScreenCast/Screenshot; the gtk backend
  # serves the FileChooser/OpenURI/Notification/etc routes.
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  libnotify       # `notify-send` from the config-reload toast path
  grim            # `mscreenshot` capture pipeline
  slurp
  wl-clipboard
  mpv             # `mplay`: window control + libmpv.so for the wallpaper engine
  # ── mshell (gtk4 + relm4) ───────────────────────────────────────
  gtk4
  gtk4-layer-shell
  gdk-pixbuf2
  graphene
  fontconfig
  freetype2
  # GStreamer playback — media widget (album art, sound previews)
  gstreamer
  gst-plugins-base
  gst-plugins-base-libs
  gst-plugins-good
  # Audio output paths — rodio backend + wayle-audio
  alsa-lib
  libpulse
  pipewire
)
makedepends=(
  rust
  cargo
  clang           # bindgen for some C-FFI crates (lutgen, pam)
  pkg-config
  git
  wayland-protocols
  # Headers needed at build time even though the linked libs come
  # from the runtime `depends` set above.
  gtk4-layer-shell
)
optdepends=(
  # Sessions & XDG plumbing
  "xdg-desktop-portal-wlr: alternative wlroots-native screencast backend (not used by default; margo-portal serves ScreenCast/Screenshot natively)"
  # Toolkit Wayland backends (for non-GTK apps under margo)
  "qt5-wayland: Qt5 native Wayland backend"
  "qt6-wayland: Qt6 native Wayland backend"
  # Capture & recording (beyond grim+slurp+wl-clipboard above)
  "swappy: post-capture annotation editor for mscreenshot"
  "satty: alternative annotation editor for mscreenshot"
  "wf-recorder: screen recording via wlr-screencopy"
  "yt-dlp: \`mplay play\`/\`download\` of YouTube + other streaming URLs"
  "playerctl: MPRIS media control for \`mplay media\` (Spotify/VLC/browsers)"
  "mpc: MPD control for \`mplay media\`"
  # Clipboard managers — mshell clipboard widget + mshellshare paste
  "copyq: clipboard manager via wlr-data-control"
  "wl-clip-persist: keep clipboard alive after the producer exits"
  # mshell plugin widgets (nip / ndns / nufw / npodman). Each
  # degrades gracefully when its tool is missing; the deps live
  # here so an `optdepends` install pulls a complete experience.
  "networkmanager: NetworkManager backend for mshell network + ndns"
  "bluez: Bluez backend for mshell bluetooth widget"
  "upower: UPower backend for mshell battery widget"
  "power-profiles-daemon: power profile switching for mshell + the mpower auto-profile service"
  "brightnessctl: brightness fallback when DDC/CI is unavailable"
  "iwd: alternative wireless backend for the network widget"
  "ufw: needed by the mshell nufw firewall widget"
  "podman: needed by the mshell npodman widget"
  "mullvad-vpn: the VPN daemon driven by the mvpn binary (CLI + GTK panel)"
  "blocky: local DNS resolver controlled by the ndns widget"
  "curl: used by the nip public-IP widget (already pulled by base)"
  # mlogind (TUI login manager)
  "fprintd: opt-in fingerprint login for mlogind (pam_fprintd)"
)
# `provides` exposes the legacy compositor- and mshell-only package
# names that older AUR helpers may pin. `conflicts` makes the
# previous "shell-bundled" variants installable as drop-in
# replacements.
provides=(
  "margo=$pkgver"
  "wayland-compositor"
  "mshell=$pkgver"
  "margo-mshell-git=$pkgver"
)
conflicts=(
  "margo"
  "margo-mshell-git"
  "mshell"
)
# mlogind's config / PAM / xsetup are real config files (like any
# display manager's): ship them to /etc but mark them backup so a
# user's edits survive upgrades (pacman writes .pacnew instead of
# clobbering).
backup=(
  "etc/mlogind/config.toml"
  "etc/mlogind/variables.toml"
  "etc/pam.d/mlogind"
  "etc/pam.d/mlogind-greeter"
  "etc/mlogind/xsetup.sh"
)
# Cargo profile already enables thin LTO; the outer makepkg LTO
# pass would just spend time twice. `!strip` preserves the symbol
# tables so `coredumpctl info` / `addr2line` can resolve mesa-side
# render aborts. The Cargo release profile sets `strip = "none"`;
# this line keeps makepkg's outer strip from overriding it.
options=(!lto !strip)
source=("git+${url}.git#branch=main")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/margo"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/margo"
  # Pre-fetch all dependencies so build() can run offline and
  # fails early if Cargo.lock has drifted from the workspace
  # manifest.
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/margo"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/target"

  # `--remap-path-prefix` rewrites the build dir to `/build` in
  # the embedded debug strings; otherwise pacman warns about a
  # reference to `$srcdir` in the installed binary.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
  # `--remap-path-prefix` only touches rustc — build scripts that
  # spawn the C compiler via `cc-rs` (e.g. `libspa-sys`, which
  # generates `static_fns.c` for PipeWire bindings) bake their
  # OUT_DIR's absolute path into the resulting object's debug
  # info via gcc/clang's own path encoding. Mirror the remap on
  # the C side with `-ffile-prefix-map` so makepkg's "reference
  # to $srcdir" check stays clean.
  export CFLAGS="${CFLAGS:-} -ffile-prefix-map=$srcdir=/build"
  export CXXFLAGS="${CXXFLAGS:-} -ffile-prefix-map=$srcdir=/build"

  # Two invocations on purpose — do NOT collapse back to a single
  # `--workspace` build. The shell-side crates pull the `wayle-*`
  # transitively (via `mshell-services`), which enables `zbus`'s
  # `tokio` feature. With a `--workspace` build — or any
  # invocation that mixes shell-side crates with the compositor
  # — Cargo's per-invocation feature unification turns on
  # `zbus/tokio` for the shared zbus artifact, and the compositor
  # links against it. margo drives zbus over `async-io` and
  # never enters a Tokio runtime, so zbus's tokio executor
  # panics at startup ("there is no reactor running, must be
  # called from the context of a Tokio 1.x runtime") and the
  # session dies. Splitting the invocations is enough to keep
  # the feature graphs isolated because Cargo only unifies
  # features within a single `cargo build` resolution.
  #
  # *** Crucial: mpicker belongs in the SHELL invocation, NOT
  # the compositor one. mpicker depends on `mshell-screenshot`,
  # which depends on `mshell-services` → `wayle-*` → zbus/tokio.
  # Putting it in the compositor build group re-contaminates
  # margo via feature unification even though mpicker itself
  # doesn't talk to D-Bus.
  # mlogind joins the compositor group: it's a TUI (ratatui + pam +
  # uzers) with NO zbus/tokio in its graph, so it can't contaminate
  # margo's zbus(async-io) artifact via feature unification.
  # mpower likewise: it's a tiny poller (serde + toml + anyhow, shells
  # out to powerprofilesctl) with no zbus/tokio, so it's safe here too.
  cargo build --frozen --release \
    -p margo -p start-margo \
    -p mctl -p mlock -p mlayout -p mscreenshot -p mvisual -p mlogind -p mpower -p mplay \
    -p mdots -p mcal

  # mshell trio + mpicker + mwizard. mpicker pulls
  # mshell-screenshot (→ wayle-* → zbus/tokio), so it has to
  # live with the rest of the tokio-using stack to keep
  # feature unification from leaking back into margo's build.
  # mwizard depends on mshell-config to write the shell
  # profile, so it builds alongside the rest of the shell stack.
  #
  # `--features mshell/wasm-plugins` builds mshell with the sandboxed
  # in-shell WASM plugin panels (mplugins WASM tier — e.g. the
  # assistant-panel chat). It pulls wasmtime, so it's opt-in upstream;
  # we turn it on here so the packaged shell ships the panels. The
  # feature lives only in mshell's graph (mshell → mshell-core →
  # mshell-frame), so mpicker/mwizard/margo-portal are unaffected.
  #
  # mvpn (Mullvad VPN CLI + GTK4 layer-shell panel) builds here too — it
  # links gtk4/gtk4-layer-shell like the rest of the shell stack, so it
  # shares that feature resolution rather than leaking GTK into margo's graph.
  # mgreet (native GTK4 + gtk4-layer-shell login greeter, launched by
  # mlogind's `[display] host = "gui"`) builds here too — it links the same
  # gtk4/gtk4-layer-shell stack as the shell, so it shares that resolution
  # rather than leaking GTK into margo's (zbus-only, no-tokio) graph.
  cargo build --frozen --release \
    --features mshell/wasm-plugins \
    -p mshell -p mshellctl -p mshellshare -p mpicker -p mwizard \
    -p mkeys -p mvpn -p mgreet \
    -p margo-portal
}

check() {
  cd "$srcdir/margo"

  # Only the library + CLI crates have unit tests we can run from
  # a packager environment; the compositor + mshell want a live
  # Wayland session. Test failures are non-blocking — surface
  # them as warnings but let pacman still ship the build.
  cargo test --frozen --release \
    --package margo-config \
    --package margo-layouts \
    --package mctl \
    --package mlayout \
    --package mdots \
    --package mcal ||
    echo "::: margo: test suite reported failures (non-blocking)"
}

package() {
  cd "$srcdir/margo"

  # ── Binaries ─────────────────────────────────────────────────────
  # All binaries land in the same target dir; the split in
  # `build()` is about isolating the *feature graphs* (so margo
  # stays linked against a zbus without tokio), not the output
  # paths. Cargo's per-invocation rlib hashing means the second
  # invocation builds its own zbus(async-io+tokio) artifact
  # without overwriting the first invocation's zbus(async-io)
  # rlib — both coexist in target/release/deps under different
  # hashes, and each binary links against the right one.
  local bin
  for bin in \
      margo start-margo \
      mctl mlock mlayout mscreenshot mvisual mlogind mgreet mpower mplay \
      mshell mshellctl mshellshare mpicker mwizard mkeys mvpn mdots mcal; do
    install -Dm755 "$CARGO_TARGET_DIR/release/$bin" "$pkgdir/usr/bin/$bin"
  done

  # ── Wayland session entries ────────────────────────────────────
  # Display managers (gdm, sddm, ly, greetd-tuigreet) pick these up
  # from the canonical wayland-sessions location.
  #
  # Only ONE entry is offered at the login chooser: the uwsm-managed
  # session (installed just below). uwsm is a hard dependency, so it is
  # always present; the entry runs the compositor inside a transient
  # systemd scope (clean teardown at logout, proper
  # graphical-session.target wiring — and it is that target activating
  # which starts mshell + the rest of the user session).
  #
  # The plain `Exec=margo` entry is deliberately NOT installed as a
  # session: picked from the DM it brings up a bare compositor with no
  # shell (nothing activates graphical-session.target, so mshell.service
  # is never pulled in), which reads to users as "margo is broken". It
  # is kept under doc/ for manual / no-systemd launching only.
  install -Dm644 "margo.desktop" \
    "$pkgdir/usr/share/doc/$pkgname/sessions/margo-bare.desktop"

  # uwsm session entry + the two wrapper scripts it chains through:
  #   margo-uwsm-session  → uwsm start … -- margo-session
  #   margo-session       → start-margo (watchdog) → margo
  # Both resolve each other (and start-margo / margo) via PATH, so
  # /usr/bin is enough. The contrib .desktop's Exec= uses the
  # manual-install /usr/local/bin path; rewrite it to the packaged
  # /usr/bin location.
  install -Dm755 "contrib/sessions/margo-uwsm-session" \
    "$pkgdir/usr/bin/margo-uwsm-session"
  install -Dm755 "contrib/sessions/margo-session" \
    "$pkgdir/usr/bin/margo-session"
  sed 's|/usr/local/bin/|/usr/bin/|' "contrib/sessions/margo-uwsm.desktop" \
    > "margo-uwsm.desktop.pkg"
  install -Dm644 "margo-uwsm.desktop.pkg" \
    "$pkgdir/usr/share/wayland-sessions/margo-uwsm.desktop"

  # uwsm session env: restore the standard XDG user-binary dirs that
  # uwsm's POSIX-login-shell env rebuild drops. uwsm searches the XDG
  # config hierarchy (XDG_CONFIG_DIRS → /etc/xdg) for env-${compositor}
  # and exports it into the activation environment, so `uwsm app`
  # launches (keybinds, autostarts) can resolve ~/.local/bin tools.
  # Per-user overrides still go in ~/.config/uwsm/env (higher priority).
  install -Dm644 "contrib/sessions/uwsm-env-margo" \
    "$pkgdir/etc/xdg/uwsm/env-margo"

  # ── Icon ───────────────────────────────────────────────────────
  if [[ -f "docs/assets/margo-icon.svg" ]]; then
    install -Dm644 "docs/assets/margo-icon.svg" \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/margo.svg"
    install -Dm644 "docs/assets/margo-icon.svg" \
      "$pkgdir/usr/share/pixmaps/margo.svg"
  fi

  # ── MargoMaterial icon theme bundle ────────────────────────────
  # mshell's default `theme.icons.shell_icon_theme = "MargoMaterial"`
  # is a margo-branded Material Design symbolic icon set. The base
  # set was forked from the now-defunct `okshell` project (MIT-
  # licensed) and renamed when the bundle grew beyond what OkShell
  # shipped — bar pills now need firewall, vpn, shield-check,
  # globe, package, server, software-update, drive-harddisk,
  # temperature etc., none of which exist in Adwaita / kora /
  # Papirus by default.
  if [[ -d "assets/icons/MargoMaterial" ]]; then
    install -d "$pkgdir/usr/share/icons/MargoMaterial"
    cp -a assets/icons/MargoMaterial/. \
      "$pkgdir/usr/share/icons/MargoMaterial/"
  fi

  # ── Man pages ──────────────────────────────────────────────────
  # Hand-written roff for the compositor + the two IPC clients
  # (margo / mctl / mshellctl). Section 1.
  local manpage
  for manpage in man/*.1; do
    [[ -f "$manpage" ]] || continue
    install -Dm644 "$manpage" \
      "$pkgdir/usr/share/man/man1/$(basename "$manpage")"
  done

  # ── Example compositor configs / docs ──────────────────────────
  install -Dm644 "margo/src/config.example.conf" \
    "$pkgdir/usr/share/doc/$pkgname/config.example.conf"
  if [[ -f "contrib/scripts/init.example.rhai" ]]; then
    install -Dm644 "contrib/scripts/init.example.rhai" \
      "$pkgdir/usr/share/doc/$pkgname/init.example.rhai"
  fi

  # ── mlayout example profiles ───────────────────────────────────
  # `mlayout set <name>` resolves `~/.config/margo/layout_<name>
  # .conf` — these are starter profiles users can copy + tweak.
  if [[ -f "mlayout/README.md" ]]; then
    install -Dm644 "mlayout/README.md" \
      "$pkgdir/usr/share/doc/$pkgname/mlayout.md"
  fi
  local layout
  for layout in mlayout/examples/layout_*.conf; do
    [[ -f "$layout" ]] || continue
    install -Dm644 "$layout" \
      "$pkgdir/usr/share/doc/$pkgname/layouts/$(basename "$layout")"
  done

  # ── mshell starter profiles (Default / Nova) ───────────────────
  # Shipped to a stable runtime path so the setup wizard can offer
  # them on first run and copy the chosen one into the user's
  # `~/.config/margo/mshell/profiles/`. "default" is a clean minimal
  # base; "Nova" is the full-featured showcase.
  local profile
  for profile in mshell/examples/profiles/*.yaml; do
    [[ -f "$profile" ]] || continue
    install -Dm644 "$profile" \
      "$pkgdir/usr/share/margo/mshell/profiles/$(basename "$profile")"
  done

  # ── Default wallpaper (mlock fallback) ─────────────────────────
  # `mlock` resolves the lock-screen wallpaper from state.json
  # first, then `~/.local/share/margo/wallpapers/default.jpg`,
  # then this system-wide default.
  if [[ -f "assets/wallpapers/default.jpg" ]]; then
    install -Dm644 "assets/wallpapers/default.jpg" \
      "$pkgdir/usr/share/margo/wallpapers/default.jpg"
  fi

  # ── Bundled default desktop wallpaper (margo brand) ────────────
  # Shown by the shell when no wallpaper directory is configured
  # yet (and offered as the first tile in the Wallpaper menu);
  # resolved at runtime from /usr/share/margo/wallpapers/.
  if [[ -f "assets/wallpapers/margo-hero.png" ]]; then
    install -Dm644 "assets/wallpapers/margo-hero.png" \
      "$pkgdir/usr/share/margo/wallpapers/margo-hero.png"
  fi

  # ── XDG desktop-portal preferences ─────────────────────────────
  # xdg-desktop-portal reads `<desktop>-portals.conf` when
  # XDG_CURRENT_DESKTOP matches the file's stem. Path is
  # canonical — /usr/share/doc/ does NOT work as a fallback.
  if [[ -f "assets/margo-portals.conf" ]]; then
    install -Dm644 "assets/margo-portals.conf" \
      "$pkgdir/usr/share/xdg-desktop-portal/margo-portals.conf"
  fi

  # ── Native portal backend (margo-portal) ───────────────────────
  # Serves ScreenCast (window + monitor share) and Screenshot, so
  # margo-portals.conf routes both to `margo` with no GNOME portal.
  # Capture is the compositor's own (Mutter / Shell.Screenshot shim
  # → PipeWire / PNG). Binary lives under /usr/lib (D-Bus-activated,
  # not a user-facing CLI); ships its `.portal` registration, D-Bus
  # activation service, and systemd user unit.
  install -Dm755 "$CARGO_TARGET_DIR/release/margo-portal" \
    "$pkgdir/usr/lib/margo/margo-portal"
  install -Dm644 "assets/margo.portal" \
    "$pkgdir/usr/share/xdg-desktop-portal/portals/margo.portal"
  install -Dm644 "assets/dbus/org.freedesktop.impl.portal.desktop.margo.service" \
    "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.margo.service"
  install -Dm644 "assets/margo-portal.service" \
    "$pkgdir/usr/lib/systemd/user/margo-portal.service"

  # ── mshell desktop-shell user service ──────────────────────────
  # Starts mshell (the bar / menus / notifications) when a margo
  # graphical session comes up. uwsm reaches graphical-session.target
  # once the compositor is live (margo imports WAYLAND_DISPLAY into the
  # systemd user env); the unit's ConditionEnvironment gates it to a
  # margo session so the auto-start drop-in below can't fire under
  # other desktops. A user's own ~/.config/systemd/user/mshell.service
  # still overrides this packaged one.
  install -Dm644 "assets/mshell.service" \
    "$pkgdir/usr/lib/systemd/user/mshell.service"
  # Auto-enable: pull mshell into graphical-session.target for every user
  # without a per-user `systemctl --user enable` (the ConditionEnvironment
  # guards keep it margo-only).
  install -d "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants"
  ln -sf "../mshell.service" \
    "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants/mshell.service"

  # ── mpower auto power-profile user service ─────────────────────
  # Drives power-profiles-daemon from CPU load + AC/battery. Same
  # auto-enable + gating pattern as mshell: shipped enabled into
  # graphical-session.target, with ConditionEnvironment=XDG_CURRENT_DESKTOP=margo
  # keeping it margo-only so it never fights another compositor's
  # auto-profile tool over powerprofilesctl. A user's own
  # ~/.config/systemd/user/mpower.service still overrides this one.
  install -Dm644 "mpower/mpower.service" \
    "$pkgdir/usr/lib/systemd/user/mpower.service"
  ln -sf "../mpower.service" \
    "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants/mpower.service"

  # ── Session integration reference ──────────────────────────────
  # The uwsm .desktop + wrapper scripts above are installed live (to
  # wayland-sessions and /usr/bin). The full set is also dropped
  # under /usr/share/doc as reference — including the README and the
  # optional `wayland-wm@margo-session.service.d/10-session-lifecycle
  # .conf` drop-in, which is left for the user to opt into (it sets
  # MARGO_LOG + the session-target fan-out and is environment-specific).
  if [[ -d "contrib/sessions" ]]; then
    install -d "$pkgdir/usr/share/doc/$pkgname/sessions"
    cp -a contrib/sessions/. "$pkgdir/usr/share/doc/$pkgname/sessions/"
  fi

  # ── mctl + mshellctl shell completions ─────────────────────────
  # Hand-curated under contrib/completions/. The mctl set extends
  # the clap-derived subcommand layer with dispatch-action names
  # (`mctl actions --names`), layout names, and output names. The
  # mshellctl set adds live plugin-key completion against
  # `mshellctl plugin list --names` for `menu plugin <KEY>`,
  # `plugin reload <KEY>`, and `plugin keybind <KEY>`.
  if [[ -f "contrib/completions/mctl.bash" ]]; then
    install -Dm644 "contrib/completions/mctl.bash" \
      "$pkgdir/usr/share/bash-completion/completions/mctl"
  fi
  if [[ -f "contrib/completions/_mctl" ]]; then
    install -Dm644 "contrib/completions/_mctl" \
      "$pkgdir/usr/share/zsh/site-functions/_mctl"
  fi
  if [[ -f "contrib/completions/mctl.fish" ]]; then
    install -Dm644 "contrib/completions/mctl.fish" \
      "$pkgdir/usr/share/fish/vendor_completions.d/mctl.fish"
  fi
  if [[ -f "contrib/completions/mshellctl.bash" ]]; then
    install -Dm644 "contrib/completions/mshellctl.bash" \
      "$pkgdir/usr/share/bash-completion/completions/mshellctl"
  fi
  if [[ -f "contrib/completions/_mshellctl" ]]; then
    install -Dm644 "contrib/completions/_mshellctl" \
      "$pkgdir/usr/share/zsh/site-functions/_mshellctl"
  fi
  if [[ -f "contrib/completions/mshellctl.fish" ]]; then
    install -Dm644 "contrib/completions/mshellctl.fish" \
      "$pkgdir/usr/share/fish/vendor_completions.d/mshellctl.fish"
  fi
  if [[ -f "contrib/completions/mdots.bash" ]]; then
    install -Dm644 "contrib/completions/mdots.bash" \
      "$pkgdir/usr/share/bash-completion/completions/mdots"
  fi
  if [[ -f "contrib/completions/_mdots" ]]; then
    install -Dm644 "contrib/completions/_mdots" \
      "$pkgdir/usr/share/zsh/site-functions/_mdots"
  fi
  if [[ -f "contrib/completions/mdots.fish" ]]; then
    install -Dm644 "contrib/completions/mdots.fish" \
      "$pkgdir/usr/share/fish/vendor_completions.d/mdots.fish"
  fi

  # ── mshell sound assets ────────────────────────────────────────
  # OGG samples used by mshell-osd / mshell-services for volume /
  # battery / power / camera / timer notification cues. Resolved
  # at runtime from /usr/share/mshell/sounds/.
  local sound_src="mshell-crates/mshell-sounds/assets"
  if [[ -d "$sound_src" ]]; then
    install -d "$pkgdir/usr/share/mshell/sounds"
    local snd
    for snd in "$sound_src"/*.ogg; do
      [[ -f "$snd" ]] || continue
      install -Dm644 "$snd" \
        "$pkgdir/usr/share/mshell/sounds/$(basename "$snd")"
    done
  fi

  # ── mshell SCSS theme bundle ───────────────────────────────────
  # Ship the SCSS sources so the user can fork them under
  # ~/.config/mshell/styles/ — mshell-style picks up overrides at
  # startup. The compiled CSS is baked into the binary via
  # `include_str!`, so this is for customisation, not load-bearing.
  if [[ -d "mshell-crates/mshell-style/scss" ]]; then
    install -d "$pkgdir/usr/share/mshell/scss"
    cp -a mshell-crates/mshell-style/scss/. \
      "$pkgdir/usr/share/mshell/scss/"
  fi

  # ── Default mshell profile config ──────────────────────────────
  # Annotated example users can copy into
  # `~/.config/mshell/profiles/default.yaml`. mshell falls back to
  # compiled-in defaults when no profile is found; this is starter
  # material, not load-bearing.
  local mshell_profile_example=""
  for candidate in \
      "mshell-crates/mshell-config/profiles/default.yaml" \
      "mshell/profiles/default.yaml" \
      "contrib/mshell/profiles/default.yaml"; do
    if [[ -f "$candidate" ]]; then
      mshell_profile_example="$candidate"
      break
    fi
  done
  if [[ -n "$mshell_profile_example" ]]; then
    install -Dm644 "$mshell_profile_example" \
      "$pkgdir/usr/share/doc/$pkgname/mshell/profile.example.yaml"
  fi

  # ── mshell desktop entry ───────────────────────────────────────
  # Meant to be started by uwsm / margo from the session target.
  # Shipped under /usr/share/doc/ so distro packagers / users can
  # choose to wire autostart vs leave it to margo. NOT installed
  # under /etc/xdg/autostart by default.
  for entry in \
      "mshell/contrib/mshell.desktop" \
      "contrib/mshell/mshell.desktop" \
      "mshell-crates/mshell-session/assets/mshell.desktop"; do
    if [[ -f "$entry" ]]; then
      install -Dm644 "$entry" \
        "$pkgdir/usr/share/doc/$pkgname/mshell/mshell.desktop"
      break
    fi
  done

  # ── Developer / packager documentation ─────────────────────────
  local doc
  for doc in README.md CHANGELOG.md road_map.md CONTRIBUTING.md; do
    [[ -f "$doc" ]] || continue
    install -Dm644 "$doc" "$pkgdir/usr/share/doc/$pkgname/$doc"
  done

  # mshell-specific docs — surface them under the main package doc
  # tree so `pacman -Qpl` shows them.
  for mshell_doc in \
      "mshell/README.md" \
      "mshell-crates/mshell-core/README.md"; do
    [[ -f "$mshell_doc" ]] || continue
    install -Dm644 "$mshell_doc" \
      "$pkgdir/usr/share/doc/$pkgname/mshell/$(basename "$mshell_doc")"
  done

  # ── mlogind (TUI login manager) ────────────────────────────────
  # Ship config + PAM + systemd unit to their real locations, like
  # any display manager (lemurs does the same). Everything here is a
  # NEW, mlogind-owned path — installing it clobbers nothing (the PAM
  # file just `include`s the system `login` stack) and stays inert
  # until the admin runs `systemctl enable mlogind`. Config files are
  # in backup=() so user edits survive upgrades. The package never
  # auto-enables a DM or touches your current one — see NOTE.
  install -Dm644 "mlogind/extra/config.toml" \
    "$pkgdir/etc/mlogind/config.toml"
  install -Dm644 "mlogind/extra/variables.toml" \
    "$pkgdir/etc/mlogind/variables.toml"
  install -Dm644 "mlogind/extra/mlogind.pam" \
    "$pkgdir/etc/pam.d/mlogind"
  # The greeter runs as an unprivileged system user and gets its logind
  # session (and therefore its DRM node) from this PAM stack. It
  # authenticates nothing — pam_permit — so installing it grants no
  # login. pacman's systemd-sysusers hook creates the user for us.
  install -Dm644 "mlogind/extra/mlogind-greeter.pam" \
    "$pkgdir/etc/pam.d/mlogind-greeter"
  install -Dm644 "mlogind/extra/mlogind.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/mlogind.conf"
  # Not on the greeter's own path (its power keys go through the root
  # session runner over the mlogind-proto socket) — this is for anything
  # else running inside the greeter's session. GDM and SDDM ship the same.
  install -Dm644 "mlogind/extra/60-mlogind-greeter.rules" \
    "$pkgdir/usr/share/polkit-1/rules.d/60-mlogind-greeter.rules"
  install -Dm755 "mlogind/extra/xsetup.sh" \
    "$pkgdir/etc/mlogind/xsetup.sh"
  # Session-script dirs mlogind scans (config.toml: scripts_path);
  # ship them empty so the paths exist out of the box.
  install -d "$pkgdir/etc/mlogind/wayland" "$pkgdir/etc/mlogind/wms"
  # systemd unit (defaults to tty2 + Alias=display-manager.service).
  # NOT enabled by the package.
  install -Dm644 "mlogind/extra/mlogind.service" \
    "$pkgdir/usr/lib/systemd/system/mlogind.service"
  # Supervised margo session entry (Exec=start-margo) — optional,
  # kept under doc/ so it doesn't duplicate the bare margo.desktop.
  install -Dm644 "mlogind/extra/sessions/margo.desktop" \
    "$pkgdir/usr/share/doc/$pkgname/mlogind/margo-supervised.desktop"
  install -Dm644 "mlogind/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/mlogind/README.md"

  # ── Licenses ───────────────────────────────────────────────────
  # margo's own license at the root; upstream attributions in
  # licenses/ (mango/dwl/dwm — compositor lineage; OkShell — shell
  # fork; niri/noctalia — ported code). All are shipped so downstream
  # attribution is preserved on every install.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  local lic
  for lic in licenses/*; do
    [[ -f "$lic" ]] || continue
    install -Dm644 "$lic" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$lic")"
  done
  # mlogind is a fork of lemurs (MIT OR Apache-2.0 by Gijs Burghoorn);
  # preserve its dual-license attribution.
  for lic in mlogind/LICENSE-MIT mlogind/LICENSE-APACHE; do
    [[ -f "$lic" ]] || continue
    install -Dm644 "$lic" \
      "$pkgdir/usr/share/licenses/$pkgname/mlogind-$(basename "$lic")"
  done
}

# NOTE — manual one-time setup the package does NOT perform:
#   • PAM service for mlock: create /etc/pam.d/mlock (e.g. one line
#     `auth include system-auth`) so mlock can authenticate the
#     session owner. Not shipped here to avoid clobbering a local
#     PAM stack; `mlock --help` prints the recipe.
#   • mshell first-launch: copy
#     /usr/share/doc/margo-git/mshell/profile.example.yaml to
#     ~/.config/mshell/profiles/default.yaml and edit the
#     weather_location_query / icon theme / clock format fields.
#   • Autostart: either let margo's `exec_once` in config.conf
#     spawn `mshell` for you, or symlink the example desktop file
#     into ~/.config/autostart/.
#   • mlogind (TUI login manager) — config, PAM, and the systemd unit
#     ARE installed (/etc/mlogind/, /etc/pam.d/mlogind,
#     /usr/lib/systemd/system/mlogind.service) but, like any DM, it is
#     NOT auto-enabled — switching your login manager is a deliberate
#     admin step:
#       sudo systemctl disable --now <your-current-dm>   # e.g. lemurs/gdm/sddm
#       sudo systemctl enable mlogind                    # tty2 by default
#     For a non-default VT add a drop-in (mlogind ships tty2;
#     mirror your old DM's tty drop-in under
#     /etc/systemd/system/mlogind.service.d/). Test first with
#     `mlogind --preview`; match the wallpaper with
#     `sudo mlogind sync-theme`. Keep your old DM installed as a
#     fallback until a clean reboot.

# vim:set sw=2 et:
