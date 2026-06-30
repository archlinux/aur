# Maintainer: Ilyas Turki <ilyasturki at gmail dot com>
pkgname=phasionary
pkgver=0.7.2
pkgrel=1
pkgdesc="Terminal-first, single-user project planning tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ilyasturki/phasionary"
license=('MIT')
makedepends=('go')
provides=('phasionary')
conflicts=('phasionary-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1299632c728cdd1dc7cbaccae218d9e322eb25b7c9517c4bb6a7bbc1c27ff19b')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
    export GOPATH="${srcdir}/gopath"
    go mod download
}

build() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-s -w -linkmode=external -X phasionary/internal/version.Version=v${pkgver}" \
        -o build/phasionary \
        ./cmd/phasionary
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 build/phasionary "${pkgdir}/usr/bin/phasionary"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${pkgdir}/usr/bin/phasionary" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/phasionary"
    "${pkgdir}/usr/bin/phasionary" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_phasionary"
    "${pkgdir}/usr/bin/phasionary" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/phasionary.fish"
}
