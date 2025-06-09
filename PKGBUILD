# Maintainer: wyf9661 <wyf9661 at gmail.com>
# Contributor: zhufuyi <g.zhufuyi@gmail.com>

pkgname=sponge
pkgver=1.13.2
pkgrel=4
pkgdesc="A powerful and easy-to-use Go development framework that enables you to effortlessly build high-performance, highly available backend service systems through a 'low-code' approach."
arch=(any)
url="https://github.com/go-dev-frame/sponge"
license=(MIT)
depends=('glibc' 'go' 'protobuf' 'protoc-gen-go' 'protoc-gen-go-grpc' 'swag')
source=("$url/archive/v$pkgver/${pkgname}_${pkgver}_linux.zip")
sha1sums=('f5e105d003d22b4b089f7d48af33b8f4fd276e5e')

build() {
    mkdir -vp $pkgname-$pkgver/build
    cd "$pkgname-$pkgver"
    go build -ldflags "all=-s -w" ./cmd/sponge
    export GOBIN=$PWD/build
    make install
    cd cmd/protoc-gen-json-field
    export PATH=$PATH:$PWD && make
}

package() {
    install -dm755 "$pkgdir/usr/bin/"

    install -Dm755 $pkgname-$pkgver/$pkgname -t "$pkgdir/usr/bin/"
    install -Dm755 $pkgname-$pkgver/cmd/protoc-gen-json-field/protoc-gen-json-field -t "$pkgdir/usr/bin/"

    for file in "$srcdir/$pkgname-$pkgver/build"/protoc-gen-{validate,gotag,go-rpc-tmpl,go-gin,openapiv2,doc}; do
        if [ -f "$file" ]; then
            install -Dm755 "$file" -t "$pkgdir/usr/bin/"
        fi
    done

    install -Dm644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
