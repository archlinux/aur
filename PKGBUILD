#
# Maintainer: Antonio Davide Trogu <contact at redasm dot dev>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Prev. Contributor: Martin Sandsmark <martin.sandsmark@kde.org>
#

pkgname=redasm-beta
_pkgver=4.0.0-beta2
pkgver=${_pkgver/-/.}
pkgrel=1
url="https://redasm.dev"
arch=("x86_64")
pkgdesc="The Open Source Disassembler (beta version)"
license=("GPL-3.0-or-later")
makedepends=("git" "cmake")
depends=("qt6-base" "sqlite")
optdepends=("miniz" "zydis" "capstone>=6.0.0")
conflicts=("redasm" "redasm-git")
provides=("redasm")

source=(
    "workspace.tar.gz::https://github.com/redasm-dev/workspace/archive/refs/tags/v${_pkgver}.tar.gz"
    "core.tar.gz::https://github.com/redasm-dev/core/archive/refs/tags/v${_pkgver}.tar.gz"
    "redasm.tar.gz::https://github.com/redasm-dev/redasm/archive/refs/tags/v${_pkgver}.tar.gz"
    "loaders.tar.gz::https://github.com/redasm-dev/loaders/archive/refs/tags/v${_pkgver}.tar.gz"
    "processors.tar.gz::https://github.com/redasm-dev/processors/archive/refs/tags/v${_pkgver}.tar.gz"
    "analyzers.tar.gz::https://github.com/redasm-dev/analyzers/archive/refs/tags/v${_pkgver}.tar.gz"
    "commands.tar.gz::https://github.com/redasm-dev/commands/archive/refs/tags/v${_pkgver}.tar.gz"
    # "kb.tar.gz::https://github.com/redasm-dev/kb/archive/refs/tags/v${_pkgver}.tar.gz"
    "git+https://github.com/redasm-dev/kb.git"
)

sha256sums=(
    'f71d6c50c9dc4091d444dc032d1a19352dfcf6cd5d953de446bf7b6c9bb0caa1'
    '5c08b6975fa20b6ce7ea176b64a7f26f437e54b43eb6258ac62b36e4b953a26b'
    'f06d324a87cccab300cda5c7eac8a60d5c0a7e9e6972bae03a4b7de8fa2480e7'
    '05017cc4bb6b6a92ec54b5da3aa8e787fb076db729f8c7447194a311394e94d0'
    'ba4f1541304816733edb984c436ae54b314dd9f2828bebe39ecc7d9225317b9a'
    '27a165626c7aed215cb7b903f02c6fe62137d19d704213e27523b60398cb66ef'
    'b6e4503a9fcc971298b793c9b74ed20994a413dbb7885c1aec141e07d8f83c8c'
    'SKIP'
)

prepare() {
    for repo in core redasm loaders processors analyzers commands; do
        ln -sfn "${srcdir}/${repo}-${_pkgver}" "${srcdir}/workspace-${_pkgver}/${repo}"
    done

    mkdir -p "${srcdir}/workspace-${_pkgver}/kb"
    # cp -r "${srcdir}/kb-${_pkgver}/." "${srcdir}/workspace-${_pkgver}/kb"
    cp -r "${srcdir}/kb/." "${srcdir}/workspace-${_pkgver}/kb"
}

build() {
    cd "${srcdir}/workspace-${_pkgver}"
    cmake -B build -DREDASM_RELEASE_TAG="v${_pkgver}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/workspace-${_pkgver}"
    cmake --install build --prefix "${pkgdir}/usr"
}
