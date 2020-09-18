# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=lib32-gamemode
_pkgname=${pkgname#lib32-}
pkgver=1.6
pkgrel=4
pkgdesc="A daemon/lib combo that allows games to request a set of optimisations be temporarily applied to the host OS"
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode"
license=('BSD')
depends=('gamemode' 'lib32-glibc' 'lib32-dbus')
makedepends=('meson' 'ninja' 'pkg-config' 'lib32-systemd')
checkdepends=('appstream')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz")
sha256sums=('ede17eb042c1c87f7b35bfe96a00560afaea086f685d25bb3964d794b0af9c80')

build() {
  export CFLAGS=-m32
  export CXXFLAGS=-m32
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  meson ${_pkgname}-$pkgver build \
    --prefix /usr \
    -Dwith-sd-bus-provider=no-daemon \
    -Dwith-examples=false \
    -Dwith-util=false \
    --libdir lib32
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR=$pkgdir meson install -C build
  #already present from gamemode package
  rm -rf $pkgdir/usr/include
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${_pkgname}-${pkgver}/LICENSE.txt
}

