# Maintainer: Tom Vincent <aur@tlvince.com>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=librespot-alsa-git
_pkgname=librespot
pkgver=1420.bbd575e
pkgrel=1
epoch=1
pkgdesc="Open Source Spotify client library, alsa backend"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/librespot-org/librespot"
license=('MIT')
depends=('libvorbis' 'alsa-lib')
makedepends=('git' 'rust')
provides=('librespot')
conflicts=('librespot' 'librespot-git')
source=('git+https://github.com/librespot-org/librespot')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "$_pkgname"

    case "$CARCH" in
      armv7h) target=armv7-unknown-linux-gnueabihf;;
      *)      target="$CARCH-unknown-linux-gnu";;
    esac

    cargo fetch \
        --locked \
        --target "$target"
}

build() {
    cd "$_pkgname"
    cargo build \
        --frozen \
        --release \
        --no-default-features \
        --features alsa-backend
}

package() {
    cd "$_pkgname"
    cargo install \
        --no-track \
        --locked \
        --root "$pkgdir/usr" \
        --path .

    install -D -m 644 contrib/librespot.service \
        "$pkgdir"/usr/lib/systemd/system/librespot.service
    install -D -m 644 contrib/librespot.user.service \
        "$pkgdir"/usr/lib/systemd/user/librespot.service
    install -D -m 644 LICENSE \
        "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
