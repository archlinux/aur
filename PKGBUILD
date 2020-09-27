# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=velero
pkgver=1.5.1
pkgrel=1
pkgdesc="Backup and migrate Kubernetes applications and their persistent volumes"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://velero.io"
license=('Apache')
depends=('kubectl')
makedepends=('go')
optdepends=('restic: for restic integration support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmware-tanzu/velero/archive/v$pkgver.tar.gz")
sha256sums=('b5d8f50f8f84f08ec7fc72d2572fd15749b3b95f1a0ac2483f3a4fe6f43e4961')

build() {
    cd $pkgname-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    _commit=87d86a45a6ca66c6c942c7c7f08352e26809426c

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external
            -X \"github.com/vmware-tanzu/velero/pkg/buildinfo.Version=$pkgver\"
            -X \"github.com/vmware-tanzu/velero/pkg/buildinfo.GitSHA=$_commit\"
            -X \"github.com/vmware-tanzu/velero/pkg/buildinfo.GitTreeState=clean\"" \
        -o $pkgname cmd/velero/main.go
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    $pkgname completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    $pkgname completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
