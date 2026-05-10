# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_pkgname=mpeghdec
pkgname=mpeghdec-llvm
pkgver=3.0.3
pkgrel=2
pkgdesc='Fraunhofer MPEG-H audio decoder — built with Clang and LLVM lld'
arch=('x86_64')
url='https://mpegh.com/'
license=('LicenseRef-Custom')
depends=(
    'glibc'
    'libgcc'
    'libstdc++')
makedepends=(
    'clang'
    'cmake'
    'git'
    'lld'
    'llvm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/Fraunhofer-IIS/mpeghdec/archive/r${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0198ebc824332926c0c39abf216df65606da896a4204c93be77b1581b5bf0b73')

build() {
    export CC=clang
    export CXX=clang++
    export AR=/usr/bin/llvm-ar
    export RANLIB=/usr/bin/llvm-ranlib
    export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
    
    cmake -B build -S "mpeghdec-r${pkgver}" \
        -G 'Unix Makefiles' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m755 build/bin/* -t "${pkgdir}/usr/bin"
    install -D -m644 "mpeghdec-r${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/pkgconfig" "${pkgdir}/usr/lib"
    rm -r "${pkgdir}/usr/include"/{ilo,mmtisobmff}
    rm "${pkgdir}/usr/lib"/lib{ilo,mmtisobmff}.a
    rm "${pkgdir}/usr/lib/pkgconfig"/{ilo,mmtisobmff}.pc
}
