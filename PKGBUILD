# Author: Leonidas Spyropoulos <artafinde at archlinux.org>

pkgname=droplet-agent
pkgver=1.4.4
pkgrel=1
epoch=1
pkgdesc='DigitalOcean Droplet Agent for Enhanced Droplet Graphs'
url='https://github.com/digitalocean/droplet-agent'
arch=('x86_64')
makedepends=('go')
license=('Apache')
source=("https://github.com/digitalocean/${pkgname}/archive/${pkgver}.tar.gz"
        "droplet-agent.service")
sha512sums=('681fc3d1a395ac0f8abe21d18d3d8fa18874f5a48ae832e193a030f6403dd4481fbaed7cda54d1ecde9ef28e7a0253a0da08ce44c8e40bcba8251278691528db'
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
