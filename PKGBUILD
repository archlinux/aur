# Maintainer: Andrei Dubovik <andrei at dubovik dot eu>
pkgname=protonmail-bridge-nokeychain
provides=("protonmail-bridge")
conflicts=("protonmail-bridge")
pkgver=3.8.2
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
    "3d844fa74c06767283a73305737e82b9ec7c59cc35d08fcb8a5bd68a128735e2"
    "075bf87cec3f12d76ab97ccdfc22d5e3f9dd001eff23a843d4a2228b016fb20a"
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
