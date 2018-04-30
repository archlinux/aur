# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=skribilo-git
pkgver=0.9.4r1010
pkgrel=1
pkgdesc="The Ultimate Document Programming Framework from git"
arch=('any')
url="http://www.nongnu.org/skribilo/"
license=('GPL')
depends=('bash')
makedepends=('git' 'guile-reader' 'ploticus')
provides=('skribilo')
conflicts=('skribilo')
source=("git://git.sv.gnu.org/skribilo.git" makevars.diff)
md5sums=('SKIP'
         'fdefd9d3a084f4d48f57df699fb7cdf0')
options=("!makeflags")

pkgver() {
  cd "${pkgname%-git}"
  printf "%sr%s" $(git describe --tags|tr - _|cut -c2-) $(git rev-list --count HEAD)
}

prepare() {
  cd "${pkgname%-git}"/po
  patch -Np0 < "$srcdir"/makevars.diff
  cd ..
#  gettextize -f
  libtoolize -c -f
  aclocal -I m4 
  automake --add-missing 
  autoconf
}

build() {
  cd "${pkgname%-git}"
  GUILE_EFFECTIVE_VERSION=2.0 GUILE=/usr/bin/guile2.0 ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  rm $pkgdir/usr/share/info/*.png
  install -d "$pkgdir"/usr/share/doc/$pkgname
  find $srcdir/ -name "*.png" -exec install -m644 {} "$pkgdir"/usr/share/doc/$pkgname \;
}
