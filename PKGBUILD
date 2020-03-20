# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=skribilo-git
pkgver=0.9.4.r1010
pkgrel=3
pkgdesc="The Ultimate Document Programming Framework from git"
arch=('x86_64')
url="http://www.nongnu.org/skribilo/"
license=('GPL')
depends=('bash')
makedepends=('git' 'guile-reader' 'ploticus')
provides=('skribilo')
conflicts=('skribilo')
source=("git://git.sv.gnu.org/skribilo.git" makevars.diff Makefile.in.in)
md5sums=('SKIP'
         'fdefd9d3a084f4d48f57df699fb7cdf0'
         '287083fa96f70fd28c8b19aae1c97b6d')
options=('!strip')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s" $(git describe --tags|tr - _|cut -c2-) $(git rev-list --count HEAD)
}

prepare() {
  cd "${pkgname%-git}"/po
  patch -Np0 < "$srcdir"/makevars.diff
  cp "$srcdir"/Makefile.in.in .
  cd ..
  touch ABOUT-NLS
  echo > gettextize --no-changelog -f
  libtoolize -c -f
  aclocal -I m4 
  automake --add-missing 
  autoreconf -if
}

build() {
  cd "${pkgname%-git}"
  ./configure --prefix=/usr --with-guilemoduledir=/usr/share/guile/site/2.2 
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  rm "$pkgdir"/usr/share/info/*.png
  install -d "$pkgdir"/usr/share/doc/$pkgname
  find "$srcdir"/ -name "*.png" -exec install -m644 {} "$pkgdir"/usr/share/doc/$pkgname \;
}
