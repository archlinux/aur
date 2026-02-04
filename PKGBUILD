# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=tdl
pkgver=0.20.1
pkgrel=1
pkgdesc="Telegram Downloader, but more than a downloader"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://docs.iyear.me/tdl"
license=("AGPL-3.0-or-later")
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/iyear/tdl/archive/v$pkgver.tar.gz")
sha256sums=('dcb6c3d2b41c3712c75dc8f3d69cdc3b932ef9a288e7808df74617af5b487af5')

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
        -mod=readonly \
        -modcacherw \
        -ldflags="-linkmode=external
                  -X github.com/iyear/tdl/pkg/consts.Version=$pkgver
                  -X github.com/iyear/tdl/pkg/consts.Commit=$_commit
                  -X github.com/iyear/tdl/pkg/consts.CommitDate=$(date -u -d@"$SOURCE_DATE_EPOCH" +%FT%TZ)"

    ./tdl completion bash | install -Dm644 /dev/stdin share/bash-completion/completions/tdl
    ./tdl completion zsh | install -Dm644 /dev/stdin share/zsh/site-functions/_tdl
    ./tdl completion fish | install -Dm644 /dev/stdin share/fish/vendor_completions.d/tdl.fish
}

package() {
    cd $pkgname-$pkgver

    install -Dm755 $pkgname -t "$pkgdir/usr/bin"

    cp -r share/ "$pkgdir/usr"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    find docs/content/ -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/$pkgname/{}" \;
}
