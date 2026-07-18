# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ZenQy <zenqy.qin@gmail.com>

pkgname=athens
pkgver=0.18.1
pkgrel=1
_commit=6aefc35
pkgdesc="A proxy server for the Go Modules download API"
arch=(x86_64 aarch64)
url="https://github.com/gomods/athens"
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=("$pkgname::git+$url#commit=${_commit}?signed"
        "$pkgname.service")
b2sums=('648fd64b061920832c8357e69aa72723f7d919205e96e87a12a9846c6a2689533b6093696c99d79f6b7105fb2777d84656c80dbaa6ba348b2ebdc11e6370ea2f'
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

