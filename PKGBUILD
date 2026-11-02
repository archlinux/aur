# Maintainer: ORION MELAENO <midway64@proton.me>
# Contributor: ORION MELAENO <midway64@proton.me>

pkgname=elfbsp-git
_pkgname=elfbsp
pkgver=elfbsp_v1.3.1.r1.40d9d6c
pkgrel=1
pkgdesc="Modern BSP tree builder for idTech1 games and source ports. Based on Andrew Apted's AJBSP."
arch=('x86_64')
url="https://elf-alchemist.github.io/elfbsp/"
license=('GPL-2.0-or-later')
depends=('libstdc++' 'glibc' 'libgcc')
makedepends=('cmake' 'git')
provides=('elfbsp')
conflicts=('elfbsp')
source=("git+https://github.com/elf-alchemist/elfbsp.git"
        "git+https://github.com/elf-alchemist/libscanner.git"
        "git+https://github.com/zlib-ng/zlib-ng.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "${_pkgname}"
    git submodule init
    git config submodule.library/scanner.url "${srcdir}/libscanner"
    git config submodule.library/zlib-ng.url "${srcdir}/zlib-ng"
    git -c protocol.file.allow=always submodule update
}

# Building with GCC (instead of Clang - as upstream prefers) since I struggle
# convincing CMake to read the environment flags, as it just skips the Clang
# compiler and uses GCC nevertheless. Suggestions for this issue are welcome.
# (GCC is cool, anyway.)
build() {
    local cmake_options=(
        -B build
        -D CMAKE_BUILD_TYPE=RelWithDebInfo # This is a git pkg, debug is good.
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cd "${_pkgname}"
    cmake "${cmake_options[@]}"
    make all -C build
}

package() {
    cd "${_pkgname}"
    make DESTDIR="$pkgdir/" install -C build
}
