# Author: Leonidas Spyropoulos <artafinde at archlinux.org>

pkgname=droplet-agent
pkgver=1.2.8
pkgrel=1
pkgdesc='DigitalOcean Droplet Agent for Enhanced Droplet Graphs'
url='https://github.com/digitalocean/droplet-agent'
arch=('x86_64')
makedepends=('go')
license=('Apache')
source=("https://github.com/digitalocean/${pkgname}/archive/${pkgver}.tar.gz"
        "droplet-agent.service")
sha512sums=('c466719f8088964cc4b7d81d90f1b56cd5450bcb81da22822ec629bae7a3cea5b7ea24c46da1ba4f935a69d95fafcba8505171eebf2b5903d0ef58b2e7719be3'
            '57504535c4387644ba941ce512b8a86aec9ca990b4fae48f43bda1e2abb62b55f68bbc692df32c82b07e0f6a3cd4cbb39f298ba86fab54e00f301b54115cd7b3')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"
    go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        -o build/droplet-agent \
        github.com/digitalocean/droplet-agent/cmd/agent
}

package() {
    install -d $pkgdir/usr/{bin,lib/systemd/system}
    install -Dm755 "$srcdir/$pkgname-$pkgver/build/droplet-agent" "$pkgdir/usr/bin/droplet-agent"
    install -Dm644 "$srcdir/droplet-agent.service" "$pkgdir/usr/lib/systemd/system/droplet-agent.service"
}
