# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('lib32-gamemode')
_pkgname=('gamemode')
pkgver=1.2
pkgrel=0
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS."
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
depends=('gamemode' 'lib32-glibc')
makedepends=('meson' 'ninja' 'pkg-config' 'git' 'lib32-systemd')
provides=('lib32-gamemode')
source=("https://github.com/FeralInteractive/gamemode/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz")
sha256sums=('a7b8d63ffdcbea0dc8b557fda42a9471fa9ab0961a5450d2a15cccca0aaf6a95')

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

