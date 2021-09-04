# Author: Kyle Manna <kyle at kylemanna dot com>

pkgname=do-agent
pkgver=3.10.0
pkgrel=1
pkgdesc='DigitalOcean Agent for Enhanced Droplet Graphs'
url='https://github.com/digitalocean/do-agent'
arch=('x86_64')
makedepends=('go')
depends=()

license=('Apache')

source=("https://github.com/digitalocean/${pkgname}/archive/${pkgver}.tar.gz"
        "do-agent.service")

sha512sums=('27e29294e2cad2a09454e6474a040dd0eec2ab80bec98c5d9e2ff782b48abe3a1ff4993a634e238bbb4418eec0e146216db641a8049886c557fdb66484e86cc9'
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
