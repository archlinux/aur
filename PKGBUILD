# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('lib32-gamemode')
_pkgname=('gamemode')
pkgver=1.1
pkgrel=2
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS."
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
depends=('gamemode' 'lib32-glibc')
makedepends=('meson' 'ninja' 'pkg-config' 'git' 'lib32-systemd')
provides=('lib32-gamemode')
source=("https://github.com/FeralInteractive/gamemode/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz")
sha256sums=('466a8a0798e1abf09aa3b3b08f139f19c7d950361a99ae0cfad031828d9fd211')

build() {
  export CFLAGS=-m32
  export CXXFLAGS=-m32
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  arch-meson ${_pkgname}-$pkgver build \
    -Dwith-daemon=false -Dwith-examples=false -Dwith-systemd=false --libdir lib32
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
  rm -rf $pkgdir/usr/include 
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${_pkgname}-${pkgver}/LICENSE.txt
}

