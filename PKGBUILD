# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

_emscripten_version="1.40.1"

pkgname="gr-framework-js"
pkgver="0.67.0"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications."
arch=("any")
url="https://gr-framework.org"
license=("MIT")
depends=()
makedepends=("git")
source=("https://github.com/sciapp/gr/archive/v${pkgver}.tar.gz" \
        "https://github.com/emscripten-core/emsdk/archive/refs/tags/${_emscripten_version}.tar.gz")
sha256sums=("5cdd5baf574a1bb3d24f6f18b44cb6eabff10fed3fccab576ec91b24b17b8ad9" \
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
