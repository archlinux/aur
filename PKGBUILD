# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>
# Contributor: Simon Walker <s.r.walker101@googlemail.com>

# https://wiki.archlinux.org/title/Go_package_guidelines
# https://developer.hashicorp.com/terraform/cli/config/config-file#implied-local-mirror-directories

pkgname=({opentofu,terraform}-provider-hcloud)
_pkgname="${pkgname[1]}"
_pkgver=1.47.0
pkgver="v${_pkgver}"
pkgrel=3
arch=("x86_64")
url="https://github.com/hetznercloud/${_pkgname}"
license=("MPL-2.0")
makedepends=("git" "go")
checkdepends=("go")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=(6d8b71b527314d83e132dd67b8c92950f9adf2528d755d7f4211949e38686997)

prepare(){
    cd "${_pkgname}-${_pkgver}"
    mkdir -p build
}

build() {
    cd "${_pkgname}-${_pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    export MAKEFLAGS="${MAKEFLAGS} CGO_ENABLED=1"
    GOBIN=$PWD/build make build
}

#check() {
#    cd "${_pkgname}-${_pkgver}"
#    make test
#}

_package_common() {
    cd "${_pkgname}-${_pkgver}"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 {CHANGELOG,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r website/docs "$pkgdir/usr/share/doc/${pkgname}"
}

package_terraform-provider-hcloud() {
    pkgdesc="Terraform Hetzner Cloud provider"

    _package_common

    install -Dm755 build/"${_pkgname}" \
        -t "${pkgdir}/usr/share/terraform/plugins/registry.terraform.io/hetznercloud/hcloud/${_pkgver}/linux_amd64"
}

package_opentofu-provider-hcloud() {
    pkgdesc="OpenTofu Hetzner Cloud provider"

    _package_common

    install -Dm755 build/"${_pkgname}" \
        -t "${pkgdir}/usr/share/terraform/plugins/registry.opentofu.org/hetznercloud/hcloud/${_pkgver}/linux_amd64"
}
