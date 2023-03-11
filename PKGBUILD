# Maintainer: leuko <aur_2022_03@aydos.de>
# Contributor: Noeljnuior <liamgliamgmailcom>

pkgname=nextcloud-spreed-signaling
pkgver=1.1.1
pkgrel=1
pkgdesc='Standalone signaling server for Nextcloud Talk.'
arch=(any)
url='https://github.com/strukturag/nextcloud-spreed-signaling'
license=(AGPL3)
makedepends=('git' 'go>=1.10')
backup=(etc/signaling/server.conf)
install=nextcloud-spreed-signaling.install
depends=()
optdepends=('nats-server' 'janus-gateway')
source=("https://github.com/strukturag/nextcloud-spreed-signaling/releases/download/v$pkgver/nextcloud-spreed-signaling-v$pkgver.tar.gz")
sha256sums=(78e8a7beb8097784cc131f031ebb48ff7f7c098c22d10b802e79ea527186ce4e)

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    make build
    make client
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    install -Dm755 "bin/signaling" "$pkgdir/usr/bin/signaling"
    install -Dm755 "bin/proxy" "$pkgdir/usr/bin/signaling-proxy"
    install -Dm755 "bin/client" "$pkgdir/usr/bin/signaling-client"
    install -Dm644 "dist/init/systemd/signaling.service" "$pkgdir/usr/lib/systemd/system/signaling.service"
    install -Dm600 "server.conf.in" "$pkgdir/etc/signaling/server.conf"
}
