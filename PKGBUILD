# Maintainer: maarroyo <archlinux@arroyo.me>
_pkgname=dumang-ctrl
pkgname=$_pkgname-git
pkgver=VERSION
pkgrel=1
pkgdesc="DuMang DK6 Keyboard Programming Tools"
arch=('any')
url="https://github.com/mayanez/dumang-keyboard-ctrl"
license=('GPL-3.0-or-later')
depends=('python' 'libusb' 'qt6-base' 'hidapi' 'python-hidapi' 'python-pyqt6' 'python-pyyaml' 'python-libusb1' 'python-click')
makedepends=(
  git
  make
  python-poetry
  python-installer
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git+https://github.com/mayanez/dumang-keyboard-ctrl.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd $pkgname
  make setup
  make build
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 udev/51-dumang.rules "$pkgdir/usr/lib/udev/rules.d/51-dumang.rules" || return 1
  install -Dm644 systemd/dumang-sync-python.service "$pkgdir/usr/lib/systemd/system/dumang-sync-python.service" || return 1
  install -Dm644 systemd/dumang-sync.service "$pkgdir/usr/lib/systemd/system/dumang-sync.service" || return 1
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install=dumang-sync.install
}
