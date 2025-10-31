# Maintainer: dino9193 <see my AUR profile>

pkgname=lichess-cli
pkgver=1.0.2
pkgrel=1
pkgdesc='A command-line client for Lichess.'
arch=('x86_64')
url='https://github.com/mattcanty/lichess-cli'
license=('MIT')
depends=('glibc')
makedepends=('go')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('03cee9fa5be85aa50933cebb196f58caaccb5083ccaf4131eb6311f4bd62a0b9')

build() {
    cd "$pkgname-$pkgver"
    echo "Run go mod tidy..."
    go mod tidy

    echo "Run go test..."
    go test -v -race ./...

    echo "Run go build..."
    go build -o $pkgname -ldflags="-s -w -X main.version=$pkgver" -trimpath
}

package() {
    cd "$pkgname-$pkgver"

    install -d "$pkgdir/usr/bin"
    install -m755 "$pkgname" "$pkgdir/usr/bin/"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cat > config.json.example << EOF
{
  "lichess_api_key": "YOUR_API_KEY_HERE"
}
EOF

    install -m644 config.json.example "$pkgdir/usr/share/doc/$pkgname/config.json.example"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}