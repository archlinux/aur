# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=librespot-git
_pkgname=librespot
pkgver=258.9e495d6
pkgrel=1
epoch=1
pkgdesc="An open source client library for Spotify."
arch=('i686' 'x86_64')
url="https://github.com/plietar/librespot"
license=('MIT')
depends=('rust' 'protobuf')
makedepends=('cargo' 'portaudio')
provides=('librespot')
conflicts=('librespot')
source=('git+https://github.com/plietar/librespot'
        'librespot.conf'
        'librespot.service')
sha256sums=('SKIP'
            '3d48207e0be5cf2e68a9ecfd8f418aa1d71fa7f97d562780aa73d2db1a46cac5'
            'c41110008b16929c7e5f71512cea8dcf92fab36455a61bc2d56ced731918c602')

pkgver()
{
    cd "$_pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
    cd "$_pkgname"
    cargo build \
        --features pulseaudio-backend \
        --release
}

package()
{
    install -D -m 755 "$_pkgname"/target/release/librespot \
        "$pkgdir"/usr/bin/librespot
    install -d -m 755 "$pkgdir"/var/cache/librespot
    install -D -m 640 librespot.conf \
        "$pkgdir"/etc/librespot.conf
    install -D -m 644 librespot.service \
        "$pkgdir"/usr/lib/systemd/system/librespot.service
}
