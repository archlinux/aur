# Maintainer: Danny Lin <[firstname] at kdrag0n dot dev>

_pkgname=xf86-input-libinput
pkgname=xf86-input-libinput-hires-scroll
pkgver=0.29.0
pkgrel=2
pkgdesc="Generic input driver for the X.Org server based on libinput - patched for hi-res wheel scroll"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libinput-hires-scroll>=1.2.0')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=24.1' 'libxi' 'libx11' 'xorgproto')
conflicts=($_pkgname 'xorg-server<1.19.0' 'X-ABI-XINPUT_VERSION<24' 'X-ABI-XINPUT_VERSION>=25')
provides=("$_pkgname=$pkgver-$pkgrel")
groups=('xorg-drivers')
source=(https://xorg.freedesktop.org/releases/individual/driver/$_pkgname-$pkgver.tar.bz2{,.sig}
        mr2.patch)
sha512sums=('f19ef2e9e0c1336d8e0b17853e1fe0c66ecf50e7b10b10b6c5cbafc99323694597821e15e8e358419ef3c68d1009967fd2ec3760800c85adbb71ac3ecc99954b'
            'SKIP'
            'ac03cdea3a8affd8911054d92aaf1582ee3a8bad8e5fa26358fe714cf42a45be638a15ac47306bad290b44534a1434d2f1da19b6e57b04bce4759212a338bade')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../mr2.patch
}

build() {
  cd $_pkgname-$pkgver

  autoreconf --force --install
  ./configure --prefix=/usr \
    --disable-static
  make
}

package() {
  cd $_pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/usr/share/licenses/$_pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/"
}
