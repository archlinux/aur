# Maintainer: Ivan Gabaldon <maintainer[at]inetol.net>

pkgname=statping-ng
pkgver=0.90.80
pkgrel=2
pkgdesc='Web and app status monitoring for any type of project'
arch=('aarch64' 'x86_64' 'i686' 'armv7h')
url='https://github.com/statping-ng/statping-ng'
license=('GPL3')
makedepends=('glibc' 'go' 'go.rice' 'yarn')
optdepends=('dart-sass: Support custom styling')
conflicts=("$pkgname-bin" 'statping')
install="$pkgname.install"
noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/$pkgname/$pkgname/tarball/v$pkgver"
        'statpingd.service')
b2sums=('016fd0e3578fd0cd682777b5be1f42beac7ecb9956358cd74cc356e385714bfba986e29545bbf53f711136d8f1889fb0937b36971407f3c24a1b814f7229d7de'
        '01f7b17e50132f47d11ccc78ade993157235062ee2eaae3874406085f2468959bb2f632d3619c3336d44014d6dae63e2202ccaa8c72d1714aa2f44eac8a96c64')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver"
}

build() {
    # envelope routines::initialization error -> https://github.com/webpack/webpack/issues/14532
    export NODE_OPTIONS=--openssl-legacy-provider

    cd "$srcdir/$pkgname-$pkgver"

    make clean
    make frontend-build
    make embed

    case "$CARCH" in
        'aarch64')
            CGO_ENABLED=1 CC=aarch64-linux-gnu-gcc-6 CXX=aarch64-linux-gnu-g++-6 GO111MODULE="on" GOOS=linux GOARCH=arm64 \
            go build -a -ldflags "-s -w -extldflags -static -X main.VERSION=$pkgver" -o ../statping --tags "netgo" ./cmd
            ;;
        'x86_64')
            CGO_ENABLED=1 GO111MODULE="on" GOOS=linux GOARCH=amd64 \
            go build -a -ldflags "-s -w -extldflags -static -X main.VERSION=$pkgver" -o ../statping --tags "netgo linux" ./cmd
            ;;
        'i686')
            CGO_ENABLED=1 GO111MODULE="on" GOOS=linux GOARCH=386 \
            go build -a -ldflags "-s -w -extldflags -static -X main.VERSION=$pkgver" -o ../statping --tags "netgo linux" ./cmd
            ;;
        'armv7h')
            CGO_ENABLED=1 CC=arm-linux-gnueabihf-gcc-6 CXX=arm-linux-gnueabihf-g++-6 GO111MODULE="on" GOOS=linux GOARCH=arm GOARM=7 \
    		go build -a -ldflags "-s -w -extldflags -static -X main.VERSION=$pkgver" -o ../statping --tags "netgo" ./cmd
            ;;
    esac
}

package() {
    install -d -o root -g http "$pkgdir/etc/statping"

    install -Dm755 "$srcdir/statping" "$pkgdir/usr/bin/statping"
    install -Dm644 "$srcdir/statpingd.service" "$pkgdir/usr/lib/systemd/system/statpingd.service"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
