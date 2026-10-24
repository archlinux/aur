# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
pkgname=gen-commit-msg
pkgver=0.1.0
pkgrel=1
pkgdesc="Generate git commit message candidates from staged changes"
arch=('x86_64' 'aarch64')
url="https://github.com/chpock/gen-commit-msg"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=(
    'git: collect staged change context'
    'pi-coding-agent-bin>=1.4.0: generate commit messages with Pi'
    'opencode: generate commit messages with OpenCode'
)
provides=("$pkgname=$pkgver")
conflicts=('gen-commit-msg-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chpock/gen-commit-msg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e675aeb3001a72386973fe910055a35fd589a32729b4f4a69a63a48e72e2bb98')

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -ldflags "-linkmode=external -X main.version=$pkgver" -o gen-commit-msg ./cmd/gen-commit-msg
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "gen-commit-msg" "$pkgdir/usr/bin/gen-commit-msg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
