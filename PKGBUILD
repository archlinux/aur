# Maintainer : Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: dummyx <dummyxa at gmail dot com>

_pkgname=vvenc
pkgname=vvenc-llvm
pkgver=1.14.0
pkgrel=3
pkgdesc='A H.266/VVC (Versatile Video Coding) encoder — built with Clang and LLVM lld'
arch=('x86_64')
url='https://github.com/fraunhoferhhi/vvenc/'
license=('BSD-3-Clause-Clear')
depends=(
    'gcc-libs'
    'glibc')
makedepends=(
    'clang'
    'lld'
    'llvm'
    'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/fraunhoferhhi/vvenc/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('dd43d061d59dbc0d9b9ae5b99cb40672877dd811646228938f065798939ee174')

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
    export CFLAGS+=" -ffile-prefix-map=${srcdir}=. -fdebug-prefix-map=${srcdir}=."
    export CXXFLAGS+=" -ffile-prefix-map=${srcdir}=. -fdebug-prefix-map=${srcdir}=."
    
    cmake -B build -S "${_pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DCMAKE_INSTALL_RPATH:STRING='' \
        -DVVENC_INSTALL_FULLFEATURE_APP:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${_pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
