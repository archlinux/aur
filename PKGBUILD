# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ZenQy <zenqy.qin@gmail.com>

pkgname=athens
pkgver=0.19.2
pkgrel=1
_commit=eb8a957
pkgdesc="A proxy server for the Go Modules download API"
arch=(x86_64 aarch64)
url="https://github.com/gomods/athens"
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=("$pkgname::git+$url#commit=${_commit}?signed"
        "$pkgname.service")
b2sums=('eca0c89da31d6e6d9eb3439a6a8d8dbd299588a44a717457c0ea8de88e52976b01fdc6a31b6f526b0b0babf2d2f90c5203bfeb145f59b984b723efb3587238fc'
        '06e0bd59d00f8b2ff462a297a502b8fd78e4742c62c847b146d92eea4e777430256d6b458f33af862a00eeb55a489567adf87e53cd72998e23eb7e7c45abaf59')
validpgpkeys=(968479A1AFF927E37D1A566BB5690EEEBB952194)

prepare() {
    cd "$pkgname"
    export GOPATH="$srcdir"
    go mod download -modcacherw
    mkdir -p build
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname"
    go build -o build/athens ./cmd/proxy/
}

package() {
    cd "$pkgname"
    install -Dm755 build/athens -t "$pkgdir/usr/bin/"
    install -Dm644 config.dev.toml "$pkgdir/etc/$pkgname/config.toml"
    install -Dm644 "$srcdir/athens.service" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

