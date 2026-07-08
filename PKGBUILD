#
# Maintainer: Antonio Davide Trogu <contact at redasm dot dev>
# Prev. Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
#

pkgname=redasm-git
pkgver=4.0.0
pkgrel=1
url="https://redasm.dev"
arch=("x86_64")
pkgdesc="The Open Source Disassembler (git version)"
license=("GPL-3.0-or-later")
makedepends=("git" "cmake")
depends=("qt6-base" "sqlite")
optdepends=("miniz" "zydis" "capstone>=6.0.0")
conflicts=("redasm" "redasm-beta")
provides=("redasm")

source=(
    "git+https://github.com/redasm-dev/workspace.git"
    "git+https://github.com/redasm-dev/core.git"
    "git+https://github.com/redasm-dev/redasm.git"
    "git+https://github.com/redasm-dev/loaders.git"
    "git+https://github.com/redasm-dev/commands.git"
    "git+https://github.com/redasm-dev/analyzers.git"
    "git+https://github.com/redasm-dev/processors.git"
    "git+https://github.com/redasm-dev/kb.git"
)

sha256sums=(
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
    for repo in core redasm loaders processors analyzers commands; do
        ln -sfn "${srcdir}/${repo}" "${srcdir}/workspace/${repo}"
    done

    mkdir -p "${srcdir}/workspace/kb"
    cp -r "${srcdir}/kb/." "${srcdir}/workspace/kb"
}

build() {
    cd "${srcdir}/workspace"
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/workspace"
    cmake --install build --prefix "${pkgdir}/usr"
}
