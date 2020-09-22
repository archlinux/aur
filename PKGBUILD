# Ruijie Yu (first.last@outlook.com)
pkgname=ctre-git
_pkgname=${pkgname%-git}
pkgver=2.9.1.r2.gfca770c
pkgrel=1
pkgdesc='A Compile time PCRE (almost) compatible regular expression matcher'
url="https://github.com/hanickadot/compile-time-regular-expressions/"
arch=(any)
license=(Apache-2.0)
depends=()
optdepends=(
'gcc: c++ compiler'
'clang: c++ compiler'
)
makedepends=(git cmake make)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
"${_pkgname}::git+https://github.com/hanickadot/compile-time-regular-expressions.git#branch=master"
)
sha512sums=(SKIP)
_cmake_config=Release

prepare() {
    cd "${srcdir}/${_pkgname}"
    cmake \
        --warn-uninitialized \
        --warn-unused-vars \
        -S . -B build
}

build() {
    cmake \
        --build "${srcdir}/${_pkgname}/build" \
        --config "$_cmake_config" \
        -j
}

check() {
    cd "${srcdir}/${_pkgname}/build"
    ctest \
        --no-tests=ignore \
        --output-on-failure \
        --progress
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    local _version="$(git describe --tags --match 'v*' | sed s/-/.r/ | sed s/-/./)"
    echo "${_version#v}"
}

package() {
    cmake \
        --install "${srcdir}/${_pkgname}/build" \
        --prefix "${pkgdir}/usr/" \
        --config "$_cmake_config"
}

