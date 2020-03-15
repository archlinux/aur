# Maintainer: Bart De Vries <devriesb at gmail dot com>

pkgname=snapcast
pkgver=0.19.0
pkgrel=1
pkgdesc="Synchronous multi-room audio player"
arch=('x86_64' 'armv6h' 'armv7h')
url="https://github.com/badaix/snapcast"
license=('GPL')
depends=(alsa-lib avahi libvorbis flac opus expat libsoxr)
makedepends=(alsa-utils boost)
install="snapcast.install"
backup=('etc/default/snapserver' 'etc/default/snapclient' 'etc/snapserver.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/badaix/snapcast/archive/v${pkgver}.tar.gz"
        "snapcast.sysusers"
        "snapcast.tmpfiles"
        "snapcast.install")
sha256sums=('15faf3727bed1a937df95e4fcb5c72412258833bb3eabfea32169436b695d9ba'
            '9fe6e9e07adb77f555a617b772e6d01e098e1dfaad1e8075e03a7d7ba76141de'
            '1c58fef5d3e2de64c1df52138f0f3c841773e7881b9cbc76f23312deeebc11b5'
            '132ec97e9b1d179f45269cc5cc4d6850384b4796ffef7d7560cf8440447a11c6')

prepare() {
    cd "${pkgname}-${pkgver}"
}

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 server/snapserver "${pkgdir}/usr/bin/snapserver"
    install -Dm644 server/snapserver.1 "${pkgdir}/usr/share/man/man1/snapserver.1"
    install -Dm644 server/etc/snapserver.conf "${pkgdir}/etc/snapserver.conf"

    install -Dm755 client/snapclient "${pkgdir}/usr/bin/snapclient"
    install -Dm644 client/snapclient.1 "${pkgdir}/usr/share/man/man1/snapclient.1"

    install -Dm644 debian/snapserver.service "${pkgdir}/usr/lib/systemd/system/snapserver.service"
    install -Dm644 debian/snapserver.default "${pkgdir}/etc/default/snapserver"
    install -Dm644 debian/snapclient.service "${pkgdir}/usr/lib/systemd/system/snapclient.service"
    install -Dm644 debian/snapclient.default "${pkgdir}/etc/default/snapclient"

    install -Dm644 "${srcdir}/snapcast.sysusers" "${pkgdir}/usr/lib/sysusers.d/snapclient.conf"
    install -Dm644 "${srcdir}/snapcast.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/snapclient.conf"
}

