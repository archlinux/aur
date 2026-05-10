# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_pkgname=xevd
pkgname=xevd-llvm
pkgver=0.5.0
pkgrel=1
pkgdesc='MPEG-5 EVC (Essential Video Coding) decoder — built with Clang and LLVM lld'
arch=('x86_64')
url='https://github.com/mpeg5/xevd/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('clang' 'cmake' 'lld' 'llvm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("https://github.com/mpeg5/xevd/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        '010-xevd-disable-werror.patch'
        '020-xevd-fix-pkg-config.patch')
sha256sums=('8d55c7ec1a9ad4e70fe91fbe129a1d4dd288bce766f466cba07a29452b3cecd8'
            '2a7eff2690c0d4d441df97ad37fd7a0e3e0a03705665dad12201f8d8d997f191'
            '28e46788d188dbbd27c0b47d2c4510029491f434cccfa41967b60d94def36d4a')

prepare() {
    printf '%s\n' "v${pkgver}" > "${_pkgname}-${pkgver}/version.txt"
    patch -d "${_pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-xevd-disable-werror.patch"
    patch -d "${_pkgname}-${pkgver}" -Np1 -i "${srcdir}/020-xevd-fix-pkg-config.patch"
}

build() {
    export CC=clang
    export CXX=clang++
    export AR=/usr/bin/llvm-ar
    export RANLIB=/usr/bin/llvm-ranlib
    export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
    
    cmake -B build -S "${_pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING='-fuse-ld=lld' \
        -DXEVD_APP_STATIC_BUILD:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${_pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${pkgdir}/usr/lib/xevd/libxevd.a"
}
