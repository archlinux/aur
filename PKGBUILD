# Maintainer: Michael Migliore <mcmigliore@gmail.com>

pkgname=filament
pkgver=1.1.0
pkgrel=1
pkgdesc='A real-time physically based engine'
arch=('x86_64')
url="https://github.com/google/filament/tree/v${pkgname}"
license=('Apache')
depends=('libc++abi')
makedepends=('cmake' 'clang')
source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7b56e0f5924d206ff8596e5a10a11b7793e14b4757ea09b1945601229215ba22')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    [[ -d build_release ]] && rm -r build_release
    mkdir build_release && cd build_release
    CXX=clang++ cmake \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DFILAMENT_REQUIRES_CXXABI=ON \
          -DBUILD_DEMO=OFF \
          -DBUILD_TESTING=OFF \
          -DENABLE_JAVA=OFF \
          -DCMAKE_EXE_LINKER_FLAGS="-Wl,-z,relro,-z,now" \
          -DCMAKE_CXX_FLAGS="-Wno-c++98-compat-extra-semi" \
          ..
    make filament
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build_release"
	make DESTDIR="${pkgdir}/" install
    rm "${pkgdir}/usr/README.md"
    mv "${pkgdir}/usr/lib/x86_64/"* "${pkgdir}/usr/lib"
    rmdir "${pkgdir}/usr/lib/x86_64/"
    rm -rf "${pkgdir}/usr/docs"
}
