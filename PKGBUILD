# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

_emscripten_version="1.40.1"

pkgname="gr-framework-js"
pkgver="0.71.2"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=()
makedepends=("git")
source=("https://github.com/sciapp/gr/archive/v${pkgver}.tar.gz" \
        "https://github.com/emscripten-core/emsdk/archive/refs/tags/${_emscripten_version}.tar.gz")
sha256sums=("1b6f05a0e1043ef00998fa9bec120c90a01220551e9b094653a56ee38a4bbd1c" \
            "81f620f17d81c18ab84c69ddfcabe813b2bf4250d69729b961ad57101a16c218")

prepare() {
    cd "${srcdir}/gr-${pkgver}" || return
    echo "${pkgver}" > version.txt
}

build() {
    cd "${srcdir}/emsdk-${_emscripten_version}" || return
    ./emsdk install "${_emscripten_version}" && \
    ./emsdk activate "${_emscripten_version}" && \
    source ./emsdk_env.sh && \

    cd "${srcdir}/gr-${pkgver}" || return
    "${srcdir}/emsdk-${_emscripten_version}"/upstream/emscripten/emmake make -C js
}

package() {
    cd "${srcdir}/gr-${pkgver}" || return
    install -D -m 0444 -v -t "${pkgdir}/usr/gr/lib" "js/gr.js"
}
