# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Christoph W <c w e g e n e r at gmail dot com>

pkgname=usql
pkgver=0.7.8
pkgrel=1
pkgdesc='A universal command-line interface for SQL databases'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xo/usql"
license=('MIT')
depends=('icu')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d8d07324afe2478068f99b79e35ad5f5c06fa0e0051504cff5bce592ee75c6c2')

build() {
    cd "$pkgname-$pkgver"

    TAGS="most sqlite_app_armor sqlite_fts5 sqlite_introspect sqlite_json1
          sqlite_stat4 sqlite_userauth sqlite_vtable sqlite_icu no_adodb"

    go build \
        -tags="$TAGS" \
        -gcflags="all=-trimpath=$PWD" \
	    -asmflags="all=-trimpath=$PWD" \
        -ldflags="-extldflags $LDFLAGS
                  -s -w -X github.com/xo/usql/text.CommandName=$pkgname
                  -X github.com/xo/usql/text.CommandVersion=$pkgver" \
        -o $pkgname .
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
