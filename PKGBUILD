# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ZenQy <zenqy.qin@gmail.com>

pkgname=athens
pkgver=0.17.1
pkgrel=2
_commit=5a7e150
pkgdesc="A proxy server for the Go Modules download API"
arch=(x86_64 aarch64)
url="https://github.com/gomods/athens"
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=("$pkgname::git+$url#commit=${_commit}?signed"
        "$pkgname.service")
b2sums=('2cf04dcfe32f05a4216da404d71f831130f1861f4c8c0cc87b2e716e643970670410e7af9db1312bf657c35da8ff85e9f2f1701ecda768669e6153358d4c9bb9'
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

