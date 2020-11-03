# Maintainer: Boogy <0xboogy [at] gmail [dot] com>

_pkgname=terraform-lsp
pkgname=terraform-lsp-git
pkgver=v0.0.11.beta2.r19.ga503e90
pkgrel=1
pkgdesc="Language Server Protocol for Terraform"
arch=('x86_64' 'i686')
url="https://github.com/juliosueiras/terraform-lsp"
depends=('go')
provides=("terraform-lsp")
conflicts=("terraform-lsp")
license=('MIT')
source=("${_pkgname}::git+${url}#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
    cd "${_pkgname}"

    GO111MODULE=on go mod download
    make
    # make copy DST="${pkgdir}/usr/bin/${_pkgname}"
}

package() {
    cd "${_pkgname}"
    install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 README.md ${pkgdir}/usr/share/doc/${_pkgname}/README.md
    install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${_pkgname}/LICENSE
}

