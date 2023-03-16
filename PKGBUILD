# Maintainer:  Guoyi Zhang <guoyi zhang at malacology dot net>
# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=tnt-ncurses5-compat-libs
_pkgname=ncurses
pkgver=6.4
pkgrel=1
pkgdesc='System V Release 4.0 curses emulation library, ABI 5'
arch=(i686 x86_64)
url='http://invisible-island.net/ncurses/ncurses.html'
license=(MIT)
depends=(glibc gcc-libs sh)
provides=(libtinfo5)
conflicts=(libtinfo5)
source=(https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$pkgver.tar.gz)
sha256sums=('6931283d9ac87c5073f30b6290c4c75f21632bb4fc3603ac8100812bed248159')
# validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB')  # Thomas Dickey

build() {
  cd ${_pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --with-shared \
    --with-normal \
    --without-debug \
    --without-ada \
    --disable-pc-files \
    --with-cxx-binding \
    --with-cxx-shared \
    --with-versioned-syms \
    --with-abi-version=5
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install.libs
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -rf "$pkgdir/usr/include/" "$pkgdir/usr/lib/pkgconfig" \
    "$pkgdir"/usr/lib/*.so "$pkgdir"/usr/lib/*.a

  ln -s /usr/lib/libncurses.so.5 "$pkgdir/usr/lib/libtinfo.so.5"
  ln -s /usr/lib/libncurses.so.5 "$pkgdir/usr/lib/libtic.so.5"
}
