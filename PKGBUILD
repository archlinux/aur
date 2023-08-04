# Maintainer: nltimv <git at nltimv dot com>
pkgname='weave-gitops-git'
pkgver=v0.29.0.r7.g6f053dfbe
pkgrel=1
pkgdesc='Weave GitOps is a simple open source developer platform for people who want cloud native applications, without needing Kubernetes expertise.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url='https://github.com/weaveworks/weave-gitops'
license=('MPL2')
depends=(
    'glibc'
)
makedepends=(
    'git'
    'go>=1.20.0'
)
optdepends=(
    'helm>=3: For installation in a Kubernetes cluster'
)
provides=('gitops' 'gitops-server')
conflicts=('gitops' 'gitops-server')
source=("git+https://github.com/weaveworks/weave-gitops#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/weave-gitops"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export GOPATH="$srcdir"/gopath

    cd "$srcdir/weave-gitops"
    echo $LDFLAGS
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -extldflags \"$LDFLAGS\"" -mod=readonly -modcacherw -o bin/gitops cmd/gitops/main.go
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -extldflags \"$LDFLAGS\"" -mod=readonly -modcacherw -o bin/gitops-server cmd/gitops-server/main.go
}

check() {
    cd "$srcdir/weave-gitops"
    make test
}

package() {
    cd "$srcdir/weave-gitops"
    install -Dm 755 bin/gitops $pkgdir/usr/bin/gitops
    install -Dm 755 bin/gitops-server $pkgdir/usr/bin/gitops-server

    go clean -modcache
}
