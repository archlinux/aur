# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=kmcp
pkgver=0.2.7
pkgrel=1
pkgdesc='CLI tool and Kubernetes controller for building, testing and deploying MCP servers'
arch=('x86_64' 'aarch64')
url='https://github.com/kagent-dev/kmcp'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
provides=('kmcp')
conflicts=('kmcp-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2a09f9f138eca6e9eee663edfedfe94b0186ce77c345076593c9a969eee0e553')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags "-X github.com/kagent-dev/kmcp/pkg/internal/version.Version=v${pkgver}" -o kmcp ./cmd/kmcp
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 kmcp "${pkgdir}/usr/bin/kmcp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    "${pkgdir}/usr/bin/kmcp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kmcp"
    "${pkgdir}/usr/bin/kmcp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kmcp"
    "${pkgdir}/usr/bin/kmcp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/kmcp.fish"
}
