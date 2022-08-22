# Maintainer: Iván Gabaldón <contact|@|inetol.net>

pkgname=statping-ng
pkgver=0.90.80
pkgrel=1
pkgdesc='Web and app status monitoring for any type of project'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/statping-ng/statping-ng'
license=('GPL3')
makedepends=('glibc' 'go' 'go.rice' 'yarn')
optdepends=('dart-sass: Support custom styling')
conflicts=("$pkgname-bin" 'statping')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        'statping-daemon.service')
b2sums=('2cde66a0ff95bef33095c32e55e6e485cf582a8382d349a3ead31a833b5acf38deab1310e76bca3bc98cba3f75b9ab5b1aa6681fd32fcecdebe4bddee852a5aa'
        '0b9541191599b38bcf8edd4ba54e7a405c32ec335e8c5ce41ac29efe231c8ba3c0d7786e0bc74c98713de0f83ebfe217cd19c92cdb62d9b019852505b1f7c4ba')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make clean
    make frontend-build
    make embed

    if [ "$CARCH" == 'x86_64' ]; then
        CGO_ENABLED=1 GO111MODULE="on" GOOS=linux GOARCH=amd64 \
            go build -a -ldflags "-s -w -extldflags -static -X main.VERSION=$pkgver" -o ../statping --tags "netgo linux" ./cmd
    elif [ "$CARCH" == 'i686' ]; then
        CGO_ENABLED=1 GO111MODULE="on" GOOS=linux GOARCH=386 \
        	go build -a -ldflags "-s -w -extldflags -static -X main.VERSION=$pkgver" -o ../statping --tags "netgo linux" ./cmd
    elif [ "$CARCH" == 'aarch64' ]; then
        CGO_ENABLED=1 CC=aarch64-linux-gnu-gcc-6 CXX=aarch64-linux-gnu-g++-6 GO111MODULE="on" GOOS=linux GOARCH=arm64 \
    		go build -a -ldflags "-s -w -extldflags -static -X main.VERSION=$pkgver" -o ../statping --tags "netgo" ./cmd
    elif [ "$CARCH" == 'armv7h' ]; then
        CGO_ENABLED=1 CC=arm-linux-gnueabihf-gcc-6 CXX=arm-linux-gnueabihf-g++-6 GO111MODULE="on" GOOS=linux GOARCH=arm GOARM=7 \
    		go build -a -ldflags "-s -w -extldflags -static -X main.VERSION=$pkgver" -o ../statping --tags "netgo" ./cmd
    elif [ "$CARCH" == 'armv6h' ]; then
        CGO_ENABLED=1 CC=arm-linux-gnueabihf-gcc-6 CXX=arm-linux-gnueabihf-g++-6 GO111MODULE="on" GOOS=linux GOARCH=arm GOARM=6 \
        	go build -a -ldflags "-s -w -extldflags -static -X main.VERSION=$pkgver" -o ../statping --tags "netgo" ./cmd
    fi

    cp LICENSE ../LICENSE
}

package() {
    install -d "$pkgdir/etc/statping"

    install -Dm755 "$srcdir/statping" "$pkgdir/usr/bin/statping"
    install -Dm644 "$srcdir/statping-daemon.service" "$pkgdir/usr/lib/systemd/system/statping-daemon.service"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
