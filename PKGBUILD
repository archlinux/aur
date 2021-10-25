# Maintainer: gpery <Telegram / Matrix: @gpery>

# Maintainers of the original ncurses package:
# Maintainer:  David Runge <dvzrv@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=ncurses-versioned
pkgver=6.2
pkgrel=2
pkgdesc='System V Release 4.0 curses emulation library with versioned symbols'
arch=(x86_64)
url='https://invisible-island.net/ncurses/ncurses.html'
license=(MIT)
depends=(glibc gcc-libs)
optdepends=('bash: for ncursesw6-config')
provides=(libncurses++w.so libformw.so libmenuw.so libpanelw.so libncursesw.so ncurses)
replaces=(alacritty-terminfo)
conflicts=(ncurses)
source=("https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$pkgver.tar.gz"{,.sig})
sha512sums=('4c1333dcc30e858e8a9525d4b9aefb60000cfc727bc4a1062bace06ffc4639ad9f6e54f6bdda0e3a0e5ea14de995f96b52b3327d9ec633608792c99a1e8d840d'
            'SKIP')
b2sums=('6680cd7a369a4cb8234442a70869c283f0db6db9d7da1da2a7a5c519eb862a2c9b9411957d99f9ebb5089cad00b42e1ca6bc0784327461113df2eeaec695913c'
        'SKIP')
# NOTE: contacted upstream signing key holder about unsafe key (2021-05-02)
validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB')  # Thomas Dickey <dickey@invisible-island.net>

project_name=ncurses

# FIXME
# prepare() {
#   cd $pkgname-$pkgver
# 
#   autoreconf -fiv
# }

build() {
  cd $project_name-$pkgver

  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --with-pkg-config-libdir=/usr/lib/pkgconfig \
    --with-shared \
    --with-normal \
    --without-debug \
    --without-ada \
    --enable-widec \
    --enable-pc-files \
    --with-cxx-binding \
    --with-cxx-shared \
    --with-manpage-format=normal \
    --with-versioned-syms
  make
}

package() {
  cd $project_name-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$project_name/"

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses ncurses++ form panel menu; do
    echo "INPUT(-l${lib}w)" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -sv ${lib}w.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done

  for lib in tic tinfo; do
    echo "INPUT(libncursesw.so.${pkgver:0:1})" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -sv libncursesw.so.${pkgver:0:1} "$pkgdir/usr/lib/lib${lib}.so.${pkgver:0:1}"
    ln -sv ncursesw.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done

  # some packages look for -lcurses during build
  echo 'INPUT(-lncursesw)' > "$pkgdir/usr/lib/libcursesw.so"
  ln -s libncurses.so "$pkgdir/usr/lib/libcurses.so"
}
