# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>


# Note: This build process needs to be run in a graphical environment (createdocs.py and test.py)


pkgname=gnofract4d
pkgver=3.14.1
_pkgver="V_${pkgver//./_}"
pkgrel=4
pkgdesc="Create beautiful fractal images in PyGTK"
arch=('any')
url="http://gnofract4d.sourceforge.net"
license=('BSD')
makedepends=('docbook-xsl' 'python2')
depends=('desktop-file-utils' 'libjpeg' 'libpng' 'pygtk')
install=$pkgname.install
source=(https://github.com/edyoung/gnofract4d/archive/$_pkgver.tar.gz
        gnofract4d-manual.html)
md5sums=('0872b6acefa9123205e099c9e174a791'
         '784e9aeb0abcf473d338481f37503ab0')

prepare() {
  cd $pkgname-$_pkgver

  sed -i "s|/usr/share/sgml/docbook/stylesheet/xsl/nwalsh/xhtml/docbook.xsl|/usr/share/xml/docbook/xsl-stylesheets-"$(pacman -Q docbook-xsl | \
            awk '{ print $2 }' | awk -F"-" '{ print $1 }')"/manpages/docbook.xsl|" \
            doc/gnofract4d-manual/C/gnofract4d.xsl

  # For running tests in check()
  #find . -name "*.py" -exec sed -i "s|env python|env python2|" '{}' \;
  #find . -name "*.py" -exec sed -i "s|/usr/bin/python|/usr/bin/python2|" '{}' \;
}

build() {
  cd $pkgname-$_pkgver
  python2 setup.py build
  python2 createdocs.py
}

#check() {
#  cd $pkgname-$_pkgver
#  python2 test.py
#}

package() {
  cd $pkgname-$_pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 doc/gnofract4d.1 "$pkgdir/usr/share/man/man1/$pkgname.1"

  # Patch for createdocs.py. Generating "Formula Reference Reference" entries fails:
  #     Error:  no refentry: No refentry elements found in "Gnofract 4D".   Gnofract 4D
  install -m644 "$srcdir/gnofract4d-manual.html" "$pkgdir/usr/share/gnome/help/gnofract4d/C/gnofract4d-manual.html"
}

