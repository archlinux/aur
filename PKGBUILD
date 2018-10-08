# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=gnofract4d
pkgver=4.0.1
pkgrel=1
pkgdesc="Create beautiful fractal images"
arch=('any')
url="https://edyoung.github.io/gnofract4d/"
license=('BSD')
makedepends=('docbook-xsl' 'libxslt')
depends=('gtk3' 'libjpeg' 'libpng' 'python-cairo' 'python-gobject')
source=(https://github.com/edyoung/gnofract4d/archive/v$pkgver.tar.gz)
md5sums=('29da10ba5a2747349bae420de956db5b')

prepare() {
  cd $pkgname-$pkgver
  # Patch for createdocs.py
  sed -i "s|/usr/share/sgml/docbook/stylesheet/xsl/nwalsh/xhtml/docbook.xsl|/usr/share/xml/docbook/xsl-stylesheets-"$(pacman -Q docbook-xsl | \
            awk '{ print $2 }' | awk -F"-" '{ print $1 }')"/xhtml/docbook.xsl|" \
            doc/gnofract4d-manual/C/gnofract4d.xsl
}

build() {
  cd $pkgname-$pkgver
  ./setup.py build
  ./createdocs.py
}

# Note: the tests need to be run in a graphical environment
#check() {
#  cd $pkgname-$pkgver
#  ./test.py
#}

package() {
  cd $pkgname-$pkgver
  install -Dm644 doc/gnofract4d.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  ./setup.py install --root="$pkgdir" --optimize=1
}

