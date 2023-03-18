# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=rqlite
pkgver=7.14.1
pkgrel=1
pkgdesc="rqlite is a lightweight, distributed relational database, which uses SQLite as its storage engine"
arch=("x86_64" "armv7h" "aarch64")
url="http://www.rqlite.com/"
license=('custom:MIT')
makedepends=(go)
depends=(glibc)
source=("${pkgname}.service"
        "${pkgname}@.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dada94e4161c48609567014e4ac48dc633437fd3a569ecf400e5c056b53dc3f9'
            '8c25f88104d9a1f2598a63f3e5ee7591d2579bf58aa4bbca38e3d69f5abf44db'
            'c0132b51d5c28517545fb58ce4aa67b6e860020d662aa8317ecb6aab0264829a'
            '43c1094a6fdd04c18df738fdc85250f0cbcb87b2f8f23320f42f4ca0656f43fc'
            '800f2b20f6ad3f536ddc448e212df08e9629919aec9624afd48b2b97552447f6')

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
    install -Dm644 "../${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
    install -Dm644 "../${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "../${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

