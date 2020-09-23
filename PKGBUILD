# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dstask
pkgver=0.21
pkgrel=1
pkgdesc="Single binary terminal-based TODO manager with git-based sync + markdown notes per task"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/naggie/dstask"
license=('MIT')
depends=('git')
makedepends=('go')
install=dstask.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('43c5828ad19221cbdf0ac6c43b2fd9a777d00fbd9d45b96353f18c969cf7987b')

prepare() {
    cd $pkgname-$pkgver
    sed -i 's/#compdef pass/#compdef dstask/g' .dstask-zsh-completions.sh
}

build() {
    cd $pkgname-$pkgver

    _commit=2f83a1a281e67e7c7c76a0655602d8d41d453123

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
            -X \"github.com/naggie/dstask.BUILD_DATE=$(date -d@"$SOURCE_DATE_EPOCH" +%Y-%m-%dT%H:%M:%SZ)\""\
        cmd/dstask.go
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 .dstask-bash-completions.sh "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 .dstask-zsh-completions.sh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
