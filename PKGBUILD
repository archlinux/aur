# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor : speps <speps at aur dot archlinux dot org>
# Contributor: Marco Maso <demind  at gmail dot com>
# Contributor: Ian Taylor <ian at lorf dot org>

_pkgbase=freeglut
pkgname=lib32-${_pkgbase}
pkgver=3.0.0
pkgrel=3
pkgdesc="Provides functionality for small OpenGL programs. (32-bit)"
arch=('x86_64')
url="http://freeglut.sourceforge.net/"
license=('MIT')
depends=( 'lib32-libgl' 'lib32-libsm' 'lib32-libxrandr' 'lib32-libxi' 'lib32-libxxf86vm' 'freeglut')
makedepends=('gcc-multilib' 'lib32-mesa' 'lib32-glu' 'lib32-libxxf86vm' 'cmake')
source=("http://downloads.sourceforge.net/freeglut/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('9c45d5b203b26a7ff92331b3e080a48e806c92fbbe7c65d9262dd18c39cd6efdad8a795a80f499a2d23df84b4909dbd7c1bab20d7dd3555d3d88782ce9dd15b0')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  mkdir build
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}/build"
  cmake ${srcdir}/${_pkgbase}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib32 -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share}
  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -s ${_pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}
