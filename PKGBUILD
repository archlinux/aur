# Maintainer: Andrei Dubovik <andrei at dubovik dot eu>
pkgname=protonmail-bridge-nokeychain
provides=("protonmail-bridge")
conflicts=("protonmail-bridge")
pkgver=1.8.2
pkgrel=1
pkgdesc="An IMAP/SMTP bridge to a ProtonMail account"
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
    "3fd4f3649fae4063a67e8b5fd3472bc656d546449a2f7be4537e748989ba93e7"
    "60e1394fed0ae4feb4111476aa68817f2da72bb6bf516bc60ad9d618aead5ce8"
    "080b71b2a6b52895bcfbab66eee5cd1149d2c69a837bbeb1e0a154b93f4aa5e5"
)

prepare() {
    cd proton-bridge-$pkgver
    patch -p1 < "$srcdir/keyfile.patch"
}

build() {
    cd proton-bridge-$pkgver
    make build-nogui
}

check() {
    cd proton-bridge-$pkgver
    make test
}

package() {
    install -D proton-bridge-$pkgver/proton-bridge "$pkgdir/usr/bin/protonmail-bridge"
    install -D -m644 protonmail-bridge.service "$pkgdir/usr/lib/systemd/user/protonmail-bridge.service"
}
