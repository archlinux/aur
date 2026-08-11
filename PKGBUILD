# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=usql
pkgver=0.21.4
pkgrel=2
pkgdesc='A universal command-line interface for SQL databases'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xo/usql"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6dfe613eff669606ba52f8c4a046d70677c47b2af61e87dc471ae2c44e50cca7')

build() {
    cd $pkgname-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    TAGS="most sqlite_app_armor sqlite_fts5 sqlite_introspect sqlite_json1 sqlite_math_functions sqlite_stat4 sqlite_vtable no_adodb"

    go build \
        -tags="$TAGS" \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags="-linkmode=external
                  -X github.com/xo/usql/text.CommandName=$pkgname
                  -X github.com/xo/usql/text.CommandVersion=$pkgver" \
        -o $pkgname
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

    # Generate and install shell completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

    "${pkgdir}/usr/bin/usql" --completion-script-bash > "${pkgdir}/usr/share/bash-completion/completions/usql"
    "${pkgdir}/usr/bin/usql" --completion-script-zsh > "${pkgdir}/usr/share/zsh/site-functions/_usql"
    "${pkgdir}/usr/bin/usql" --completion-script-fish > "${pkgdir}/usr/share/fish/vendor_completions.d/usql.fish"
}
