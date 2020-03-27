# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=level-zero
pkgname=('level-zero-headers' 'level-zero-loader')
pkgver=0.91.10
pkgrel=1
pkgdesc='API for accessing low level interfaces in oneAPI platform devices'
arch=('x86_64')
url='https://spec.oneapi.com/versions/latest/elements/l0/source/index.html'
license=('MIT')
makedepends=('cmake' 'opencl-headers')
source=("${pkgbase}-${pkgver}.tar.gz"::"https://github.com/oneapi-src/level-zero/archive/v${pkgver}.tar.gz")
sha256sums=('9193d8cc57cd63f9b0f44bbc51c9d099c6e899781edb33f9869a850865c64d3d')

prepare() {
    printf '%s\n' '0' > "${pkgbase}-${pkgver}/VERSION_PATCH"
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake -B build -S "${pkgbase}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package_level-zero-headers() {
    pkgdesc='oneAPI Level Zero header files'
    arch=('any')
    
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 "${pkgbase}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # remove loader files
    [ -d 'usr' ] && rm -rf usr
    mv "${pkgdir}/usr/lib" loader
}

package_level-zero-loader() {
    pkgdesc='oneAPI Level Zero loader'
    depends=('gcc-libs')
    #optdepends=('level-zero-gpu-driver: for packaged Level Zero GPU driver') # no package provides this yet
    
    mkdir -p "${pkgdir}/usr"
    mv loader "${pkgdir}/usr/lib"
    install -D -m644 "${pkgbase}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
