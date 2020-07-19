# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

# Note: a part of build() and check() require a graphical environment

pkgname=gnofract4d
pkgver=4.3
pkgrel=1
pkgdesc="Create beautiful fractal images"
arch=('any')
url="https://github.com/fract4d/gnofract4d"
license=('BSD')
depends=('gtk3' 'libjpeg' 'libpng' 'python-cairo' 'python-gobject')
makedepends=('docbook-xsl' 'hugo' 'libxslt')
checkdepends=('python-pytest')
source=("https://github.com/edyoung/gnofract4d/archive/v$pkgver.tar.gz")
md5sums=('d815353c682eab9787e2fdad26f625ba')

#prepare() {
#  cd $pkgname-$pkgver
#  # Patch for createdocs.py
#  sed -i "s|/usr/share/sgml/docbook/stylesheet/xsl/nwalsh/xhtml/docbook.xsl|/usr/share/xml/docbook/xsl-stylesheets-"$(pacman -Q docbook-xsl | \
#            awk '{ print $2 }' | awk -F"-" '{ print $1 }')"/xhtml/docbook.xsl|" \
#            doc/gnofract4d-manual/C/gnofract4d.xsl
#}

prepare() {
  cd $pkgname-$pkgver
  git submodule update --init
}

build() {
  cd $pkgname-$pkgver
  ./setup.py build
  ./createdocs.py
}

check() {
  cd $pkgname-$pkgver
  ./test.py
}

package() {
  cd $pkgname-$pkgver

  install -dm755 "$pkgdir/usr/share/man/man1"
  gzip doc/gnofract4d.1 > "$pkgdir/usr/share/man/man1/$pkgname.1.gz"

  ./setup.py install --root="$pkgdir" --optimize=1
}

