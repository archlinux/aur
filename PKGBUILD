# Maintainer: Danny Lin <[firstname] at kdrag0n dot dev>
# Maintainer: w568w <w568w at outlook dot com>

_pkgname=xf86-input-libinput
pkgname=xf86-input-libinput-hires-scroll
pkgver=1.5.0
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
sha512sums=('03090beb7c162fdf55e9bb9da41ffb8601b20047e4a53895bad27de47b3197fc920e710f26fa23e7322b367ab65fa56ba5f9a195ec69801529af3958632c2d6e'
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
