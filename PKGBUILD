# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=kconnect
pkgver=0.5.21
_saml2awsver="35a4d415a9823c2811c108b9106cae77e006414f"
pkgrel=1
pkgdesc='CLI utility that can be used to discover and securely access Kubernetes clusters across multiple operating environments.'
arch=('x86_64' 'aarch64')
url="https://github.com/fidelity/kconnect"
license=('Apache-2.0')
depends=('kubectl')
makedepends=('go')
optdepends=('aws-iam-authenticator: authentication to AWS EKS clusters'
            'azure-kubelogin: non-interactive authentication to Azure AKS clusters'
            'azure-cli: interactive authentication to Azure AKS clusters')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
source=(
    "${pkgname}_${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('860ef5248759e6434ab3fd847ae46f1dc69ba10437284cc651e1d95c484b028a')

export GGO_ENABLED="0"
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-trimpath -mod=readonly -modcacherw"

build() {
    local _commit _flags
    _commit=$(bsdcat "${pkgname}_${pkgver}.tar.gz" | git get-tar-commit-id)
    _flags=(
        -X=github.com/fidelity/kconnect/internal/version.version="${pkgver}"
        -X=github.com/fidelity/kconnect/internal/version.commitHash="${_commit}"
        -X=github.com/fidelity/kconnect/internal/version.buildDate="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
    )
    cd "${pkgname}-${pkgver}"
    go build -o "${pkgname}" -ldflags="-s -w ${_flags[*]}" "./cmd/${pkgname}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
