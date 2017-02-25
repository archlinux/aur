# Maintainer: Dennis Stengele <dennis@stengele.me>

pkgname=beehive
pkgver=0.2
pkgrel=7
pkgdesc="A flexible event and agent system with lots of bees"
arch=('x86_64' 'i686')
url="https://github.com/muesli/beehive"
license=('AGPL3')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/muesli/${pkgname}/archive/v${pkgver}.tar.gz"
        "beehive-admin-dist.zip::https://github.com/muesli/beehive-admin-dist/archive/e9e9a1124cf2d936e022be2371c6a5dd31f3a294.zip"
        "beehive.install"
        "beehive.service")
sha256sums=('6d0f2587e3b9f1ff0ae75fec58a5f49c520497f8f4a16a96b1c1ad5e0e1466b5'
            '7a87f6960d2deab3475cf7c96646bcd83126b40abe3381aa49505b92b8036666'
            '3a6725b9b51de4a8697c983844d742e499828af80d137f6ddc53523294111396'
            '8123c8f031ff32a6cf1e6986d5b96ab961a24515beedc52a02ba1c11e9b60506')

prepare() {
    cd "$pkgname-$pkgver"
    GOPATH=`pwd` go get -d -v
}

build() {
    cd "$pkgname-$pkgver"
    GOPATH=`pwd` go build
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/share/webapps/beehive/$pkgname"
    # Copy assets dir
    cp -r assets "$pkgdir/usr/share/webapps/beehive/assets"
    # Copy License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd ${srcdir}
    # Copy Unit file
    install -Dm644 beehive.service "$pkgdir/usr/lib/systemd/system/beehive.service"

    # Copy webinterface files
    install -dm755 "$pkgdir/usr/share/webapps/beehive/config"
    cp -r beehive-admin-dist-e9e9a1124cf2d936e022be2371c6a5dd31f3a294/* "$pkgdir/usr/share/webapps/beehive/config"
}

# vim:set ts=4 sw=4 et:
