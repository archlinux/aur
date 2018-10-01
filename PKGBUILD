# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('lib32-gamemode-git')
_pkgname=('gamemode')
pkgver=r120.0d179e5
pkgrel=1
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS."
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
depends=('polkit' 'gamemode-git' 'lib32-glibc')
makedepends=('meson' 'ninja' 'pkg-config' 'git')
provides=('lib32-gamemode')
conflicts=('lib32-gamemode')
source=("git+https://github.com/FeralInteractive/gamemode.git")
sha256sums=('SKIP')

pkgver() {
    cd gamemode
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  export CFLAGS=-m32
  export CXXFLAGS=-m32
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  arch-meson ${_pkgname} build \
    -Dwith-daemon=false -Dwith-examples=false -Dwith-systemd=false --libdir lib32
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
  rm -rf $pkgdir/usr/include 
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${_pkgname}/LICENSE.txt
}
