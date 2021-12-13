# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=gotify-cli
pkgver=2.2.1
pkgrel=1
pkgdesc="A command line interface for pushing messages to gotify/server"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/gotify/cli'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9013f4afdcc717932e71ab217e09daf4c48e153b23454f5e732ad0f74a8c8979')

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
