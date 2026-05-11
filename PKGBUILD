# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_pkgname=openapv
pkgname=openapv-llvm
pkgver=0.2.1.3
pkgrel=3
pkgdesc='The reference implementation of the APV codec — built with Clang and LLVM lld'
arch=('x86_64')
url='https://github.com/AcademySoftwareFoundation/openapv/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('clang' 'cmake' 'lld' 'llvm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/AcademySoftwareFoundation/openapv/archive/v${pkgver}-fix/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b91fbb047869899836aec179e5546a969894a67e2b82f865c87089043a06dd00')

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
    CFLAGS+=' -ffat-lto-objects'
    
    cmake -B build -S "${_pkgname}-${pkgver}-fix" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DOAPV_APP_STATIC_BUILD:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${_pkgname}-${pkgver}-fix/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -f "${pkgdir}/usr/lib/oapv/liboapv.a"
}
