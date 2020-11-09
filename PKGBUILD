# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dstask
pkgver=0.23.1
pkgrel=1
pkgdesc="Single binary terminal-based TODO manager with git-based sync + markdown notes per task"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/naggie/dstask"
license=('MIT')
depends=('git')
makedepends=('go')
install=dstask.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('48f485c591dfaf0fd85902f826c0a6a74057aea702e7fd30a59f53e905cbfb67')

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
        cmd/dstask.go
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 .dstask-bash-completions.sh "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 .dstask-zsh-completions.sh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
