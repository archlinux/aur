#
# Maintainer: Antonio Davide Trogu <contact at redasm dot dev>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
#

pkgname=redasm-git
pkgver=r2071.474bc030
pkgrel=1
url="https://redasm.dev"
arch=("x86_64")
pkgdesc="The Open Source Disassembler (git version)"
license=("GPL-3.0-or-later")
makedepends=("git" "cmake")
depends=("qt6-base" "sqlite" "miniz" "zydis" "curl" "hicolor-icon-theme")
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
    "git+https://github.com/redasm-dev/workspace.git"
    "git+https://github.com/redasm-dev/core.git"
    "git+https://github.com/redasm-dev/redasm.git"
    "git+https://github.com/redasm-dev/loaders.git"
    "git+https://github.com/redasm-dev/commands.git"
    "git+https://github.com/redasm-dev/analyzers.git"
    "git+https://github.com/redasm-dev/processors.git"
    "git+https://github.com/redasm-dev/kb.git"
    "git+https://github.com/redasm-dev/mcp.git"
)

sha256sums=(
    "85a61daa8ca69c8036ce37529645769bf58ee4c8b0734283228c854cecf55cda"
    "a35d26468c3ed08f30676013e28004cca3c6182b6ee63950b7d59c1a1051112d"
    "af09851f76656d97f12e44f7224bd1066ea441da6efa91dd9c8d53837e8e15d5"
    "34e0f62a2bc11ab20d601e8ca1cc2b2079503aa45119a19133d89d19b94a0fae"

    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
)

pkgver() {
    cd "${srcdir}/redasm"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    local depot_dir="${srcdir}/depot"

    mkdir -p "${srcdir}/depot"
    ln -sfn "${srcdir}/tomlc17-${_tomlc17_ver}" "${depot_dir}/tomlc17"
    ln -sfn "${srcdir}/QHexView-${_qhexview_ver}" "${depot_dir}/QHexView"
    ln -sfn "${srcdir}/capstone-${_capstone_ver}" "${depot_dir}/capstone"
    ln -sfn "${srcdir}/yyjson-${_yyjson_ver}" "${depot_dir}/yyjson"

    for repo in core redasm loaders processors analyzers commands mcp; do
        ln -sfn "${srcdir}/${repo}" "${srcdir}/workspace/${repo}"
    done

    mkdir -p "${srcdir}/workspace/kb"
    cp -r "${srcdir}/kb/." "${srcdir}/workspace/kb"
}

build() {
    local depot_dir="${srcdir}/depot"

    local cmake_options=(
        -B build
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=/usr
        -DREDASM_OFFLINE=ON
        -DREDASM_DEPOT_DIR=${depot_dir}
    )

    cd "${srcdir}/workspace"
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    cd "${srcdir}/workspace"
    DESTDIR="${pkgdir}" cmake --install build
}
