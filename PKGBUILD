# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributo: Aria Vesta <dev@ariavesta.com>

pkgname=kubelogin
pkgver=1.36.1
pkgrel=1
pkgdesc="Kubectl plugin for Kubernetes OpenID Connect authentication (oidc-login)"
arch=('x86_64' 'aarch64')
url="https://github.com/int128/kubelogin"
license=('Apache-2.0')
depends=(
    'glibc'
    'kubectl'
)
makedepends=(
    'git'
    'go'
)
source=("git+https://github.com/int128/kubelogin#tag=v${pkgver}")
sha256sums=('bd05e3dec2dcc6f29b13416b1c3fd89e1dfaa325687f34b81ffed1c2f25afe13')

prepare() {
    cd kubelogin

    go mod download -modcacherw
}

build() {
    cd kubelogin

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external \"-extldflags=${LDFLAGS}\"" \
        .
}

package() {
    cd kubelogin

    install -Dm755 kubelogin -t "${pkgdir}/usr/bin"
    ln -sf kubelogin "${pkgdir}/usr/bin/kubectl-oidc_login"
}
