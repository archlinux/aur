# Author: Leonidas Spyropoulos <artafinde at archlinux.org>

pkgname=droplet-agent
pkgver=1.1.1
pkgrel=1
pkgdesc='DigitalOcean Droplet Agent for Enhanced Droplet Graphs'
url='https://github.com/digitalocean/droplet-agent'
arch=('x86_64')
makedepends=('go')
license=('Apache')
source=("https://github.com/digitalocean/${pkgname}/archive/${pkgver}.tar.gz"
        "droplet-agent.service")
sha512sums=('834d0468e1e5b616c8ca61bf844abd35169dddcf957b2ae01a4e412818324119fec46400068c2ef610335cce51e1638faeff0084459a3d804a93526c54cf841a'
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
