# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>
# Contributor: Simon Walker <s.r.walker101@googlemail.com>

# https://wiki.archlinux.org/title/Go_package_guidelines
# https://developer.hashicorp.com/terraform/cli/config/config-file#implied-local-mirror-directories

pkgname=({terraform,opentofu}-provider-libvirt)
_pkgname="$pkgname"
_pkgver=0.7.6
pkgver="v${_pkgver}"
pkgrel=2
arch=("x86_64")
url="https://github.com/dmacvicar/${_pkgname}"
license=("Apache")
depends=("libvirt" "cdrtools")
makedepends=("git" "go")
checkdepends=("go")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=(03a8305b3f2361dc8a147ac4ea0897ca3cc66387ef4e7346d2233324135e1b8c)

build() {
    cd "${_pkgname}-${_pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    unset LDFLAGS
    make
}

check() {
    cd "${_pkgname}-${_pkgver}"
    make test
}

_package_common() {
    cd "${_pkgname}-${_pkgver}"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 {CHANGELOG,README,docs/migration-13}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r website/docs "$pkgdir/usr/share/doc/${pkgname}"
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
