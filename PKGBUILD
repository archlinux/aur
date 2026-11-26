# Maintainer: Loom packaging <packaging@loom.invalid>
#
# Split package for Loom, a niri-based desktop ecosystem. One source checkout
# and one build() produce every subpackage.
#
#   loom-niri          compositor with its own XDG paths; coexists with niri
#   loom-niri-replace  compositor installed as niri; conflicts with niri
#   loom-portal        standalone Screenshot/ScreenCast portal backend
#   loom-companion     automation/parking daemon and loomctl
#   loom-monitor       output profiles
#   loom-session       named workspace/window/output contexts
#   loom-shot          screenshot capture
#   loom-wallpaper     per-workspace wallpaper scenes
#   loom-settings      GTK4 settings UI and loom-settingsctl
#   loom-audio         rule-based PipeWire audio routing
#   loom-sidepanels    layer-shell panels
#   loom-noctalia-plugins  Noctalia plugin source
#   loom-desktop       meta package depending on the coexisting compositor
#
# loom-niri installs /usr/bin/loom-niri and its own session/portal/service
# files. loom-niri-replace installs the niri names and therefore provides and
# conflicts with niri. The two can be installed together but only one can run
# as the DRM session.

pkgbase=loom-niri-git
pkgname=(
  loom-niri-git
  loom-niri-replace-git
  loom-portal-git
  loom-companion-git
  loom-monitor-git
  loom-session-git
  loom-shot-git
  loom-wallpaper-git
  loom-settings-git
  loom-audio-git
  loom-sidepanels-git
  loom-tui-git
  loom-noctalia-plugins-git
  loom-desktop-git
)
_pkgname=loom-niri
pkgver=0
pkgrel=1
pkgdesc="Loom: a connected desktop ecosystem built around niri"
arch=(x86_64 aarch64)
url="https://github.com/fram446742/loom-niri"
license=(GPL-3.0-or-later)
makedepends=(cairo clang gcc git glib2 gtk4 libadwaita libdisplay-info libdrm libglvnd libinput libpipewire libxkbcommon mesa pango pixman pkgconf rust seatd systemd-libs vulkan-icd-loader wayland)

_app_manifests=(
  loom-portal
  loom-companion
  loom-monitor
  loom-session
  loom-shot
  loom-wallpaper
  loom-settings
  loom-audio
  loom-sidepanels
  loom-tui
)

source=(
  "${_pkgname}::git+${url}.git#branch=main"
  loom-settings.desktop
  loom-desktop-git.README.md
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${_pkgname}"

  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "${_pkgname}"

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
  export LIBCLANG_PATH=/usr/lib
  # Arch enables GCC LTO in CFLAGS. Rust links C objects with its own linker,
  # which cannot consume GCC LTO archives (libspa-rs-reexports is the first one
  # that fails). Keep the hardening flags but drop LTO for the C dependencies.
  export CFLAGS="${CFLAGS//-flto=auto/}"
  export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
  export NIRI_BUILD_COMMIT="$(git rev-parse --short HEAD)"

  cargo build --frozen --release -p niri

  local manifest
  for manifest in "${_app_manifests[@]}"; do
    cargo build --frozen --release --manifest-path "${manifest}/Cargo.toml"
  done
}

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

_install_compositor_docs() {
  local pkg=$1
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkg}/README.md"
  install -Dm644 docs/HDR.md "${pkgdir}/usr/share/doc/${pkg}/HDR.md"
  install -Dm644 resources/default-config.kdl \
    "${pkgdir}/usr/share/doc/${pkg}/default-config.kdl"
  _install_license "$pkg"
}

_install_compositor_completions() {
  local bin=$1
  local target="${srcdir}/target/release"
  local shell
  for shell in bash fish zsh nushell; do
    "${target}/${bin}" completions "${shell}" > "${srcdir}/${bin}.${shell}"
  done
  install -Dm644 "${srcdir}/${bin}.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/${bin}"
  install -Dm644 "${srcdir}/${bin}.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/${bin}.fish"
  install -Dm644 "${srcdir}/${bin}.zsh" \
    "${pkgdir}/usr/share/zsh/site-functions/_${bin}"
  install -Dm644 "${srcdir}/${bin}.nushell" \
    "${pkgdir}/usr/share/nushell/completions/${bin}.nu"
}

