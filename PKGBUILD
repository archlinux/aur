# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: janosmiko <janosmiko@users.noreply.github.com>

pkgname=lfk
pkgver=0.18.12
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
sha256sums=('3180c660d0563e0c87d4fa03e8a7134cd4eea47dca1c3c51433fe8077e2ddec7')

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
    go test ./... -skip "TestNoBareKubectlLookPath|TestNoUnguardedExternalBinaryLookup|TestKubectlExecArgsGoThroughDemoHelper|TestEmojiIconWidthsAgreeOnceTheSelectorIsDropped"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 lfk -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

