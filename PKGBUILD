# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=schemahero
pkgver=0.25.1
pkgrel=1
pkgdesc='Declarative database schema management as code (CNCF)'
arch=('x86_64' 'aarch64')
url='https://github.com/schemahero/schemahero'
license=('Apache-2.0')
makedepends=('go')
provides=('schemahero')
conflicts=('schemahero-bin')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('49e1a64865f236196de433ec639e3a19e3a2e78c9e5af5748ef916eff221890c')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    go build -buildmode=pie -trimpath -mod=readonly \
        -ldflags="-w -s -X github.com/schemahero/schemahero/pkg/version.version=v${pkgver}" \
        -o schemahero ./cmd/kubectl-schemahero
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 schemahero -t "${pkgdir}/usr/bin/"
    ln -s schemahero "${pkgdir}/usr/bin/kubectl-schemahero"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

    for shell in bash zsh fish; do
        ./schemahero completion "$shell" > "schemahero.$shell"
    done
    install -Dm644 schemahero.bash "${pkgdir}/usr/share/bash-completion/completions/schemahero"
    install -Dm644 schemahero.zsh "${pkgdir}/usr/share/zsh/site-functions/_schemahero"
    install -Dm644 schemahero.fish "${pkgdir}/usr/share/fish/vendor_completions.d/schemahero.fish"
}
