# Maintainer: Fabian Posch <aur@posch.tech>

_pkgname=dflowmap
pkgname=act-${_pkgname}-git
_basever=0
_patchlvl=1
_gitversion=r429.05c74e4
pkgver=${_basever}.${_patchlvl}.${_gitversion}
pkgrel=1
pkgdesc="dflowmap is used to map ACT dataflow programs into production rule based circuit description."
arch=('x86_64')
url="https://github.com/asyncvlsi/dflowmap"
license=('GPL-2.0-only')
depends=('act-core' 'glibc' 'gcc-libs')
optdepends=('act-expropt: Logic optimization')
makedepends=('git' 'make' 'gcc' 'cmake')
conflicts=("act-${_pkgname}")
provides=("act-${_pkgname}")
source=(
    "git+${url}"
    "cmakelists.patch"
)
sha512sums=(
    "SKIP"
    "a721916ae9b430b9acb84d4d1b4c2f7901355a73a2cf030d09e3653cf0af119af3097174144c17bbd4c1e52ddbbb2712d15db9fa11e8739b653f0fb9d479b7b7"
)

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd ${srcdir}/${_pkgname}

    patch CMakeLists.txt < ${srcdir}/cmakelists.patch
}

build() {
    cd ${srcdir}/${_pkgname}

    ./configure
    mkdir -p build
    cd build
    
    export ACT_HOME="/opt/act-async"
    
    # install prefix is forced to ACT_HOME in the CMake file; Override
    # arch build environment by default activates -Werror=format-security, dflowmap has some issues there
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/opt/act-async" -DCMAKE_C_FLAGS="-Wno-error=format-security" -DCMAKE_CXX_FLAGS="-Wno-error=format-security" ..
    make -j
}

package() {
    install -Dm644 ${srcdir}/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd ${srcdir}/${_pkgname}/build
    make install

}