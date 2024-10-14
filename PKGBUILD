# Maintainer: Andrei Dubovik <andrei at dubovik dot eu>
pkgname=protonmail-bridge-nokeychain
provides=("protonmail-bridge")
conflicts=(
    "protonmail-bridge"
    "protonmail-bridge-core"
)
pkgver=3.14.0
pkgrel=2
pkgdesc="An IMAP/SMTP bridge to a ProtonMail account (patched, stores secrets in a file)"
arch=("x86_64")
url="https://protonmail.com/bridge/"
license=("GPL3")
depends=()
makedepends=("go>=2:1.22.0")
options=("!strip")
source=(
    "https://github.com/ProtonMail/proton-bridge/archive/refs/tags/v$pkgver.tar.gz"
    "keyfile.patch"
    "protonmail-bridge.service"
)
sha256sums=(
    "d15e69b190e5eedddcca8566e0116ea9fb68f470df46d5a03f3b0aa7b0c9ff3e"
    "9f8f25a87f8c111f3e1ad4ae3b9f8856210712bd8982675af7091aa26f7dec56"
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
