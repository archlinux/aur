# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=x265-git
pkgver=4.1.r189.gcd4f0d6e9
pkgrel=1
pkgdesc='Open source H.265/HEVC video encoder (git version)'
arch=('x86_64')
url='https://bitbucket.org/multicoreware/x265_git'
license=('GPL-2.0-or-later')
depends=(
    'gcc-libs'
    'glibc')
makedepends=(
    'cmake'
    'git'
    'nasm')
provides=('x265' 'libx265.so')
conflicts=('x265')
source=('git+https://bitbucket.org/multicoreware/x265_git.git'
        '010-x265-gcc15-fix.patch')
sha256sums=('SKIP'
            '4eb688e63b24cfdf9c44225ada42cbd1351809d7190935ed10ee5f8496c3cb7c')

prepare() {
    patch -d x265_git -Np1 -i "${srcdir}/010-x265-gcc15-fix.patch"
}

pkgver() {
    git -C x265_git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    local -a common_opts_all=(
        '-Sx265_git/source'
        '-GUnix Makefiles'
        '-DCMAKE_ASM_NASM_FLAGS:STRING=-w-macro-params-legacy'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-DENABLE_HDR10_PLUS:BOOL=ON'
        '-Wno-dev')
    local -a common_opts_10_12=(
        "${common_opts_all[@]}"
        '-DENABLE_CLI:BOOL=OFF'
        '-DENABLE_SHARED:BOOL=OFF'
        '-DEXPORT_C_API:BOOL=OFF'
        '-DHIGH_BIT_DEPTH:BOOL=ON')
    
    cmake -B build-12 "${common_opts_10_12[@]}" -DMAIN12:BOOL='ON'
    cmake --build build-12
    
    cmake -B build-10 "${common_opts_10_12[@]}"
    cmake --build build-10
    
    cmake -B build \
        "${common_opts_all[@]}" \
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
