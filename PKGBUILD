# Maintainer: ORION MELAENO <midway64@proton.me>
# Contributor: ORION MELAENO <midway64@proton.me>

pkgname=elfbsp
_pkgname=elfbsp
pkgver=1.3.1
pkgrel=1
pkgdesc="Modern BSP tree builder for idTech1 games and source ports. Based on Andrew Apted's AJBSP."
arch=('x86_64')
url="https://elf-alchemist.github.io/elfbsp/"
license=('GPL-2.0-or-later')
depends=('libstdc++' 'glibc' 'libgcc')
makedepends=('cmake' 'git')
provides=('elfbsp')
conflicts=('elfbsp')
source=("git+https://github.com/elf-alchemist/elfbsp.git#tag=${_pkgname}_v${pkgver}"
        "git+https://github.com/elf-alchemist/libscanner.git#commit=7655f74263471f440c41d08ad088cded215f07d9"
        "git+https://github.com/zlib-ng/zlib-ng.git#commit=70ce6cefbbcff8233b724c5e3c41b95113f5dc5d")
sha256sums=('5fd8932c09661a04e6e5c3b666b182b4775a4b339e8604b3f316a3fc90d33b7c'
            'ffd3ba50c6ae453b4360d577294113a2be1c723daca9bb1e56ace7f913c01466'
            'cf6c55095710a9133579b74d57fe5d239618fcb2b036a351e1fb767a3811c71f')

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
        -D CMAKE_BUILD_TYPE=MinSizeRel # Keep that size low, no debug for you.
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
