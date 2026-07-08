#
# Maintainer: Antonio Davide Trogu <contact at redasm dot dev>
# Prev. Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>
#

pkgname=redasm-beta
_pkgver=4.0.0-beta1
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
    "commands.tar.gz::https://github.com/redasm-dev/commands/archive/refs/tags/v${_pkgver}.tar.gz"
    "git+https://github.com/redasm-dev/kb.git"
)

sha256sums=(
    "ee6774ab11321cab8da631e1c2fa9a401532c7b4cf2f77d71f1ac818c054e156"
    "f16298fbe8993ead5a3edf0037e943f8758e8efd6dd75cc6eb804b919a8addf4"
    "ab34dbf5cad7e6a77f637121b059b74cdcc82c6f607fc71ecf009c2ca2a218f5"
    "53b638a7b96728496aac1ca0bc69733a43f468daab312c2891bcd6852f8aa37e"
    "496f5168ee2364770380a890573448339a074f0cae16a2bc10bb128fc1478e11"
    "ab2e60b8e1e7ae001c816c7c345e1b13019e5e82ca72cd5c8d075b0e7dd021dd"
    "SKIP"
)

prepare() {
    for repo in core redasm loaders processors commands; do
        ln -sfn "${srcdir}/${repo}-${_pkgver}" "${srcdir}/workspace-${_pkgver}/${repo}"
    done

    mkdir -p "${srcdir}/workspace-${_pkgver}/kb"
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
