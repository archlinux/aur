# Maintainer: ml <ml-aur@ransomware.download>
pkgname=vacuum
pkgver=0.23.7
pkgrel=1
pkgdesc='fast, lightweight OpenAPI linter and quality checking tool'
arch=('aarch64' 'i686' 'x86_64')
url=https://quobix.com/vacuum/
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=(
    "git+https://github.com/daveshanley/vacuum.git#tag=v${pkgver}"
)
sha256sums=('9fdb711e87079bf4a1192d326dc10fcca9274182dbe3baec5c0131b3b6e26de6')

build() {
    cd "$pkgname"
    export CGO_ENABLED=1
    export CGO_LDFLAGS=$LDFLAGS
    export CGO_CFLAGS=$CFLAGS
    export CGO_CPPFLAGS=$CPPFLAGS
    export CGO_CXXFLAGS=$CXXFLAGS
    export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
    go build -ldflags "-linkmode=external"

    ./"$pkgname" completion bash >completion.bash
    ./"$pkgname" completion fish >completion.fish
    ./"$pkgname" completion zsh >completion.zsh
}

check() {
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"
    install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin
    install -Dm644 completion.bash "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
    install -Dm644 completion.fish "$pkgdir"/usr/share/fish/vendor_completions.d/"$pkgname".fish
    install -Dm644 completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
