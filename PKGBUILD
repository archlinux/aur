# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
pkgname=gen-commit-msg
pkgver=0.0.3
pkgrel=1
pkgdesc="Generate git commit message candidates from staged changes"
arch=('x86_64' 'aarch64')
url="https://github.com/chpock/gen-commit-msg"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('git: collect staged change context' 'opencode: generate commit messages')
provides=("$pkgname=$pkgver")
conflicts=('gen-commit-msg-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chpock/gen-commit-msg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6ac4e9eca4b4e4e44d7212bda489bc82e3b770401da6ef94a689634020b310fe')

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
