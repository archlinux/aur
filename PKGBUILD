# Ruijie Yu (first.last@outlook.com)
pkgname=semver-cpp-git
_pkgname=${pkgname%-git}
pkgver=0.2.2.r18.ge804882
pkgrel=1
pkgdesc='Semantic Versioning for modern C++'
url="https://github.com/Neargye/semver"
arch=(any)
license=(MIT)
depends=()
optdepends=(
'gcc: c++ compiler'
'clang: c++ compiler'
)
makedepends=(git cmake make)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
"$_pkgname::git+$url.git#branch=master"
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

