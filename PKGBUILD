# Maintainer: ml <ml-aur@ransomware.download>
pkgname=vacuum
pkgver=0.35.0
pkgrel=1
pkgdesc='fast, lightweight OpenAPI linter and quality checking tool'
arch=('aarch64' 'i686' 'x86_64')
url=https://quobix.com/vacuum/
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'npm')
source=(
    "git+https://github.com/daveshanley/vacuum.git#tag=v${pkgver}"
)
sha256sums=('0b94cf571231f8c3ffb3fa208742f8503c71760e806f0895018eeb2b9d04dbc7')

build() {
    cd "$pkgname"
    export CGO_ENABLED=1
    export CGO_LDFLAGS=$LDFLAGS
    export CGO_CFLAGS=$CFLAGS
    export CGO_CPPFLAGS=$CPPFLAGS
    export CGO_CXXFLAGS=$CXXFLAGS
    #export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    make build

    ./bin/"$pkgname" completion bash >completion.bash
    ./bin/"$pkgname" completion fish >completion.fish
    ./bin/"$pkgname" completion zsh >completion.zsh
}

check() {
    cd "$pkgname"
    go test -tags html_report_ui ./...
}

package() {
    cd "$pkgname"
    install -Dm755 bin/"$pkgname" -t "$pkgdir"/usr/bin
    install -Dm644 completion.bash "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
    install -Dm644 completion.fish "$pkgdir"/usr/share/fish/vendor_completions.d/"$pkgname".fish
    install -Dm644 completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
