# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('lib32-gamemode')
_pkgname=('gamemode')
pkgver=1.1
pkgrel=1
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS."
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
depends=('gamemode' 'lib32-glibc')
makedepends=('meson' 'ninja' 'pkg-config' 'git' 'lib32-systemd')
provides=('lib32-gamemode')
source=("$pkgname-$pkgver::git+https://github.com/FeralInteractive/gamemode.git#tag=$pkgver")
#source=("https://github.com/FeralInteractive/gamemode/archive/$pkgver.tar.gz")
#sha256sums=('bc458e294221e06b63edb286dd3dc1b541014941027198600959b27b11dd6a9d')
sha256sums=('SKIP')


build() {
  export CFLAGS=-m32
  export CXXFLAGS=-m32
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  arch-meson ${pkgname}-$pkgver build \
    -Dwith-daemon=false -Dwith-examples=false -Dwith-systemd=false --libdir lib32
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
  rm -rf $pkgdir/usr/include 
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname}-${pkgver}/LICENSE.txt
}

