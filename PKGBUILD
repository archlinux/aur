# Maintainer: Ilyas Turki <ilyasturki at gmail dot com>
pkgname=ordo
pkgver=0.14.0
pkgrel=1
pkgdesc="Terminal-first, single-user project planning tool"
arch=('x86_64' 'aarch64')
url="https://github.com/ilyasturki/ordo"
license=('MIT')
makedepends=('go')
provides=('ordo')
conflicts=('ordo-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f41bf04c88ad66f07ca7115bd298b6185197f26c5d953578dcb07fb4bb1140e5')

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
        -ldflags "-s -w -linkmode=external -X github.com/ilyasturki/ordo/internal/version.Version=v${pkgver}" \
        -o build/ordo \
        ./cmd/ordo
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 build/ordo "${pkgdir}/usr/bin/ordo"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${pkgdir}/usr/bin/ordo" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/ordo"
    "${pkgdir}/usr/bin/ordo" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_ordo"
    "${pkgdir}/usr/bin/ordo" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/ordo.fish"
}
