# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_pkgname=xeve
pkgname=xeve-llvm
pkgver=0.5.1
pkgrel=2
pkgdesc='MPEG-5 EVC (Essential Video Coding) encoder — built with Clang and LLVM lld'
arch=('x86_64')
url='https://github.com/mpeg5/xeve/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('clang' 'cmake' 'lld' 'llvm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("https://github.com/mpeg5/xeve/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        '010-xeve-disable-werror.patch'
        '020-xeve-fix-pkg-config.patch')
sha256sums=('238c95ddd1a63105913d9354045eb329ad9002903a407b5cf1ab16bad324c245'
            '8c4b607f34a5d39e824f86d00ab101849595cb49a2f67eed131487d658ec7206'
            '68ae77132ec2b3dd8de641d16f3d7cc0de819ddb116484809445666b4d215187')

prepare() {
    printf '%s\n' "v${pkgver}" > "${_pkgname}-${pkgver}/version.txt"
    patch -d "${_pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-xeve-disable-werror.patch"
    patch -d "${_pkgname}-${pkgver}" -Np1 -i "${srcdir}/020-xeve-fix-pkg-config.patch"
}

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
    # https://github.com/mpeg5/xeve/issues/108
    export CFLAGS+=' -mno-avx'
    
    cmake -B build -S "${_pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${_pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${pkgdir}/usr/lib/xeve/libxeve.a"
}
