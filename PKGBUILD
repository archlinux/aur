# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=gotify-cli
pkgver=2.2.0
pkgrel=2
pkgdesc="A command line interface for pushing messages to gotify/server"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/gotify/cli'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d4e6fbc087c6cc4b320b3fcae4c28d65d514b7e55c95e4c0e764abb3a6c94064')

build() {
    _commit=$(zcat $pkgname-$pkgver.tar.gz | git get-tar-commit-id)

    cd cli-$pkgver
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external
            -X \"main.Version=$pkgver\"
            -X \"main.BuildDate=$(date -u -d@"$SOURCE_DATE_EPOCH" +%FT%TZ)\"
            -X \"main.Commit=$_commit\"" \
        -o gotify
}

check() {
    cd cli-$pkgver
    go test -v ./...
}

package() {
    cd cli-$pkgver
    install -Dm755 gotify -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
