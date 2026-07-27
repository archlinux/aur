# Maintainer: 37signals <support@37signals.com>
pkgname=fizzy-cli
pkgver=4.0.0
pkgrel=1
pkgdesc="CLI for managing Fizzy boards, cards, and tasks"
arch=('x86_64' 'aarch64')
url="https://github.com/basecamp/fizzy-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('fizzy')
conflicts=('fizzy' 'fizzy-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/basecamp/fizzy-cli/archive/v$pkgver.tar.gz")
sha256sums=('0c78d84cd99096dfcd5f7987766c98fbe0489f7872ebb8bfce52a80e3594c27a')
options=('!debug')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=${pkgver}" -o fizzy ./cmd/fizzy

    # Generate completions
    ./fizzy completion bash > fizzy.bash
    ./fizzy completion zsh > fizzy.zsh
    ./fizzy completion fish > fizzy.fish
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 fizzy "$pkgdir/usr/bin/fizzy"
    install -Dm644 MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
    install -Dm644 fizzy.bash "$pkgdir/usr/share/bash-completion/completions/fizzy"
    install -Dm644 fizzy.zsh "$pkgdir/usr/share/zsh/site-functions/_fizzy"
    install -Dm644 fizzy.fish "$pkgdir/usr/share/fish/vendor_completions.d/fizzy.fish"
}
