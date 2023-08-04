# Maintainer: nltimv <git at nltimv dot com>
pkgname='weave-gitops'
pkgver=0.29.0
pkgrel=1
pkgdesc='Weave GitOps is a simple open source developer platform for people who want cloud native applications, without needing Kubernetes expertise.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url='https://github.com/weaveworks/weave-gitops'
license=('MPL2')
depends=(
    'glibc'
)
makedepends=(
    'go>=1.20.0'
)
optdepends=(
    'helm>=3: For installation in a Kubernetes cluster'
)
provides=('gitops' 'gitops-server')
conflicts=('gitops' 'gitops-server')
source=("$pkgname-$pkgver.tar.gz::https://github.com/weaveworks/weave-gitops/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7fddd95b1de3b57dae6f03049850174da39b213326d962e627335ed185afddac')

build() {
    export GOPATH="$srcdir"/gopath

    cd "$srcdir/$pkgname-$pkgver"
    echo $LDFLAGS
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -extldflags \"$LDFLAGS\"" -mod=readonly -modcacherw -o bin/gitops cmd/gitops/main.go
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -extldflags \"$LDFLAGS\"" -mod=readonly -modcacherw -o bin/gitops-server cmd/gitops-server/main.go
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make test
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 bin/gitops $pkgdir/usr/bin/gitops
    install -Dm 755 bin/gitops-server $pkgdir/usr/bin/gitops-server

    go clean -modcache
}