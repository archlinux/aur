# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dupliseek-git
_name="${pkgname%-git}"

epoch=1
pkgver() { git -C "$_name" describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'; }
pkgver=0.0.3.r36.6c5cc90
pkgrel=3

pkgdesc='Duplicate image finder written in Python/Qt5'
arch=('x86_64')
url="https://gitlab.com/dupliseek-group/$_name"
license=('MIT')

provides=("$_name")
conflicts=("$_name")

makedepends=('git' 'python-setuptools')
depends=('python' 'python-pyqt5' 'python-numpy' 'python-imutils' 'python-send2trash' 'opencv')

source=("git+$url.git")
sha256sums=('SKIP')


prepare() {
  cd "$_name"
  sed -i "s|\(/usr/share/\)icons\(/$_name\)|\1pixmaps\2.png|;
          s|^\(Categories=.*\)|\1\;Utility|" "$_name.desktop"
  sed -i "s|opencv-python|opencv|" setup.py
  rm -r send2trash
}

build() {
  cd "$_name"
  python setup.py build
}

package() {
  cd "$_name"
  PYTHONHASHSEED=0 python setup.py install --skip-build --optimize=1 --root="$pkgdir"
  install -Dm644 dupliseek_pkg/icons/compare.png "$pkgdir/usr/share/pixmaps/$_name.png"
  install -Dm644 "$_name.desktop" -t"$pkgdir/usr/share/applications/"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
