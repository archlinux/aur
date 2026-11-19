# Maintainer: Andrei Dubovik <andrei at dubovik dot eu>
pkgname=protonmail-bridge-nokeychain
provides=("protonmail-bridge")
conflicts=(
    "protonmail-bridge"
    "protonmail-bridge-core"
)
pkgver=3.27.2
pkgrel=1
pkgdesc="An IMAP/SMTP bridge to a ProtonMail account (patched, stores secrets in a file)"
arch=("x86_64")
url="https://protonmail.com/bridge/"
license=("GPL3")
depends=('libfido2')
makedepends=("go>=2:1.26.1")
options=("!strip")
source=(
    "https://github.com/ProtonMail/proton-bridge/archive/refs/tags/v$pkgver.tar.gz"
    "keyfile.patch"
    "protonmail-bridge.service"
)
sha256sums=(
    "720ced16f25b6f92758f2117edc9ccd7511c66202097ba6b1630ab29d6b097b6"
    "8ec5093037e6d35566e17185479ac2f2e3fdbe19a0d48c933f2eb5db8f44386e"
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
