# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=level-zero
pkgname=('level-zero-headers' 'level-zero-loader')
pkgver=0.91
pkgrel=1
pkgdesc='API for accessing low level interfaces in oneAPI platform devices'
arch=('x86_64')
url='https://spec.oneapi.com/versions/latest/elements/l0/source/index.html'
license=('MIT')
makedepends=('cmake' 'opencl-headers')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/oneapi-src/level-zero/archive/v${pkgver}.tar.gz")
sha256sums=('48f3dc7356f8937605ab2af99b127d5337ae3a4b685301bb303000dcfdb8555d')

prepare() {
    printf '%s\n' '0' > "level-zero-${pkgver}/VERSION_PATCH"
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake -B build -S "level-zero-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package_level-zero-headers() {
    pkgdesc='oneAPI Level Zero header files'
    arch=('any')
    
    make -C build DESTDIR="$pkgdir" install
    
    # remove loader files
    [ -d 'loader' ] && rm -rf loader
    mkdir -p loader
    mv "${pkgdir}/usr/lib" loader
    
    install -D -m644 "level-zero-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_level-zero-loader() {
    pkgdesc='oneAPI Level Zero loader'
    depends=('gcc-libs')
    #optdepends=('level-zero-gpu-driver: for packaged Level Zero GPU driver') # no package provides this yet
    
    mkdir -p "${pkgdir}/usr"
    mv loader/lib "${pkgdir}/usr"
    
    install -D -m644 "level-zero-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
