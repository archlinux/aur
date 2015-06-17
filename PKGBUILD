# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

_tag=0.1.2-alpha
pkgname=infinisql
pkgver=0.1.2.alpha
pkgrel=1
pkgdesc='the database for always on, rapid growth applications that need to collect and analyze in real time--even for complex transactions'
url='http://www.infinisql.org/'
arch=(i686 x86_64)
license=(AGPLv3)
depends=(crypto++ zeromq pcre lz4 msgpack)
makedepends=(boost)
#checkdepends=(perl perl-dbi perl-data-messagepack perl-dbd-pg)
source=(https://github.com/infinisql/infinisql/archive/v${_tag}.zip
        fix_bison_issue.diff
        respect_destdir.diff)
sha1sums=('1a1b3816150dd5048ba393edec50ae8c0d9fb0b3'
          '4781697bb1c39ea7468ee1b24455e612f844106e'
          'f1e6b805c0a037d404e883bd2a5e945440b02652')

prepare() {
  cd $pkgname-$_tag
  patch -p1 < "$srcdir/fix_bison_issue.diff"
  patch -p1 < "$srcdir/respect_destdir.diff"
}

build() {
  cd $pkgname-$_tag
  autoreconf -i  # it is needed because included configure uses old autoconf
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

# unable to configure regression tests correctly
#check() {
#  cd $pkgname-$_tag/scripts
#  perl ./regression.pl
#}

package() {
  cd $pkgname-$_tag
  make DESTDIR="$pkgdir" install
}
