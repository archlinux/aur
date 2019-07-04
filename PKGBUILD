# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Contributor: Azrael <charles.gueunet+aur@gmail.com>

pkgname=filament
pkgver=1.3.0
pkgrel=1
pkgdesc='A real-time physically based engine'
arch=('x86_64')
url="https://github.com/google/${pkgname}/tree/v${pkgver}"
license=('Apache')
depends=('libc++' 'libc++abi' 'mesa' 'libxi')
makedepends=('cmake' 'clang')
conflicts=('mono') # because of /usr/bin/cmgen
source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a12b704368fcf99cfd97354fc7436365d19dc76b05525f0cd9fb5574b65ccb27')

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
          -DDIST_DIR="." \
          -DCMAKE_EXE_LINKER_FLAGS="-Wl,-z,relro,-z,now" \
          ..
    make
}

package() {
    cd "${pkgname}-${pkgver}/build_release"
    make DESTDIR="${pkgdir}/" install
    rm -rf "${pkgdir}/usr/README.md" "${pkgdir}/usr/docs"
}
