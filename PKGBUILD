pkgname=libx11-nokeyboardgrab
pkgver=1.6.3
pkgrel=1
pkgdesc='Core X11 protocol client library'
arch=(i686 x86_64)
url=http://www.x.org/wiki/
license=(custom)
depends=(kbproto libxcb)
makedepends=(inputproto xextproto xtrans)
provides=(libx11=$pkgver)
conflicts=(libx11)
source=(${url/wiki\/}releases/individual/lib/libX11-$pkgver.tar.bz2
        ${url/wiki\/}releases/individual/lib/libX11-$pkgver.tar.bz2.sig)
sha256sums=(cf31a7c39f2f52e8ebd0db95640384e63451f9b014eed2bb7f5de03e8adc8111
            SKIP)
validpgpkeys=(4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E)

prepare() {
  cd libX11-$pkgver

  sed -i '/xGrabKeyboardReply/ i \        return (GrabSuccess);' src/GrKeybd.c
}

build() {
  cd libX11-$pkgver

  local confopts=(
    --disable-static
    --prefix=/usr
  )

  ./configure ${confopts[@]}

  make
}

check() {
  cd libX11-$pkgver

  make check
}

package() {
  cd libX11-$pkgver

  make DESTDIR=$pkgdir install

  install -m644 AUTHORS COPYING ChangeLog NEWS README $pkgdir/usr/share/doc/libX11

  install -d $pkgdir/usr/share/licenses/$pkgname
  ln -rs $pkgdir/usr/share/doc/libX11/COPYING $pkgdir/usr/share/licenses/$pkgname
  ln -rs $pkgdir/usr/share/licenses/$pkgname $pkgdir/usr/share/licenses/libx11
}
