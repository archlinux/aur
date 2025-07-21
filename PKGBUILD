# Author: Kyle Manna <kyle at kylemanna dot com>

pkgname=do-agent
pkgver=3.18.0
pkgrel=1
pkgdesc='DigitalOcean Agent for Enhanced Droplet Graphs'
url='https://github.com/digitalocean/do-agent'
arch=('x86_64')
makedepends=('go')
depends=()

license=('Apache')

source=("https://github.com/digitalocean/${pkgname}/archive/${pkgver}.tar.gz"
        "do-agent.service")

sha512sums=('98502d939a8185c3d5419f80f1d6c3d5c2e8c5049dacffce016fc9a38c0cf869b5997d4e40ac692ff9eb5885c31ce4f29a254d5940017b29e952adc6df449bcc'
            '3758a5d63c12db885d54829f67ce62a00ce0155c0d292969fcbb7d9177666fc499d1d5c37c05424fd6684ee793d2c93ddd442948805b313f23af12b97bcd695b')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X \"main.version=${pkgver}\" -X \"main.buildDate=$(date -u)\"" -o build ./cmd/do-agent
}

package() {
    install -d $pkgdir/usr/{bin,lib/systemd/system}
    install -Dm755 "$srcdir/$pkgname-$pkgver/build/do-agent" "$pkgdir/usr/bin/do-agent"
    install -Dm644 "$srcdir/do-agent.service" "$pkgdir/usr/lib/systemd/system/do-agent.service"
}
