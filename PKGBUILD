# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=store-git
pkgver=r0
pkgrel=1
pkgdesc='Dotfile symlink manager — one repo, one config, one command per machine (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/cushycush/store'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
conflicts=('store' 'store-bin')
provides=('store')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=${pkgver}" -o store ./cmd/store
}

package() {
    cd "${pkgname}"
    install -Dm755 store "${pkgdir}/usr/bin/store"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Shell completions
    ./store completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/store"
    ./store completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_store"
    ./store completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/store.fish"
}