_compositor_depends=(
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

_compositor_optdepends=(
  'xdg-desktop-portal: portal broker'
  'xdg-desktop-portal-gtk: file chooser, notifications and fallback portals'
  'xdg-desktop-portal-gnome: fallback ScreenCast backend'
  'dbus: dbus-update-activation-environment used by the session script'
  'systemd: systemctl, loginctl and busctl for session and idle integration'
  'pipewire: screencasting server'
  'wireplumber: PipeWire session manager'
  'libnotify: notify-send for user hooks and scripts'
  'alacritty: terminal in the default configuration'
  'fuzzel: application launcher in the default configuration'
  'mako: notification daemon'
  'waybar: panel used by the default configuration'
  'swaylock: screen locker in the default configuration'
  'polkit-gnome: authentication agent for privileged applications'
  'xwayland-satellite: run X11 applications in XWayland'
  'vulkan-radeon: Vulkan driver for AMD GPUs'
  'vulkan-intel: Vulkan driver for Intel GPUs'
  'nvidia-utils: GL/Vulkan driver for NVIDIA GPUs'
)

package_loom-niri-git() {
  pkgdesc="niri-based compositor for Loom, coexisting with niri"
  depends=("${_compositor_depends[@]}")
  optdepends=("${_compositor_optdepends[@]}")
  provides=("loom-niri=$pkgver" wayland-compositor xdg-desktop-portal-impl)
  options=(!strip)

  cd "${_pkgname}"
  local target="${srcdir}/target/release"

  install -Dm755 "${target}/loom-niri" "${pkgdir}/usr/bin/loom-niri"
  install -Dm755 resources/loom-niri-session "${pkgdir}/usr/bin/loom-niri-session"
  install -Dm644 resources/loom-niri.desktop \
    "${pkgdir}/usr/share/wayland-sessions/loom-niri.desktop"
  install -Dm644 resources/loom-niri.portal \
    "${pkgdir}/usr/share/xdg-desktop-portal/portals/loom-niri.portal"
  install -Dm644 resources/loom-niri-portals.conf \
    "${pkgdir}/usr/share/xdg-desktop-portal/loom-niri-portals.conf"
  install -Dm644 resources/loom-niri.service \
    "${pkgdir}/usr/lib/systemd/user/loom-niri.service"
  install -Dm644 resources/loom-niri-shutdown.target \
    "${pkgdir}/usr/lib/systemd/user/loom-niri-shutdown.target"

  _install_compositor_docs loom-niri-git
  _install_compositor_completions loom-niri
}

package_loom-niri-replace-git() {
  pkgdesc="niri-based compositor for Loom, installed as niri"
  depends=("${_compositor_depends[@]}")
  optdepends=("${_compositor_optdepends[@]}")
  provides=("niri=$pkgver" "loom-niri-replace=$pkgver" wayland-compositor xdg-desktop-portal-impl)
  conflicts=(niri niri-git)
  options=(!strip)

  cd "${_pkgname}"
  local target="${srcdir}/target/release"

  install -Dm755 "${target}/niri" "${pkgdir}/usr/bin/niri"
  install -Dm755 resources/niri-session "${pkgdir}/usr/bin/niri-session"
  install -Dm644 resources/niri.desktop \
    "${pkgdir}/usr/share/wayland-sessions/niri.desktop"
  install -Dm644 resources/niri.portal \
    "${pkgdir}/usr/share/xdg-desktop-portal/portals/niri.portal"
  install -Dm644 resources/niri-portals.conf \
    "${pkgdir}/usr/share/xdg-desktop-portal/niri-portals.conf"
  install -Dm644 resources/niri.service "${pkgdir}/usr/lib/systemd/user/niri.service"
  install -Dm644 resources/niri-shutdown.target \
    "${pkgdir}/usr/lib/systemd/user/niri-shutdown.target"

  _install_compositor_docs loom-niri-replace-git
  _install_compositor_completions niri
}

package_loom-portal-git() {
  _install_completions loom-portal
  _install_completions loom-portal-picker
  pkgdesc="Standalone Screenshot/ScreenCast portal backend for Loom"
  depends=(dbus gcc-libs glibc systemd)
  optdepends=(
    'xdg-desktop-portal: broker that loads loom.portal'
    'xdg-desktop-portal-gtk: fallback for interfaces loom-portal does not implement'
  )

  cd "${_pkgname}"
  local target="${srcdir}/target/release"

  install -Dm755 "${target}/loom-portal" "${pkgdir}/usr/bin/loom-portal"
  install -Dm755 "${target}/loom-portal-picker" \
    "${pkgdir}/usr/bin/loom-portal-picker"

  install -Dm644 loom-portal/loom.portal \
    "${pkgdir}/usr/share/xdg-desktop-portal/portals/loom.portal"
  install -d "${pkgdir}/usr/lib/systemd/user"
  sed 's|@LOOM_PORTAL@|/usr/bin/loom-portal|g' \
    loom-portal/packaging/loom-portal.service \
    > "${pkgdir}/usr/lib/systemd/user/loom-portal.service"
  install -d "${pkgdir}/usr/share/dbus-1/services"
  sed 's|@LOOM_PORTAL@|/usr/bin/loom-portal|g' \
    loom-portal/packaging/org.freedesktop.impl.portal.desktop.loom.service \
    > "${pkgdir}/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.loom.service"
  chmod 644 \
    "${pkgdir}/usr/lib/systemd/user/loom-portal.service" \
    "${pkgdir}/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.loom.service"

  install -Dm644 loom-portal/packaging/portals.conf \
    "${pkgdir}/usr/share/doc/loom-portal/portals.conf.loom.example"
  _install_doc loom-portal-git loom-portal/README.md
  _install_license loom-portal-git
}

package_loom-companion-git() {
  _install_completions loom-companion
  _install_completions loomctl
  pkgdesc="Automation and parking daemon for Loom"
  depends=(gcc-libs glibc)
  optdepends=(
    'systemd: loginctl, busctl and systemctl for idle and lock actions, plus the optional user unit'
    'libpulse: pactl probe for idle detection'
    'libnotify: notify-send in user hooks'
  )

  cd "${_pkgname}"
  local target="${srcdir}/target/release"

  install -Dm755 "${target}/loom-companion" "${pkgdir}/usr/bin/loom-companion"
  install -Dm755 "${target}/loomctl" "${pkgdir}/usr/bin/loomctl"
  install -Dm644 loom-companion/packaging/loom-companion.service \
    "${pkgdir}/usr/lib/systemd/user/loom-companion.service"
  _install_doc loom-companion-git loom-companion/README.md
  _install_license loom-companion-git
}

package_loom-monitor-git() {
  _install_completions loom-monitor
  pkgdesc="Output profile save, apply and rollback for Loom"
  depends=(gcc-libs glibc)
  optdepends=('wl-mirror: apply profile mirror relations')

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/loom-monitor" \
    "${pkgdir}/usr/bin/loom-monitor"
  _install_doc loom-monitor-git loom-monitor/README.md
  _install_license loom-monitor-git
}

package_loom-session-git() {
  _install_completions loom-session
  pkgdesc="Named workspace, window and output contexts for Loom"
  depends=(gcc-libs glibc)

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/loom-session" \
    "${pkgdir}/usr/bin/loom-session"
  _install_doc loom-session-git loom-session/README.md
  _install_license loom-session-git
}

package_loom-shot-git() {
  _install_completions loom-shot
  pkgdesc="Screenshot capture for Loom with annotations and clipboard support"
  depends=(gcc-libs glibc)
  optdepends=(
    'satty: interactive annotation for loom-shot --annotate'
    'wl-clipboard: wl-copy/wl-paste for loom-shot --copy'
  )

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/loom-shot" "${pkgdir}/usr/bin/loom-shot"
  _install_doc loom-shot-git loom-shot/README.md
  _install_license loom-shot-git
}

package_loom-wallpaper-git() {
  _install_completions loom-wallpaper
  pkgdesc="Per-workspace wallpaper scenes for Loom"
  depends=(gcc-libs glibc wayland)
  optdepends=(
    'swaybg: default wallpaper command for the command backend'
    'swww: alternative wallpaper daemon for the command backend'
  )

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/loom-wallpaper" \
    "${pkgdir}/usr/bin/loom-wallpaper"
  _install_doc loom-wallpaper-git loom-wallpaper/README.md
  _install_license loom-wallpaper-git
}

package_loom-settings-git() {
  _install_completions loom-settings
  _install_completions loom-settingsctl
  pkgdesc="GTK4/libadwaita control center and CLI for Loom"
  depends=(gcc-libs glibc gtk4 libadwaita)

  cd "${_pkgname}"
  local target="${srcdir}/target/release"

  install -Dm755 "${target}/loom-settings" "${pkgdir}/usr/bin/loom-settings"
  install -Dm755 "${target}/loom-settingsctl" \
    "${pkgdir}/usr/bin/loom-settingsctl"
  install -Dm644 "${srcdir}/loom-settings.desktop" \
    "${pkgdir}/usr/share/applications/loom-settings.desktop"
  _install_doc loom-settings-git loom-settings/README.md
  _install_license loom-settings-git
}

package_loom-audio-git() {
  _install_completions loom-audio
  pkgdesc="Rule-based PipeWire audio routing for Loom"
  depends=(gcc-libs glibc libpipewire)
  optdepends=(
    'pipewire: audio server used by the native backend'
    'wireplumber: PipeWire session manager providing wpctl'
    'libpulse: pactl backend for PipeWire PulseAudio compatibility'
    'pulseaudio: alternative sound server providing pactl'
  )

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/loom-audio" "${pkgdir}/usr/bin/loom-audio"
  _install_doc loom-audio-git loom-audio/README.md
  _install_license loom-audio-git
}

package_loom-sidepanels-git() {
  _install_completions loom-sidepanels
  pkgdesc="Layer-shell panels with exclusive zones for Loom"
  depends=(cairo gcc-libs glib2 glibc wayland)
  optdepends=(
    'playerctl: media module'
    'libpulse: pactl backend for the volume module'
    'wireplumber: wpctl backend for the volume module'
    'libnotify: notify-send actions'
  )

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/loom-sidepanels" \
    "${pkgdir}/usr/bin/loom-sidepanels"
  _install_doc loom-sidepanels-git loom-sidepanels/README.md
  _install_license loom-sidepanels-git
}

package_loom-tui-git() {
  _install_completions loom-tui
  pkgdesc="Loom dashboard for outputs, workspaces and windows"
  depends=(gcc-libs glibc)
  optdepends=('loom-niri-git: live compositor state')

  cd "${_pkgname}"
  install -Dm755 "${srcdir}/target/release/loom-tui" "${pkgdir}/usr/bin/loom-tui"
  _install_doc loom-tui-git loom-tui/README.md
  _install_license loom-tui-git
}

package_loom-noctalia-plugins-git() {
  pkgdesc="Noctalia bar plugins for the Loom tools"
  arch=(any)
  depends=()
  optdepends=(
    'noctalia: shell that loads these Luau plugins'
    'loom-companion: status and action widgets'
    'loom-monitor: output profile widget'
    'loom-session: context switcher widget'
    'loom-shot: screenshot widget'
    'loom-audio: default sink widget'
    'loom-wallpaper: scene widget'
    'loom-sidepanels: panel reload widget'
  )

  cd "${_pkgname}"
  install -d "${pkgdir}/usr/share/loom/noctalia-plugins"
  cp -a "${srcdir}/${_pkgname}/loom-noctalia-plugins/." \
    "${pkgdir}/usr/share/loom/noctalia-plugins/"
  rm -f "${pkgdir}/usr/share/loom/noctalia-plugins/.gitignore" \
    "${pkgdir}/usr/share/loom/noctalia-plugins/LICENSE"
  find "${pkgdir}/usr/share/loom/noctalia-plugins" -name verify.sh \
    -exec chmod 755 {} +
  _install_doc loom-noctalia-plugins-git loom-noctalia-plugins/README.md
  _install_license loom-noctalia-plugins-git
}

package_loom-desktop-git() {
  pkgdesc="Meta package for Loom: coexisting compositor, portal and tools"
  depends=(
    loom-niri-git
    loom-portal-git
    loom-companion-git
    loom-monitor-git
    loom-session-git
    loom-shot-git
    loom-wallpaper-git
    loom-settings-git
    loom-audio-git
    loom-sidepanels-git
    loom-tui-git
    loom-noctalia-plugins-git
  )
  optdepends=(
    'xdg-desktop-portal: portal broker for loom-niri.portal and loom.portal'
    'xdg-desktop-portal-gtk: fallback portal for file chooser and friends'
    'pipewire: audio and screencasting server'
    'wireplumber: PipeWire session manager and wpctl'
    'dbus: dbus-update-activation-environment used by loom-niri-session'
    'systemd: systemctl, loginctl and busctl integration'
  )
  install=loom-desktop-git.install

  install -Dm755 "${srcdir}/target/release/loom" "${pkgdir}/usr/bin/loom"
  install -Dm644 "${srcdir}/loom-desktop-git.README.md" \
    "${pkgdir}/usr/share/doc/loom-desktop-git/README.md"
  _install_license loom-desktop-git
}
