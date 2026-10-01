# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=notation
pkgver=1.3.2
pkgrel=2
pkgdesc='CLI tool to sign and verify OCI artifacts (CNCF Notary Project)'
arch=('x86_64' 'aarch64')
url='https://github.com/notaryproject/notation'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
conflicts=('notation-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f7239ca8155329b57f80e5fb01bf189441b3ade572ad9d6fc4582c1475b8e840')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags="-X github.com/notaryproject/notation/internal/version.Version=${pkgver}" -o notation ./cmd/notation
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 notation -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    for shell in bash zsh fish; do
        ./notation completion "$shell" > "notation.$shell"
    done
    install -Dm644 notation.bash "${pkgdir}/usr/share/bash-completion/completions/notation"
    install -Dm644 notation.zsh "${pkgdir}/usr/share/zsh/site-functions/_notation"
    install -Dm644 notation.fish "${pkgdir}/usr/share/fish/vendor_completions.d/notation.fish"
}
