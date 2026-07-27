# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: janosmiko <janosmiko@users.noreply.github.com>

pkgname=lfk
pkgver=0.15.15
pkgrel=1
pkgdesc='Lightning Fast Kubernetes navigator - keyboard-focused TUI for managing K8s clusters'
url='https://github.com/janosmiko/lfk'
arch=(aarch64 x86_64)
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
optdepends=(
    'kubectl: Kubernetes CLI integration'
    'helm: Helm release management'
    'trivy: Container image vulnerability scanning')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e6815cbe8f91755e613db25471e9a3e2db33d10a0cf5acb5ac83ba6b684c7035')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    mkdir -p build
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"    
    cd "$pkgname-$pkgver"
    go build -o build
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/lfk -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

