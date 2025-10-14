# Maintainer: ml <ml-aur@ransomware.download>
pkgname=vacuum
pkgver=0.18.5
pkgrel=2
pkgdesc='fast, lightweight OpenAPI linter and quality checking tool'
arch=('aarch64' 'i686' 'x86_64')
url=https://quobix.com/vacuum/
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
# "https://github.com/daveshanley/vacuum/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz"
source=(
    "git+https://github.com/daveshanley/vacuum.git#tag=v${pkgver}"
)
sha256sums=('b6229ec27dafdbac748e6567f42aee3303b5f0bbfe5b38b1f8bccba11ded8982')

build() {
    #_commit=$(bsdcat "$pkgname"-"$pkgver".tar.gz | git get-tar-commit-id)
    cd "$pkgname"
    export CGO_ENABLED=1
    export CGO_LDFLAGS=$LDFLAGS
    export CGO_CFLAGS=$CFLAGS
    export CGO_CPPFLAGS=$CPPFLAGS
    export CGO_CXXFLAGS=$CXXFLAGS
    export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
    #TZ=UTC printf -v _date '%(%FT%TZ)T' "$SOURCE_DATE_EPOCH"
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
