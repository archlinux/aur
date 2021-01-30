# Maintainer: Jeffrey Bouter <aur@kn0x.org>
pkgname=hushboard-git
pkgver=r34.223b6f9
pkgrel=1
pkgdesc="Mute your microphone while typing."
arch=('any')
url="https://kryogenix.org/code/hushboard"
license=('MIT')
depends=('python-gobject' 'python-xlib' 'libappindicator-gtk3')
makedepends=('git' 'python-setuptools' 'setconf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/stuartlangridge/hushboard.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  setconf "snap/gui/${pkgname%-git}.desktop" Icon hushboard
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  install -Dm644 "${pkgname%-git}-512.png" \
    "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "snap/gui/${pkgname%-git}.desktop" -t \
    "$pkgdir/usr/share/applications"
}
