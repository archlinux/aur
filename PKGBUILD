# Maintainer: Andrei Dubovik <andrei at dubovik dot eu>
pkgname=protonmail-bridge-nokeychain
provides=("protonmail-bridge")
conflicts=("protonmail-bridge")
pkgver=2.4.0
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
    "012879033686cd5304f628e1f5d885f50ea19b849f99f383a218007a1ef8cbd3"
    "326efe15e552617df426e08af1c4443d3ef218e77afc426b3902f78b5607c507"
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
    install -D proton-bridge-$pkgver/proton-bridge "$pkgdir/usr/bin/protonmail-bridge"
    install -D -m644 protonmail-bridge.service "$pkgdir/usr/lib/systemd/user/protonmail-bridge.service"
}
