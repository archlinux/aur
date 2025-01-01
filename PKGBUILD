# Maintainer: xsmile <>

# Based on the current libtorrent version with the following additions:
# - updated pyroscope/rtorrent-ps patchset with several fixes from chros73/rtorrent-ps-ch
# - patches to fix compilation issues and crashes
_pkgname=libtorrent
pkgname=libtorrent-ps
_pkgver=0.15.1
pkgver=1.1.r71.gee296b1
pkgrel=4
pkgdesc='BitTorrent library written in C++ for use with rtorrent-ps'
url='https://github.com/rakshasa/libtorrent'
license=('GPL-2.0-only')
arch=('any')
depends=('glibc' 'openssl' 'zlib')
provides=('libtorrent')
conflicts=('libtorrent')
source=("$_pkgname-$_pkgver.tar.gz::https://github.com/rakshasa/$_pkgname/archive/v$_pkgver.tar.gz"
        'lt-ps-better-bencode-errors_all.patch'
        'lt-ps-honor_system_file_allocate_all.patch')
sha256sums=('27bdd00949ef0b43161002a475f5eeb777929ad96dddd6c9b2f76f14c9be3a69'
            '3c0f802deecb15b93d8b569f00fdefe9e614f9688cfaabfbe567b8da70d2e93d'
            '5219bba547aff9ff3b2b6bd937284c3fed7c324473db20ff479e38302bdbda52')
prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"

  LT_BASE_PATCHES=()
  LT_PATCHES=()

  # Patch libtorrent
  for corepatch in "${LT_BASE_PATCHES[@]/#/$srcdir/}" \
                   "$srcdir"/lt-ps-*_{${_pkgver},all}.patch "${LT_PATCHES[@]/#/$srcdir/}"; do
    test ! -e "$corepatch" || { msg2 "$(basename $corepatch)"; patch -uNp1 -i "$corepatch"; }
  done

  for backport in "$srcdir"/backport*_{${_pkgver},all}_*.patch; do
    test ! -e "$backport" || { msg2 "$(basename $backport)"; patch -uNp1 -i "$backport"; }
  done

  autoreconf -fiv
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver"

   # https://github.com/rakshasa/libtorrent/issues/244
  ./configure \
    --prefix=/usr \
    --disable-debug \
    --enable-aligned
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"

  make DESTDIR="$pkgdir" install
}
