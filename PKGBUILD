# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cnmatrix-git
pkgver=0.0.r40.g2b567b3
pkgrel=1
pkgdesc='C interface to a few matrix backends (git version)'
arch=('x86_64')
url='https://github.com/cntools/cnmatrix/'
license=('MIT')
depends=(
    'cblas'
    'lapacke')
makedepends=(
    'cmake'
    'eigen'
    'git')
provides=('cnmatrix')
conflicts=('cnmatrix')
source=('git+https://github.com/cntools/cnmatrix.git')
sha256sums=('SKIP')

pkgver() {
    git -C cnmatrix describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    # for allowing the use of a different cblas provider
    export CFLAGS+=" $(pkg-config --cflags cblas)"
    
    export CXXFLAGS+=' -isystem/usr/include/eigen3'
    cmake -B build -S cnmatrix \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_TESTS:BOOL='ON' \
        -Wno-author
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 cnmatrix/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
