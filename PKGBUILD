# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: janosmiko <janosmiko@users.noreply.github.com>

pkgname=lfk
pkgver=0.18.5
pkgrel=1
pkgdesc='Lightning Fast Kubernetes navigator - keyboard-focused TUI for managing K8s clusters'
url='https://github.com/janosmiko/lfk'
arch=(aarch64 x86_64)
license=(Apache-2.0)
depends=(glibc kubectl)
makedepends=(go)
optdepends=(
    'helm: Helm release management'
    'trivy: Container image vulnerability scanning')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7b7d8893ba0a061b34eb8b05b80d29be6adb64589be04824b80ec9b17b6d56f5')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"    
    cd "$pkgname-$pkgver"
    go build -o lfk .
}

# TODO: figure out why tests can't find kubectl or root-level go.mod
check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 lfk -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

