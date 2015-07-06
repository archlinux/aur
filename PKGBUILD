pkgname=lib32-libx11-nokeyboardgrab
pkgver=1.6.3
pkgrel=1
pkgdesc='Core X11 protocol client library'
arch=(x86_64)
url=http://www.x.org/wiki/
license=(custom)
depends=(lib32-libxcb libx11)
makedepends=(gcc-multilib inputproto xextproto xtrans)
provides=(lib32-libx11=$pkgver)
conflicts=(lib32-libx11)
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

  CFLAGS+=' -m32'

  local confopts=(
    --disable-specs
    --disable-static
    --libdir=/usr/lib32
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

  rm -r $pkgdir/usr/{include,share}

  install -d $pkgdir/usr/share/licenses/$pkgname
  install -m644 COPYING $pkgdir/usr/share/licenses/$pkgname
}
