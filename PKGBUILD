# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=store
pkgver=2.2.0
pkgrel=1
pkgdesc='Dotfile symlink manager — one repo, one config, one command per machine'
arch=('x86_64' 'aarch64')
url='https://github.com/cushycush/store'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=('store-bin' 'store-git')
provides=('store')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=v${pkgver}" -o store ./cmd/store
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 store "${pkgdir}/usr/bin/store"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Shell completions
    ./store completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/store"
    ./store completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_store"
    ./store completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/store.fish"
}
