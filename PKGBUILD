# Maintainer: ivanp7 <ivanpzv8 at gmail dot com>

pkgname=fbterm
_gitname=fbterm
_majorver=1.7
pkgver=1.7_5
pkgrel=1
pkgdesc='Framebuffer terminal emulator'
arch=('x86_64' 'armv7h')
url='https://salsa.debian.org/debian/fbterm'
license=('MIT')
depends=(freetype2 fontconfig)
provides=(fbterm)
conflicts=(fbterm)
source=("http://deb.debian.org/debian/pool/main/f/fbterm/fbterm_1.7.orig.tar.gz"
    'fbconfig.patch' 'fbterm.patch' '0001-Fix-build-with-gcc-6.patch' 'fix_ftbfs_crosscompile.patch' 'fix_ftbfs_epoll.patch'
    'fbtermrc')
sha256sums=('b98d487e84618503887e3996162354c482e24884bad8bf2219b6776372f306ad'
    'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
    'SKIP')

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

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname/"

  mkdir -p "$pkgdir/usr/share/terminfo"
  cp -r tic/f "$pkgdir/usr/share/terminfo/"

  mkdir -p "$pkgdir/etc/fbterm"
  cp $srcdir/fbtermrc "$pkgdir/etc/fbterm/fbtermrc.example"
}

