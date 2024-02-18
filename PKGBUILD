# Maintainer: Andrei Dubovik <andrei at dubovik dot eu>
pkgname=protonmail-bridge-nokeychain
provides=("protonmail-bridge")
conflicts=("protonmail-bridge")
pkgver=3.9.1
pkgrel=1
pkgdesc="An IMAP/SMTP bridge to a ProtonMail account (patched, stores secrets in a file)"
arch=("x86_64")
url="https://protonmail.com/bridge/"
license=("GPL3")
depends=()
makedepends=("go")
options=("!strip")
source=(
    "https://github.com/ProtonMail/proton-bridge/archive/refs/tags/v$pkgver.tar.gz"
    "keyfile.patch"
    "protonmail-bridge.service"
)
sha256sums=(
    "b802d6d9cd96c7ba78ed3dc6a07b04ff9a19b37f6611562aab5745658b5e0a49"
    "7b9a81c7cc519307fb677c0ee3b7948fe75f860c38de66de4d82c01150adc836"
    "5ffaaa5acc030ebed82b3b13f1ddc2791b50851fb93964a5d6a20a11000c18c2"
)

prepare() {
    cd proton-bridge-$pkgver
    patch -p1 < "$srcdir/keyfile.patch"
}

build() {
    cd proton-bridge-$pkgver
    make build-nogui
}

package() {
    install -D proton-bridge-$pkgver/bridge "$pkgdir/usr/bin/protonmail-bridge"
    install -D -m644 protonmail-bridge.service "$pkgdir/usr/lib/systemd/user/protonmail-bridge.service"
}
