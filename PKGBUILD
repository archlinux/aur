# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=librespot-git
_pkgname=librespot
pkgver=1381.8d70fd9
pkgrel=1
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

build() {
    cd "$_pkgname"
    cargo build \
        --frozen \
        --all-features \
        --release
}

package() {
    cd "$_pkgname"
    cargo install \
        --no-track \
        --locked \
        --all-features \
        --root "$pkgdir/usr" \
        --path .

    install -D -m 644 contrib/librespot.service \
        "$pkgdir"/usr/lib/systemd/system/librespot.service
    install -D -m 644 contrib/librespot.user.service \
        "$pkgdir"/usr/lib/systemd/user/librespot.service
    install -D -m 644 LICENSE \
        "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
