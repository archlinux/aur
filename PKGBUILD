# Maintainer: qdesjardin <qdesjardin gmail com>

_pkgname=libtorrent
pkgname=libtorrent-ps-ch
_pkgver=0.13.8
pkgver=1.8.3
pkgrel=1
pkgdesc='BitTorrent library written in C++ for use with rtorrent-ps-ch'
license=('GPL2')
arch=('any')
url='https://github.com/rakshasa/libtorrent'
depends=('openssl')
provides=('libtorrent')
conflicts=('libtorrent' 'libtorrent-ps')
source=("https://github.com/rakshasa/$_pkgname/archive/v$_pkgver.tar.gz"
        'backport_lt_all_01-partially_done_and_choke_group_fix.patch'
	'backport_lt_all_02-honor_system_file_allocate_fix.patch'
	'lt-ps_all_02-better-bencode-errors_all.patch')
md5sums=('dd184eadb8b449ddc6c3498a93ddd568'
         '2a8eb09877e81e3e72bd544c27b45dbb'
         '4797c5abf04dca2468178bc85244d076'
         'dfae06b33afa738211619040810be8b4')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"

  for corepatch in "$srcdir"/lt-ps_*.patch; do
    test ! -e "$corepatch" || { msg2 "$(basename $corepatch)"; patch -uNp1 -i "$corepatch"; }
  done

  for backport in "$srcdir"/{backport,misc}_lt_*.patch; do
    test ! -e "$backport" || { msg2 "$(basename $backport)"; patch -uNp1 -i "$backport"; }
  done

  ./autogen.sh
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver"

  ./configure \
    --prefix=/usr \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
}
