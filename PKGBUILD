# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Contributor: Azrael <charles.gueunet+aur@gmail.com>

pkgname=filament
pkgver=1.1.0
pkgrel=3
pkgdesc='A real-time physically based engine'
arch=('x86_64')
url="https://github.com/google/${pkgname}/tree/v${pkgver}"
license=('Apache')
depends=('libc++' 'libc++abi' 'mesa' 'libxi')
makedepends=('cmake' 'clang')
conflicts=('mono') # because of /usr/bin/cmgen
source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('c9e22ee94c866e997e5caa09994944addb138d1a5cf0c3ff9558c415af69750317700af461584e92b13a97e217646137e71ac161afc7ab47bc459c20dfd342bf')
build() {
    cd "${pkgname}-${pkgver}"
    [[ -d build_release ]] && rm -r build_release
    mkdir build_release && cd build_release
    cmake -DCMAKE_CXX_COMPILER=clang++ \
          -DCMAKE_C_COMPILER=clang \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DFILAMENT_REQUIRES_CXXABI=ON \
          -DBUILD_DEMO=OFF \
          -DBUILD_TESTING=OFF \
          -DENABLE_JAVA=OFF \
          -DCMAKE_EXE_LINKER_FLAGS="-Wl,-z,relro,-z,now" \
          -DCMAKE_CXX_FLAGS="-Wno-everything" \
          ..
    make filament
}

package() {
    cd "${pkgname}-${pkgver}/build_release"
    make DESTDIR="${pkgdir}/" install
    mv "${pkgdir}/usr/lib/x86_64/"* "${pkgdir}/usr/lib"
    rm -rf "${pkgdir}/usr/lib/x86_64" "${pkgdir}/usr/README.md" "${pkgdir}/usr/docs"
}
