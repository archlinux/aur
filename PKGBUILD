#
# Maintainer: Antonio Davide Trogu <contact at redasm dot dev>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
#

pkgname=redasm-beta
_pkgver=4.0.0-beta4
pkgver=${_pkgver/-/.}
pkgrel=1
url="https://redasm.dev"
arch=("x86_64")
pkgdesc="The Open Source Disassembler (beta version)"
license=("GPL-3.0-or-later")
makedepends=("git" "cmake")
depends=("qt6-base" "sqlite" "miniz" "zydis")
optdepends=("curl: networking support")
conflicts=("redasm" "redasm-beta")
provides=("redasm")

# Depots versions
_tomlc17_ver="R20260501"
_qhexview_ver="5.1.4"
_capstone_ver="6.0.0-Alpha10"
_yyjson_ver="0.13.0"

source=(
    # Depots
    "tomlc17-${_tomlc17_ver}.tar.gz::https://github.com/cktan/tomlc17/archive/${_tomlc17_ver}.tar.gz"
    "QHexView-${_qhexview_ver}.tar.gz::https://github.com/Dax89/QHexView/archive/v${_qhexview_ver}.tar.gz"
    "capstone-${_capstone_ver}.tar.gz::https://github.com/capstone-engine/capstone/archive/${_capstone_ver}.tar.gz"
    "yyjson-${_yyjson_ver}.tar.gz::https://github.com/ibireme/yyjson/archive/${_yyjson_ver}.tar.gz"

    # REDasm
    "workspace.tar.gz::https://github.com/redasm-dev/workspace/archive/refs/tags/v${_pkgver}.tar.gz"
    "core.tar.gz::https://github.com/redasm-dev/core/archive/refs/tags/v${_pkgver}.tar.gz"
    "redasm.tar.gz::https://github.com/redasm-dev/redasm/archive/refs/tags/v${_pkgver}.tar.gz"
    "loaders.tar.gz::https://github.com/redasm-dev/loaders/archive/refs/tags/v${_pkgver}.tar.gz"
    "processors.tar.gz::https://github.com/redasm-dev/processors/archive/refs/tags/v${_pkgver}.tar.gz"
    "analyzers.tar.gz::https://github.com/redasm-dev/analyzers/archive/refs/tags/v${_pkgver}.tar.gz"
    "commands.tar.gz::https://github.com/redasm-dev/commands/archive/refs/tags/v${_pkgver}.tar.gz"
    "kb.tar.gz::https://github.com/redasm-dev/kb/archive/refs/tags/v${_pkgver}.tar.gz"
    "mcp.tar.gz::https://github.com/redasm-dev/mcp/archive/refs/tags/v${_pkgver}.tar.gz"
)

sha256sums=(
    "85a61daa8ca69c8036ce37529645769bf58ee4c8b0734283228c854cecf55cda"
    "a35d26468c3ed08f30676013e28004cca3c6182b6ee63950b7d59c1a1051112d"
    "af09851f76656d97f12e44f7224bd1066ea441da6efa91dd9c8d53837e8e15d5"
    "34e0f62a2bc11ab20d601e8ca1cc2b2079503aa45119a19133d89d19b94a0fae"

    '686a94ee31feeb4dee71e1d9841d2b9bb5e3d003cae67245f497c7f3cb63c79c'
    '50edd094b9dcb180646bad8785cff0cb8abe4e7e9b779132599b8163468636b4'
    'ba5d206ff0dbb56690d94fc943369c55fdd7520751230f8a0324202685a59f7a'
    'ff916b22374cf12f8afd4ca210566fd85106770ea30fa7019b77421e3ec08a21'
    '4c488cf4dc13c896541d7d8dcf6b14c09cf391a220235c831097270df914345a'
    '444e11c885c8206da397c8adc72d9e6cf21421e11d28f66bb600ec0528a843c1'
    '88a16c0058ea043a626c8f6a718a8f166ab4ebf943b8d4e0efc2f66d60a97f7d'
    '408af6ba8607b61ca740cde2bd53c7ca3a2374207d2cf6d6406c6a356ffc4cd6'
    '5726a7582a5b231fca83aac6d9cd00e87ca00dd3b3edc2e4bbbbc38ed535098d'
)

prepare() {
    local depot_dir="${srcdir}/depot"

    mkdir -p "${srcdir}/depot"
    ln -sfn "${srcdir}/tomlc17-${_tomlc17_ver}" "${depot_dir}/tomlc17"
    ln -sfn "${srcdir}/QHexView-${_qhexview_ver}" "${depot_dir}/QHexView"
    ln -sfn "${srcdir}/capstone-${_capstone_ver}" "${depot_dir}/capstone"
    ln -sfn "${srcdir}/yyjson-${_yyjson_ver}" "${depot_dir}/yyjson"

    for repo in core redasm loaders processors analyzers commands mcp; do
        ln -sfn "${srcdir}/${repo}-${_pkgver}" "${srcdir}/workspace-${_pkgver}/${repo}"
    done

    mkdir -p "${srcdir}/workspace-${_pkgver}/kb"
    cp -r "${srcdir}/kb-${_pkgver}/." "${srcdir}/workspace-${_pkgver}/kb"
}

build() {
    local depot_dir="${srcdir}/depot"

    local cmake_options=(
        -B build
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=/usr
        -DREDASM_RELEASE_TAG="v${_pkgver}"
        -DREDASM_OFFLINE=ON
        -DREDASM_DEPOT_DIR=${depot_dir}
    )

    cd "${srcdir}/workspace-${_pkgver}"
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    cd "${srcdir}/workspace-${_pkgver}"
    cmake --install build --prefix "${pkgdir}/usr"
}
