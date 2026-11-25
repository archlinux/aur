pkgname=zendrite
pkgver=3.10.1
pkgrel=1
pkgdesc="An opinionated fork of element-hq/dendrite"
arch=(x86_64)
url=https://zendrite.pat-s.me/
license=("AGPL-3.0-or-later OR LicenseRef-Element-Commercial-License")
depends=(glibc sqlite)
makedepends=(git go)
optdepends=("postgresql>=12: Recommended database"
            "nats-server: Use external nats server"
            "libwebp: Faster WebP thumbnail decoding")
install="$pkgname.install"
source=("git+https://codefloe.com/pat-s/zendrite.git#tag=v$pkgver"
        "$pkgname.service")
sha256sums=('d854821a44fa00a447dae8f1b282d304f8889bade2ec31d0874d10eebbb1bedf'
            '8eb2c645705cd432b6d16cda65f31f06fa97f513b9d3d90e4c6e5a87bfb39513')

prepare() {
    cd "$pkgname"
    export GOPATH="$srcdir"
    go mod download -modcacherw
}
build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
    export GOPATH="$srcdir"
    go build -ldflags "-compressdwarf=false -linkmode external -bindnow -X codefloe.com/pat-s/zendrite/internal.version=$pkgver" \
             -tags libsqlite3 -o bin/ ./cmd/...
}
check() {
    cd "$pkgname"
    # Skip tests require pgsql
    export ZENDRITE_TEST_SKIP_NODB=1
    go test -tags goolm ./...
}
package() {
    cd "$pkgname"
    find bin -mindepth 1 -maxdepth 1 -type f -executable \
        -exec install -Dvm755 -t "$pkgdir/usr/bin/" {} +
    for f in "$pkgdir/usr/bin/"*
    do
        basename="$(basename "$f")"
        if [[ "$basename" != "$pkgname"* ]]
        then
            mv -v "$f" "$pkgdir/usr/bin/$pkgname-$basename"
        fi
    done
    install -Dvm644 LICENSE-COMMERCIAL "$pkgdir/usr/share/licenses/$pkgname/LICENSE-COMMERCIAL"
    install -Dvm644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dvm644 -t "$pkgdir/usr/share/doc/$pkgname/" "$pkgname-sample.yaml"
}
