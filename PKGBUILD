# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=lib32-gamemode
_pkgname=${pkgname#lib32-}
pkgver=1.6
pkgrel=4
pkgdesc="A daemon/lib combo that allows games to request a set of optimisations be temporarily applied to the host OS"
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode"
license=('BSD 3-Clause License (Revised)')
depends=('gamemode' 'lib32-glibc' 'lib32-dbus')
makedepends=('meson' 'ninja' 'pkg-config' 'lib32-systemd')
checkdepends=('appstream')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz")
sha256sums=('4fec5a0900e8f559b37cf1711ca7dcea7e1cebfe1237ce314001f65c1e346a5d')

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

