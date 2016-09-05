# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=librespot-git
_pkgname=librespot
pkgver=218.f79df63
pkgrel=1
epoch=1
pkgdesc="An open source client library for Spotify."
arch=('i686' 'x86_64')
url="https://github.com/plietar/librespot"
license=('MIT')
depends=('rust' 'protobuf')
makedepends=('cargo')
provides=('librespot')
conflicts=('librespot')
source=('git+https://github.com/plietar/librespot'
        'librespot.conf'
        'librespot.service')
sha1sums=('SKIP'
          'b9c3c0bb96ab42d9bbe9f61ab9d84486a511e776'
          '19348db822d42008fe0a3c55cb00c57fc54ebe5f')

pkgver()
{
    cd $_pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
    cd $_pkgname
    cargo build \
        --features pulseaudio-backend \
        --release
}

package()
{
    install -D -m 755 $_pkgname/target/release/librespot \
        "${pkgdir}"/usr/bin/librespot
    install -d -m 755 "$pkgdir"/var/cache/librespot
    install -D -m 640 librespot.conf \
        "${pkgdir}"/etc/librespot.conf
    install -D -m 644 librespot.service \
        "${pkgdir}"/usr/lib/systemd/system/librespot.service
}
