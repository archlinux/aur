# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nathan Kessler <nathant93 <at> gmail.com>

pkgname=scheme48-hg
pkgver=1.9T1634+.a44624256297+
pkgrel=1
pkgdesc="Scheme interpreter for experimentation from mercurial repo"
arch=('i686' 'x86_64')
url="http://s48.org/"
license=('custom')
depends=('bash' 'glib2')
makedepends=('mercurial' 'sh' 'scheme48' 'tex2page-git')
provides=("scheme48=1.9.2")
conflicts=('scheme48')
source=("hg+http://www.s48.org/cgi-bin/hgwebdir.cgi/s48")
md5sums=('SKIP')
options=('!makeflags')
_hgrepo="s48"

pkgver() {
  cd "$_hgrepo"
  printf "1.9T%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$_hgrepo"
  sed -i "s+./configure+./configure --prefix=/usr --enable-glib+" autogen.sh
  sed -i 17s+rm+#rm+ autogen.sh
  sed -i "s+distclean+DESTDIR=$pkgdir install+" autogen.sh
}

package() {
  cd "$_hgrepo"
  [[ $CARCH == "i686" ]] && ./autogen.sh --disable-docs --disable-force-64bit --enable-force-32-bit
  [[ $CARCH == "x86_64" ]] && ./autogen.sh --disable-docs --disable-force-32bit --enable-force-64-bit
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
