# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
# Contributor: Astor Castelo <amcastelo[at]gatech[dot]edu>
# Contributor: Fabio Volpe <volpefabio at gmail dot com>

pkgname=chipmunk
pkgver=7.0.3
pkgrel=2
pkgdesc="A high-performance 2D rigid body physics library"
arch=('i686' 'x86_64')
url="https://chipmunk-physics.net/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/slembcke/Chipmunk2D/archive/Chipmunk-${pkgver}.tar.gz"
        "no-sys-sysctl-header.patch")
sha256sums=('1e6f093812d6130e45bdf4cb80280cb3c93d1e1833d8cf989d554d7963b7899a'
            'adf74765488c932464c33609775b3d9d8043a79162efc2d0f49b42a38d447e8a')

prepare() {
  cd "${srcdir}/Chipmunk2D-Chipmunk-${pkgver}"
  patch -Np1 -i "${srcdir}/no-sys-sysctl-header.patch"
}

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_DEMOS=OFF \
        -DCMAKE_C_FLAGS="-DCHIPMUNK_FFI" \
        ../Chipmunk2D-Chipmunk-${pkgver}
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/Chipmunk2D-Chipmunk-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
