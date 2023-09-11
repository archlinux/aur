# Maintainer: Danny Lin <[firstname] at kdrag0n dot dev>
# Maintainer: w568w <w568w at outlook dot com>

_pkgname=xf86-input-libinput
pkgname=xf86-input-libinput-hires-scroll
pkgver=1.4.0
pkgrel=1
pkgdesc="Generic input driver for the X.Org server based on libinput - patched for hi-res wheel scroll"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libinput')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=24.4' 'libxi' 'libx11' 'xorgproto' 'git')
conflicts=($_pkgname 'xorg-server<1.19.0' 'X-ABI-XINPUT_VERSION<24' 'X-ABI-XINPUT_VERSION>=25')
provides=("$_pkgname=$pkgver-$pkgrel")
groups=('xorg-drivers')
source=(https://xorg.freedesktop.org/releases/individual/driver/$_pkgname-$pkgver.tar.xz
        mr2.patch)
sha512sums=('b286b5425aeda5cfecd1de7f59663d169b95ffc55474dfbf28c2e13e5221cbeecd472d40b6094c0a937f83db67bf58a7fe0e07d25b6a6945d3fd669e717fc0bf'
            'ac03cdea3a8affd8911054d92aaf1582ee3a8bad8e5fa26358fe714cf42a45be638a15ac47306bad290b44534a1434d2f1da19b6e57b04bce4759212a338bade')

prepare() {
  cd $_pkgname-$pkgver || exit
  # patch seems to fail to apply the patch, so try `git apply` instead
  # patch -Np1 -i ../mr2.patch
  git apply ../mr2.patch
}

build() {
  cd $_pkgname-$pkgver || exit

  autoreconf --force --install
  ./configure --prefix=/usr \
    --disable-static
  make
}

package() {
  cd $_pkgname-$pkgver || exit

  make DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/usr/share/licenses/$_pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/"
}
