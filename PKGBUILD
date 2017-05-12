# Maintainer: xsmile <sascha_r gmx de>

_pkgname=libtorrent
pkgname=libtorrent-ps
_pkgver=0.13.6
pkgver=1.0.r57.gb49dfe3
pkgrel=1
pkgdesc='BitTorrent library written in C++ for use with rtorrent-ps'
url='https://github.com/rakshasa/libtorrent'
license=('GPL')
arch=('any')
depends=('openssl')
makedepends=('cppunit')
provides=('libtorrent')
conflicts=('libtorrent')
source=("https://github.com/rakshasa/$_pkgname/archive/$_pkgver.tar.gz"
        'lt-ps-honor_system_file_allocate_all.patch'
        'lt-ps-log_open_file-reopen_all.patch'
        'openssl-1.1.patch')
md5sums=('8c8eaa9fa03bd113967c68eea26493e7'
         '8d7f8fe5ad412bd42f2ea66131a8ce6b'
         '2bfadac7770935ca98c4714c2011541a'
         '08a51eb090e49fa24a9792d39333a5ac')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"

  # Patch libtorrent
  for corepatch in $srcdir/lt-ps-*_{${_pkgver},all}.patch; do
    test ! -e "$corepatch" || { msg2 "$(basename $corepatch)"; patch -uNp1 -i "$corepatch"; }
  done

  # Fix build against OpenSSL 1.1
  patch -p1 -i ../openssl-1.1.patch

  ./autogen.sh
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver"

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-instrumentation
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
}
