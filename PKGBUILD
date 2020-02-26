# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dupliseek-git
pkgver() { git -C "${pkgname%-git}" describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'; }
pkgver=0.0.3.r2.6cc6923
pkgrel=1
epoch=1

pkgdesc='Duplicate image finder written in Python/Qt5'
arch=('x86_64')
url="https://gitlab.com/dupliseek-group/${pkgname%-git}"
license=('MIT')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=('python-pyqt5' 'python-numpy' 'python-imutils' 'python-opencv-python')
makedepends=('git' 'python-setuptools' 'python-pip')

source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname%-git}"
  sed -i "s|\(/usr/share/\)icons\(/${pkgname%-git}\)|\1pixmaps\2.png|;
          s|^\(Categories=.*\)|\1\;Utility|" "${pkgname%-git}.desktop"
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  pip install --root="$pkgdir" --prefix=/usr --compile --no-deps \
              --no-warn-script-location opencv-python
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
  install -Dm644 dupliseek_pkg/icons/compare.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "${pkgname%-git}.desktop" -t"$pkgdir/usr/share/applications/"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
  install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/${pkgname%-git}/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
