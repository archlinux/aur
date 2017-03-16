# Maintainer: xsmile <sascha_r gmx de>

_pkgname=libtorrent
pkgname=libtorrent-ps
_pkgver=0.13.6
pkgver=1.0.r26.gcb78fc3
pkgrel=1
pkgdesc='BitTorrent library written in C++'
url='https://github.com/rakshasa/libtorrent'
license=('GPL')
arch=('any')
depends=('openssl')
provides=('libtorrent')
conflicts=('libtorrent' 'libtorrent-git' 'libtorrent-ipv6' 'libtorrent-ps-git' 'libtorrent-pyro' 'libtorrent-pyro-git')
source=("https://github.com/rakshasa/$_pkgname/archive/$_pkgver.tar.gz"
        'lt-ps-honor_system_file_allocate_all.patch')
md5sums=('8c8eaa9fa03bd113967c68eea26493e7'
         '8d7f8fe5ad412bd42f2ea66131a8ce6b')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"

   # Patch libtorrent
   for corepatch in $srcdir/lt-ps-*_{${_pkgver},all}.patch; do
     test ! -e "$corepatch" || { msg2 "$(basename $corepatch)"; patch -uNp1 -i "$corepatch"; }
   done

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
