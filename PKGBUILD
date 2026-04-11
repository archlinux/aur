# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>
# Contributor: Simon Walker <s.r.walker101@googlemail.com>

# https://wiki.archlinux.org/title/Go_package_guidelines
# https://developer.hashicorp.com/terraform/cli/config/config-file#implied-local-mirror-directories

pkgname=({terraform,opentofu}-provider-libvirt)
_pkgname="$pkgname"
_pkgver=0.9.7
pkgver="v${_pkgver}"
pkgrel=1
arch=("x86_64")
url="https://github.com/dmacvicar/${_pkgname}"
license=("Apache")
depends=("libvirt" "cdrtools")
makedepends=("git" "go")
checkdepends=("go")
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=(94b859477830e8d0d7a6a8a0fa5ac714b714e114d90242d2a285dc3b4905a03f)

build() {
    cd "${_pkgname}-${_pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    unset LDFLAGS
    make build
}

check() {
    cd "${_pkgname}-${_pkgver}"
    make test
}

_package_common() {
    cd "${_pkgname}-${_pkgver}"

    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r docs "$pkgdir/usr/share/doc/${pkgname}"
}

package_terraform-provider-libvirt() {
    pkgdesc="Provision libvirt machines with terraform"

    _package_common

    install -Dm755 "${_pkgname}" \
        -t "${pkgdir}/usr/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/${_pkgver}/linux_amd64"
}

package_opentofu-provider-libvirt() {
    pkgdesc="Provision libvirt machines with OpenTofu"

    _package_common

    install -Dm755 "${_pkgname}" \
        -t "${pkgdir}/usr/share/terraform/plugins/registry.opentofu.org/dmacvicar/libvirt/${_pkgver}/linux_amd64"
}
