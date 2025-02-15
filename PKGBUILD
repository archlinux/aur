# Maintainer: h8ray <gofindme at dmc dot chat>

pkgname=amneziawg-dkms-git
_pkgname=amneziawg-linux-kernel-module
pkgver=r1316.7e7dfca
pkgrel=3
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard"
arch=("x86_64")
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
license=("GPLv2")
depends=("dkms" "wget" "tar")
makedepends=("git")
provides=(AMNEZIAWG-MODULE)
conflicts=("$_pkgname")
source=("git+https://github.com/amnezia-vpn/amneziawg-linux-kernel-module.git"
        "prepare-kernel-sources.sh"
        "cleanup-kernel-sources.sh")
sha256sums=("SKIP"
            "0e1789cdf6ccf8e4eec88489261e9d3d6c503b92cf34cd49e21fa6a6347949ea"
            "8eea1e6f4806a31962f1de044668219cab4447836bc0c84c2d8425a39da3b9fc")

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}"

    cp -vf --no-preserve=ownership --preserve=mode prepare-kernel-sources.sh "${_pkgname}/kernel-tree-scripts/prepare-sources.sh"
    cp -vf --no-preserve=ownership --preserve=mode cleanup-kernel-sources.sh "${_pkgname}/kernel-tree-scripts/cleanup-sources.sh"

    # Fix Make SIGSEGV https://savannah.gnu.org/bugs/index.php?65172
    sed -i 's/MODERN_KERNEL_SOURCES_NOT_FOUND_ERROR/KERNEL_SRC_ABSENT_ERR/g' "${_pkgname}/src/Makefile"
}

package() {
    cd "${srcdir}/${_pkgname}/src"

    make DESTDIR="${pkgdir}" dkms-install
}
