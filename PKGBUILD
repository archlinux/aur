# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
pkgname=dynamorio
pkgdesc="A dynamic instrumentation tool platform"
pkgver=10.0.0
pkgrel=1
arch=('x86_64')
url="https://github.com/DynamoRIO/dynamorio"
license=('BSD' 'custom:libelftc' 'LGPL2.1')
groups=()
depends=('gcc-libs' 'zlib' 'libunwind' 'snappy' 'lz4' 'perl' 'qt5-base' 'python')
makedepends=('git' 'cmake' 'doxygen')
options=(!strip)
source=(
    "${pkgname}::git+${url}.git#tag=release_${pkgver}"
    "git+https://github.com/intel/libipt.git"
    "git+https://github.com/madler/zlib.git"
    )
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.third_party/libipt.url "$srcdir/libipt"
    git config submodule.third_party/zlib.url "$srcdir/zlib"
    git -c protocol.file.allow=always submodule update
}

build() {
    cmake -B build-debug -S "${srcdir}/${pkgname}" \
        -DDEBUG=ON \
        -DCMAKE_INSTALL_PREFIX="/opt/${pkgname}"
        
    cmake --build build-debug

    cmake -B build-release -S "${srcdir}/${pkgname}" \
        -DCMAKE_INSTALL_PREFIX="/opt/${pkgname}"
        
    cmake --build build-release
}

package() {
    DESTDIR="$pkgdir" cmake --install build-debug
    DESTDIR="$pkgdir" cmake --install build-release
    install -Dm644 ${srcdir}/${pkgname}/License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
