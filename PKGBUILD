# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=rqlite
pkgver=8.23.0
pkgrel=1
pkgdesc="rqlite is a lightweight, distributed relational database, which uses SQLite as its storage engine"
arch=("x86_64" "armv7h" "aarch64")
url="http://rqlite.io/"
license=('custom:MIT')
makedepends=(go)
depends=(glibc)
source=("${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dada94e4161c48609567014e4ac48dc633437fd3a569ecf400e5c056b53dc3f9'
            'c0132b51d5c28517545fb58ce4aa67b6e860020d662aa8317ecb6aab0264829a'
            '43c1094a6fdd04c18df738fdc85250f0cbcb87b2f8f23320f42f4ca0656f43fc'
            'd9583bb257fa80c7924ba71dbdf3b1fa756e4fce3709983720a169f3f31736ce')

prepare() {
    cd "$pkgname-$pkgver"

    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -buildvcs=false -o build ./cmd/...
}

#check() {
#    cd "$pkgname-$pkgver"
#
#    go test ./...
#}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "build/rqlite" "${pkgdir}/usr/bin/rqlite"
    install -Dm755 "build/rqbench" "${pkgdir}/usr/bin/rqbench"
    install -Dm755 "build/rqlited" "${pkgdir}/usr/bin/rqlited"
    install -Dm644 "../${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "../${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "../${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

