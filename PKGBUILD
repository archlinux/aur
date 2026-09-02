#
# Maintainer: Antonio Davide Trogu <contact at redasm dot dev>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Prev. Contributor: Martin Sandsmark <martin.sandsmark@kde.org>
#

pkgname=redasm-beta
_pkgver=4.0.0-beta3
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
    "kb.tar.gz::https://github.com/redasm-dev/kb/archive/refs/tags/v${_pkgver}.tar.gz"
    # "git+https://github.com/redasm-dev/kb.git"
)

sha256sums=('e73162a6887485282e5c29cb855de49452c8d2ad1c1ed7d11e1565866344991a'
            'fba793c18136ba659061f5413f3a18e466d30eebbeba53781fc3f4c863bb3cd3'
            'e9d8a64cd536b2ebb4ace6c591a3566b2eb54845203dec29f3ecf81ae6c32ff2'
            'a5c4ecb8712cf46b88d18ff6806e88c94661e4c74ff971a0a166849064269329'
            'caaa7b0247760e4c9cbc45a5ff48c70f2aa3e075e14f0a71194ae64afb10b4ca'
            '2971d8da3fe6c65cc1cbac00dcfdb3a43cd710946a23d45f8fc0b8a0c833e269'
            '5f6a37d8e03c97267df3491b56db9d56a58a0bf7e649c8300a69d3c4f0e7a3c8'
            'e82f878f4caba462f2ecc82d206f5c8c7d5723e5d6781b266adb04ecde0df914')

prepare() {
    for repo in core redasm loaders processors analyzers commands; do
        ln -sfn "${srcdir}/${repo}-${_pkgver}" "${srcdir}/workspace-${_pkgver}/${repo}"
    done

    mkdir -p "${srcdir}/workspace-${_pkgver}/kb"
    cp -r "${srcdir}/kb-${_pkgver}/." "${srcdir}/workspace-${_pkgver}/kb"
    # cp -r "${srcdir}/kb/." "${srcdir}/workspace-${_pkgver}/kb"
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
