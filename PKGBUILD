# Maintainer: goodroot <hyprwhspr@goodroot.ca>

_pkgname=hyprwhspr
pkgname=hyprwhspr-git
pkgver=0
pkgrel=10
pkgdesc="Native Whisper speech-to-text for Arch/Omarchy with Waybar integration (git)"
arch=('x86_64')
url="https://github.com/goodroot/${_pkgname}"
license=('MIT')

makedepends=(
  'git'
)
depends=(
  'python'
  'python-sounddevice'
  'python-numpy'
  'python-soxr'
  'python-evdev'
  'python-pyudev'
  'python-rich'
  'python-pulsectl'
  'wtype'
  'ydotool'
  'wl-clipboard'
  'pipewire' 'pipewire-alsa' 'pipewire-pulse'
)
optdepends=(
  'python-dbus: suspend/resume monitoring'
  'python-gobject: suspend monitoring, AT-SPI detection, and Mic-OSD support'
  'gtk4-layer-shell: themed Mic-OSD visualization'
  'python-pyperclip: non-Wayland/X11 clipboard fallback'
  'xclip: X11 clipboard provider for pyperclip'
  'xdotool: X11 active-window detection and future X11 injection support'
  'cmake: accelerated pywhispercpp source builds'
  'git: accelerated pywhispercpp source builds'
  'base-devel: accelerated pywhispercpp source builds'
)

install="${_pkgname}.install"

source=("git+https://github.com/goodroot/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags \
    | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
  # e.g. v1.9.16-23-gabc1234 -> 1.9.16.r23.gabc1234
}

build() {
  cd "${srcdir}/${_pkgname}"
  # nothing to build; user runs 'hyprwhspr setup' post-install
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "$pkgdir/usr/lib/${_pkgname}"
  cp -r lib bin config share README.md LICENSE requirements*.txt \
    "$pkgdir/usr/lib/${_pkgname}"

  if [ -f "$pkgdir/usr/lib/${_pkgname}/bin/${_pkgname}" ]; then
    chmod 755 "$pkgdir/usr/lib/${_pkgname}/bin/${_pkgname}"
  fi

  install -Dm644 "config/systemd/${_pkgname}.service" \
    "$pkgdir/usr/lib/systemd/user/${_pkgname}.service"

  # Create wrapper that uses the repo's bin/hyprwhspr with fixed paths
  install -d "$pkgdir/usr/bin"
  sed 's|PACKAGE_ROOT="$(dirname "$SCRIPT_DIR")"|PACKAGE_ROOT="/usr/lib/hyprwhspr"|' \
    "$srcdir/${_pkgname}/bin/${_pkgname}" > "$pkgdir/usr/bin/${_pkgname}"
  chmod 755 "$pkgdir/usr/bin/${_pkgname}"

  install -d "$pkgdir/usr/share/doc/${_pkgname}" \
             "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -m644 LICENSE   "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
