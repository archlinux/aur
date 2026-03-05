# Maintainer: 37signals <support@37signals.com>
pkgname=hey-cli
pkgver=0.0.1
pkgrel=1
pkgdesc="CLI for HEY email"
arch=('x86_64' 'aarch64')
url="https://github.com/basecamp/hey-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('hey')
conflicts=('hey' 'hey-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/basecamp/hey-cli/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
options=('!debug')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X github.com/basecamp/hey-cli/internal/version.Version=${pkgver}" -o hey ./cmd/hey

    # Generate completions
    ./hey completion bash > hey.bash
    ./hey completion zsh > hey.zsh
    ./hey completion fish > hey.fish
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 hey "$pkgdir/usr/bin/hey"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 hey.bash "$pkgdir/usr/share/bash-completion/completions/hey"
    install -Dm644 hey.zsh "$pkgdir/usr/share/zsh/site-functions/_hey"
    install -Dm644 hey.fish "$pkgdir/usr/share/fish/vendor_completions.d/hey.fish"
}
