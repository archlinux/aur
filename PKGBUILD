# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: DavidK <david_king@softhome.net>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=afnix
pkgver=2.4.0
pkgrel=1
pkgdesc='Multi-threaded functional programming language'
arch=('x86_64' 'i686')
url='https://webcache.googleusercontent.com/search?q=cache:1Mgj4gG84PAJ:www.afnix.org/&num=1&strip=1&vwsrc=0'
license=('custom')
depends=('ncurses' 'gcc-libs')
makedepends=('setconf')
source=("http://ftp.twaren.net/BSD/FreeBSD/ports/distfiles/afnix-src-2.4.0.tgz")
sha256sums=('59885a5c1b4a211ff38313c22c45c7953711e1267beaa20c244287ad9de28b3c')

prepare() {
  cd "$pkgname-src-$pkgver"

  # afnix can only believe that GCC has reached version 4
  sed 's/4.*) ccvers=4/6.*) ccvers=6/g' -i cnf/bin/afnix-vcomp
  setconf cnf/bin/afnix-vcomp result=gcc
  cp cnf/mak/afnix-gcc-4.mak cnf/mak/afnix-gcc.mak
  setconf cnf/mak/afnix-gcc.mak AFXCPPVERS=6

  # Just use the $USER env variable
  sed 's/(getpwuid_r (uid, &pwbuf, buf, 1024, NULL) != 0)/(1)/g' -i src/lib/plt/shl/csys.cxx

  # Compiler flags. The compilation process does not respect CXXFLAGS
  setconf cnf/mak/afnix-gcc.mak STDCCFLAGS="-std=c++03 -w"
}
	  
build() {
  cd "$pkgname-src-$pkgver"

  ./cnf/bin/afnix-setup -o --prefix="$pkgdir/usr"
  make status all
}

package() {
  cd "$pkgname-src-$pkgver"

  make install
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install etc/*.el -t "$pkgdir"/usr/share/emacs/site-lisp
  install -D doc/xml/eul/eul.xml "$pkgdir"/usr/share/licenses/afnix/LICENSE
}

# vim:set ts=2 sw=2 et:
