# Maintainer: atang-sp <atang.sp.2025@gmail.com>

pkgname=doubao-voice-input-git
pkgver=1.0.2.r2.g98ce357
pkgrel=1
pkgdesc="Doubao push-to-talk voice input for Linux/Wayland (git)"
arch=('any')
url="https://github.com/wurong98/doubao-input-for-linux"
license=('MIT')
depends=(
  'gtk4'
  'hicolor-icon-theme'
  'python'
  'python-cairo'
  'python-evdev'
  'python-gobject'
  'python-sounddevice'
  'python-websockets'
  'webkitgtk-6.0'
  'wl-clipboard'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=('doubao-input')
conflicts=('doubao-input')
install=doubao-input.install
source=(
  "doubao-input::git+${url}.git"
  'doubao-input.service'
  '70-doubao-input-uinput.rules'
  'evdev-2-list-devices.patch'
)
sha256sums=(
  'SKIP'
  '6e935d832da2c0f1f5adf81bcd587abe97c80c97a5beaf01883b8434cdb05a79'
  'c71e03ce761e98fa0c0a49dde3956336c2f2a47d4f44ba464a7ad6c5d89c0403'
  '9ce153f09b7d5c75f651c8d3ff657ddd363e76b9b03aaba051049c3f2f0ae643'
)

pkgver() {
  cd doubao-input
  git describe --long --tags --abbrev=7 | \
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd doubao-input
  patch -Np1 -i "$srcdir/evdev-2-list-devices.patch"
}

build() {
  cd doubao-input
  python -m build --wheel --no-isolation
}

package() {
  cd doubao-input

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/doubao-input.service" \
    "$pkgdir/usr/lib/systemd/user/doubao-input.service"
  install -Dm644 debian/doubao-input.desktop \
    "$pkgdir/usr/share/applications/doubao-input.desktop"
  install -Dm644 "$srcdir/70-doubao-input-uinput.rules" \
    "$pkgdir/usr/lib/udev/rules.d/70-doubao-input-uinput.rules"

  install -Dm644 src/doubao_input/resources/logo-128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/doubao-input.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md NOTICE -t "$pkgdir/usr/share/doc/$pkgname"
}
