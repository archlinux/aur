# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=librespot-git
_pkgname=librespot
pkgver=1383.095536f
pkgrel=2
epoch=1
pkgdesc="Open Source Spotify client library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/librespot-org/librespot"
license=('MIT')
depends=('libvorbis' 'alsa-lib')
makedepends=('git' 'rust')
provides=('librespot')
conflicts=('librespot')
source=('git+https://github.com/librespot-org/librespot')
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "$_pkgname"
    cargo fetch \
        --locked \
        --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    cargo build \
        --frozen \
        --release
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
