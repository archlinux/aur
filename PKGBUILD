# Maintainer: ivanp7 <ivanpzv8 at gmail dot com>

pkgname=fbterm
_gitname=fbterm
_majorver=1.7
pkgver=1.7_5
pkgrel=3
pkgdesc='Framebuffer terminal emulator'
arch=('x86_64' 'armv7h')
url='https://salsa.debian.org/debian/fbterm'
license=('GPL2')
depends=(freetype2 fontconfig ncurses)
makedepends=(autoconf patch)
provides=(fbterm)
conflicts=(fbterm)
source=("http://deb.debian.org/debian/pool/main/f/fbterm/fbterm_1.7.orig.tar.gz"
    'fbconfig.patch' 'fbterm.patch' '0001-Fix-build-with-gcc-6.patch' 'fix_ftbfs_crosscompile.patch' 'fix_ftbfs_epoll.patch'
    'fbtermrc')
sha256sums=('b98d487e84618503887e3996162354c482e24884bad8bf2219b6776372f306ad'
            '0d1781e2654d32d5dfd1cbf17680b49aefbb124b7164ca1d70fcf4468563be7c'
            '5cd1c14c640679a40f8a9d9781c2a5af5db7543c2296cda99f2886aa40468735'
            '8054410ab97da3df03406543c6a471acf3323b9e5712da6455d7c49cad7489ce'
            '73f0c87aaa5a74631c167fb765c0340dc28626b00d0a3cd065cebf71acc585f7'
            '2b5daa2664adf1efb3e478c2f97376c055b1698422524d262fbae2e7a530a323'
            '1759e8e3d4d9fd5b9f46f7813dbdc5df2fc9ef3b7b93f92c75d1267547666e45')

prepare() {
  cd $srcdir/$_gitname-$_majorver

  patch -p1 < "$srcdir/fbconfig.patch"
  patch -p1 < "$srcdir/fbterm.patch"
  patch -p1 < "$srcdir/0001-Fix-build-with-gcc-6.patch"
  patch -p1 < "$srcdir/fix_ftbfs_crosscompile.patch"
  patch -p1 < "$srcdir/fix_ftbfs_epoll.patch"

  autoreconf -fvi
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$_gitname-$_majorver
  make
  mkdir -p tic
  TERMINFO=$srcdir/$_gitname-$_majorver/tic tic terminfo/fbterm
}

package() {
  cd $srcdir/$_gitname-$_majorver
  make DESTDIR="$pkgdir/" install

  mkdir -p "$pkgdir/usr/share/terminfo"
  cp -r tic/f "$pkgdir/usr/share/terminfo/"

  mkdir -p "$pkgdir/etc/fbterm"
  cp $srcdir/fbtermrc "$pkgdir/etc/fbterm/fbtermrc.example"
}

