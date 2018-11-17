# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Maxim Baz <$pkgbuild at maximbaz dot com>

_pkgauthor=GoogleContainerTools
_commit=34651689be78b2c6bcfbace5072b00b93661f895
pkgname=skaffold
pkgver=0.18.0
pkgrel=3
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/${_pkgauthor}/${pkgname}"
license=("Apache")
depends=("docker" "kubectl-bin")
makedepends=("go-pie")
optdepends=("google-cloud-sdk: To use GKE"
            "minikube: To use Minikube")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgauthor}/${pkgname}/archive/v${pkgver}.tar.gz"
        "build_flags.patch")
sha256sums=("3ec621485d2ebeac3366346271527326c3c97115784597bff457ccce162be008"
            "3e32d942fa54099a5f14dd65ef3c08e5a89a82cd90f1cd05a43715e4ba597d06")

prepare() {
    mkdir -p "${srcdir}/gopath/src/github.com/${_pkgauthor}"
    ln -rTsf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/gopath/src/github.com/${_pkgauthor}/${pkgname}"

    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/build_flags.patch"
}

build() {
    export GOPATH="${srcdir}/gopath"
    cd "${srcdir}/gopath/src/github.com/${_pkgauthor}/${pkgname}"
    VERSION="v${pkgver}" COMMIT="${_commit}" TREE_STATE="clean" make install
}

package() {
    install -Dm755 "${srcdir}/gopath/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
