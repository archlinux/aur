# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=level-zero-git
pkgname=('level-zero-headers-git' 'level-zero-loader-git')
pkgver=1.9.4.r0.g4ed13f3
pkgrel=2
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
    cmake -B build -S level-zero \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package_level-zero-headers-git() {
    pkgdesc='oneAPI Level Zero header files (git version)'
    arch=('any')
    provides=('level-zero-headers')
    conflicts=('level-zero-headers')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 level-zero/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # remove loader files
    [ -d 'loader' ] && rm -rf loader
    mkdir -p loader
    mv "${pkgdir}/usr/lib" loader
}

package_level-zero-loader-git() {
    pkgdesc='oneAPI Level Zero loader (git version)'
    depends=('gcc-libs')
    optdepends=('level-zero-driver: for packaged Level Zero driver')
    provides=('level-zero-loader')
    conflicts=('level-zero-loader')
    
    mv loader "${pkgdir}/usr"
    install -D -m644 level-zero/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
