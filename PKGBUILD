# Maintainer: h8ray <gofindme at dmc dot chat>

pkgname=amneziawg-dkms-git
_pkgname=amneziawg-linux-kernel-module
pkgver=r1316.7e7dfca
pkgrel=1
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
        "prepare-awg-sources.sh")
sha256sums=("SKIP"
            "fe308a3a980577ba86998d4d17f390a2261177411a13b5bc9fc98e6c282ce05a"
            "71f3ed61c8328ba9f0cd53f30b32535a201bfe2205c3150044a31ca790e3cd01")

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}"

    ./prepare-awg-sources.sh "${_pkgname}"

    cp -vf --no-preserve=ownership --preserve=mode prepare-kernel-sources.sh "${_pkgname}/kernel-tree-scripts/prepare-sources.sh"
}

package() {
    cd "${srcdir}/${_pkgname}/src"

    make DESTDIR="${pkgdir}" dkms-install
}
