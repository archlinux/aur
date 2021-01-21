# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dstask
pkgver=0.24
pkgrel=1
pkgdesc="Single binary terminal-based TODO manager with git-based sync + markdown notes per task"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/naggie/dstask"
license=('MIT')
depends=('git')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('80a08bd8cfb313eac9af9108f6d4a60ac5204f8f41cdbbd054e1765248d3fee1')

build() {
    _commit=$(zcat $pkgname-$pkgver.tar.gz | git get-tar-commit-id)

    cd $pkgname-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=vendor \
        -modcacherw \
        -ldflags "-linkmode=external
            -X \"github.com/naggie/dstask.GIT_COMMIT=$_commit\"
            -X \"github.com/naggie/dstask.VERSION=$pkgver\"
            -X \"github.com/naggie/dstask.BUILD_DATE=$(date -d@"$SOURCE_DATE_EPOCH" +%FT%TZ)\"" \
        -o dstask \
        cmd/dstask/main.go

}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 .dstask-bash-completions.sh "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 .dstask-zsh-completions.sh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
