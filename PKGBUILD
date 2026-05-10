# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_pkgname=libaribcaption
pkgname=libaribcaption-llvm
pkgver=1.1.1
pkgrel=2
pkgdesc='Caption decoder/renderer library for handling ARIB STD-B24 based TV broadcast captions — built with Clang and LLVM lld'
arch=('x86_64')
url='https://github.com/xqq/libaribcaption/'
license=('MIT')
depends=('fontconfig' 'freetype2')
makedepends=('clang' 'cmake' 'lld' 'llvm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/xqq/libaribcaption/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('278d03a0a662d00a46178afc64f32535ede2d78c603842b6fd1c55fa9cd44683')

build() {
    export CC=clang
    export CXX=clang++
    export AR=/usr/bin/llvm-ar
    export RANLIB=/usr/bin/llvm-ranlib
    export LD=/usr/bin/ld.lld
    export NM=/usr/bin/llvm-nm
    export OBJCOPY=/usr/bin/llvm-objcopy
    export OBJDUMP=/usr/bin/llvm-objdump
    export READELF=/usr/bin/llvm-readelf
    export STRIP=/usr/bin/llvm-strip
    export CFLAGS="${CFLAGS:-} -O3 -march=native"
    export CXXFLAGS="${CXXFLAGS:-} -O3 -march=native"
    export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
    
    cmake -B build -S "${_pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DARIBCC_SHARED_LIBRARY:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
