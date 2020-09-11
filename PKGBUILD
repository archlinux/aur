# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('lib32-gamemode')
_pkgname=('gamemode')
pkgver=1.6
pkgrel=2
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS"
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
depends=('gamemode' 'lib32-glibc' 'lib32-dbus')
makedepends=('meson' 'ninja' 'pkg-config' 'lib32-systemd')
source=("https://github.com/FeralInteractive/gamemode/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz")
sha256sums=('4fec5a0900e8f559b37cf1711ca7dcea7e1cebfe1237ce314001f65c1e346a5d')

build() {
  export CFLAGS=-m32
  export CXXFLAGS=-m32
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  meson ${_pkgname}-$pkgver build --prefix /usr \
    -Dwith-daemon=false -Dwith-examples=false -Dwith-systemd=false -Dwith-util=false -Dwith-examples=false --libdir lib32
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
  rm -rf $pkgdir/usr/include 
  rm -rf $pkgdir/usr/bin
  rm -rf $pkgdir/usr/share
  rm -rf $pkgdir/usr/lib/systemd
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${_pkgname}-${pkgver}/LICENSE.txt
}

