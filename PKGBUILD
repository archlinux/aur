# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

_emscripten_version="1.40.1"

pkgname="gr-framework-js-git"
pkgver="0.71.1.r27.g03008c9d"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=()
makedepends=("git")
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*-*}::git+https://github.com/sciapp/gr.git#branch=develop" \
        "https://github.com/emscripten-core/emsdk/archive/refs/tags/${_emscripten_version}.tar.gz")
sha256sums=("SKIP" \
            "81f620f17d81c18ab84c69ddfcabe813b2bf4250d69729b961ad57101a16c218")

pkgver() {
    cd "${srcdir}/${pkgname%-*-*}" || return
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/emsdk-${_emscripten_version}" || return
    ./emsdk install "${_emscripten_version}" && \
    ./emsdk activate "${_emscripten_version}" && \
    source ./emsdk_env.sh && \

    cd "${srcdir}/${pkgname%-*-*}" || return
    "${srcdir}/emsdk-${_emscripten_version}"/upstream/emscripten/emmake make -C js
}

package() {
    cd "${srcdir}/${pkgname%-*-*}" || return
    install -D -m 0444 -v -t "${pkgdir}/usr/gr/lib" "js/gr.js"
}
