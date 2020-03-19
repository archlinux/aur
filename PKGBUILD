# Maintainer: Hubert Hirtz <hubert.hirtz@laposte.net>

pkgname=ellidri
pkgver=2.3.0
pkgrel=1
pkgdesc='Your kawaii IRC server'
arch=('x86_64')
url="https://git.sr.ht/~taiite/ellidri"
license=('ISC')
depends=('openssl')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~taiite/ellidri/archive/${pkgver}.tar.gz"
        'ellidri.service')
sha512sums=('3023e8b934cd786effc9b62f1665efa7cc574d2c3b4b79a88c6f62fa72cc0ccb07503a169015fcf669c11ca6c15976015cdf54e07cf4a1bc364dc61807c5ea76'
            '9aad2b434df7793925b2629eb04327bde3f158daa7a238dfe8c72fb1d5a24aa988ef6a952815eb21dc591ade2d4513f74b31e17734061b5f2f8b5476b106fe20')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cargo build --locked --release
    sed -is 's,#motd_file  doc/motd.txt,motd_file  /etc/ellidri.d/motd.txt,' doc/ellidri.conf
}

package() {
    install -Dm644 ellidri.service "${pkgdir}/usr/lib/systemd/system/ellidri.service"

    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 target/release/ellidri "${pkgdir}/usr/bin/ellidri"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm640 doc/ellidri.conf "${pkgdir}/etc/ellidri.conf"
    install -Dm640 doc/motd.txt "${pkgdir}/etc/ellidri.d/motd.txt"
}
