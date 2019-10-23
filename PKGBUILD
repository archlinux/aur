# Maintainer: Lukas Zimmermann <luk.zim91@gmail.com>
# Maintainer: Jonathan Herlin <jonher937+aur@gmail.com>

pkgname=terraform-provider-openstack
pkgver=1.24.0
pkgrel=1
pkgdesc="Terraform OpenStack provider"
url="https://github.com/terraform-providers/terraform-provider-openstack"
arch=("i686" "x86_64")
license=("MPL2")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
depends=('terraform')
source=("https://github.com/terraform-providers/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c774a7e5ecb52e0d707e6bf3ec198a38837e7cd21f0e6af68241d8e7eced73af')

prepare() {
    local _pkgdir="${_gourl}/${pkgname}"
    mkdir -p "${srcdir}/src/${_gourl}"
    rm -rf "${srcdir}/src/${_pkgdir}"
    mv -f "${pkgname}-${pkgver}" "${srcdir}/src/${_pkgdir}"
    msg2 "Fetching dependencies"
    cd "$srcdir/src/${_pkgdir}"
    GOPATH="${srcdir}" go get -u github.com/hashicorp/terraform
}

build() {
    msg2 "Build program"
    cd "${srcdir}/src/${_gourl}/${pkgname}"
    GOPATH="${srcdir}" PATH="${srcdir}/bin:${PATH}" make
}

package() {
    cd "${srcdir}/bin"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

