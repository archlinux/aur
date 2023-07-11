# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
_pkgname=dynamorio
pkgname=$_pkgname-git
pkgdesc="A dynamic instrumentation tool platform"
pkgver=9.93.r6029.bb2ff609c
pkgrel=1
arch=('x86_64')
url="https://github.com/DynamoRIO/dynamorio"
license=('BSD' 'custom:libelftc' 'LGPL2.1')
groups=()
depends=('gcc-libs' 'zlib' 'libunwind' 'snappy' 'lz4' 'perl' 'qt5-base' 'python')
makedepends=('git' 'cmake' 'doxygen')
provides=("$_pkgname=$pkgver")
options=(!strip)
source=(
    "${pkgname}::git+${url}.git"
    "git+https://github.com/intel/libipt.git"
    "git+https://github.com/madler/zlib.git"
    "0001-Include-stdint.h-to-use-intptr_t.patch"
    "0002-Fix-Doxygen-1.9.7-build.patch"
    )
sha256sums=('SKIP' 'SKIP' 'SKIP'
            '1169d5b8fa99665f124d72e99cebe6a9605d5e594f498f9371a670e35ebb1d87'
            '6135797f1f9312d2bf8be6ca02cbf1ace575d8a52e44c8d2eaaf5107f22e3f74')

pkgver() {
	cd "${srcdir}/${pkgname}"
    printf "%s.r%s.%s" \
        "$(sed -n 's/.*VERSION_NUMBER_DEFAULT "\([[:digit:]]\+\.[[:digit:]]\+\).*/\1/p' CMakeLists.txt)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.third_party/libipt.url "$srcdir/libipt"
    git config submodule.third_party/zlib.url "$srcdir/zlib"
    git -c protocol.file.allow=always submodule update

	patch -p1 -i "${srcdir}/0001-Include-stdint.h-to-use-intptr_t.patch"
	patch -p1 -i "${srcdir}/0002-Fix-Doxygen-1.9.7-build.patch"
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
