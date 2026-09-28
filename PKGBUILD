# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=x265-git
pkgver=4.3.r53.g67d8a7d19
pkgrel=1
pkgdesc='Open source H.265/HEVC video encoder (git version)'
arch=('x86_64')
url='https://github.com/Multicorewareinc/x265/'
license=('GPL-2.0-or-later')
depends=(
    'glibc'
    'libstdc++')
makedepends=(
    'cmake'
    'git'
    'nasm')
provides=('x265' 'libx265.so')
conflicts=('x265')
source=('git+https://github.com/Multicorewareinc/x265.git'
        '010-x265-gcc15-fix.patch')
sha256sums=('SKIP'
            'd9ce7553f8c0e260849dca37f3b4c1bd51522b5e24386d134697dd7003df2deb')

prepare() {
    patch -d x265 -Np1 -i "${srcdir}/010-x265-gcc15-fix.patch"
}

pkgver() {
    git -C x265 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    local -a _common_opts_all=(
        '-Sx265/source'
        '-GUnix Makefiles'
        '-DCMAKE_ASM_NASM_FLAGS:STRING=-w-macro-params-legacy'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-DENABLE_HDR10_PLUS:BOOL=ON'
        '-Wno-author')
    local -a _common_opts_10_12=(
        "${_common_opts_all[@]}"
        '-DENABLE_CLI:BOOL=OFF'
        '-DENABLE_SHARED:BOOL=OFF'
        '-DEXPORT_C_API:BOOL=OFF'
        '-DHIGH_BIT_DEPTH:BOOL=ON')
    
    cmake -B build-12 "${_common_opts_10_12[@]}" -DMAIN12:BOOL='ON'
    cmake --build build-12
    
    cmake -B build-10 "${_common_opts_10_12[@]}"
    cmake --build build-10
    
    cmake -B build \
        "${_common_opts_all[@]}" \
        -DENABLE_SHARED:BOOL='ON' \
        -DEXTRA_LIB:STRING='x265_main10.a;x265_main12.a' \
        -DEXTRA_LINK_FLAGS:STRING='-L.' \
        -DLINKED_10BIT:BOOL='ON' \
        -DLINKED_12BIT:BOOL='ON'
    ln -s ../build-10/libx265.a build/libx265_main10.a
    ln -s ../build-12/libx265.a build/libx265_main12.a
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
