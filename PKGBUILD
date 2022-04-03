# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('lib32-gamemode-git')
_pkgname=('gamemode')
pkgver=r592.b8fa857
pkgrel=2
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

#prepare() {
#    cd $_pkgname
#    patch --forward --strip=1 --input="${startdir}/temp_util_fix.patch"
#}
pkgver() {
    cd gamemode
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  export CFLAGS=-m32
  export CXXFLAGS=-m32
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  meson ${_pkgname} build  --prefix /usr \
    -Dwith-examples=false -Dwith-util=false --libdir lib32 \
    -Dwith-sd-bus-provider=no-daemon
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
#  rm -rf $pkgdir/usr/include 
# let's remove all the things since we are only interested in the lib32 part.
  rm -rf $pkgdir/usr/{include,bin,lib,share}
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${_pkgname}/LICENSE.txt
}
