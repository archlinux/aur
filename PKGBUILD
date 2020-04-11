# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=level-zero-git
pkgname=('level-zero-headers-git' 'level-zero-loader-git')
pkgver=0.91.10.r2.g13d1883
pkgrel=1
pkgdesc='API for accessing low level interfaces in oneAPI platform devices (git version)'
arch=('x86_64')
url='https://spec.oneapi.com/versions/latest/elements/l0/source/index.html'
license=('MIT')
makedepends=('git' 'cmake' 'opencl-headers')
source=('git+https://github.com/oneapi-src/level-zero.git')
sha256sums=('SKIP')

pkgver() {
    git -C level-zero describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake -B build -S level-zero \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package_level-zero-headers-git() {
    pkgdesc='oneAPI Level Zero header files (git version)'
    arch=('any')
    provides=('level-zero-headers')
    conflicts=('level-zero-headers')
    
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 level-zero/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # remove loader files
    [ -d 'loader' ] && rm -rf loader
    mkdir -p loader
    mv "${pkgdir}/usr/lib" loader
}

package_level-zero-loader-git() {
    pkgdesc='oneAPI Level Zero loader (git version)'
    depends=('gcc-libs')
    #optdepends=('level-zero-gpu-driver: for packaged Level Zero GPU driver') # no package provides this yet
    provides=('level-zero-loader')
    conflicts=('level-zero-loader')
    
    mv loader "${pkgdir}/usr"
    install -D -m644 level-zero/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
