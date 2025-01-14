# Maintainer: jason.nader@protonmail.com
# Maintainer: devome <evinedeng@hotmail.com>
# Based on PKGBUILD by Kevin S <aur@eldenring.mozmail.com>

pkgname=audiobookshelf
pkgver=2.17.7
pkgrel=3
epoch=1
pkgdesc="Self-hosted audiobook server for managing and playing audiobooks"
arch=("x86_64" "aarch64")
url="https://github.com/advplyr/${pkgname}"
license=('GPL-3.0-only')
depends=("ffmpeg" "libnusqlite3" "nodejs")
makedepends=("npm")
backup=("etc/conf.d/${pkgname}")
options=("!debug")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.conf"
        "${pkgname}.hook"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('f889909ecd2324fa355ccc02b72c21da592afa07c70f56b82c2da9cff72993ad'
            '642deac39c60d849d0cfdfa718c4da4ea6728585b1b55141f6bb1445fa90bff5'
            '91d00bbc9800f80cde439fd9b5343cf031b6a09557f03172c92d40f2f0775c2b'
            '4f37d8e407eda555231dc23d1cd35d329075ae6686acbb89d0b4612a824d594d'
            'cd5db44865de6f7401093b60869f937703213f196220e8c3325fa7f1b02db1fa'
            'ec04988b13dd049fbd021a51275c92120179f74f1e71fd9141bd720633e5f99f')

build() {
    cd "${pkgname}-${pkgver}"
    npm run client
    npm ci --only=production
    find {client/dist,node_modules,server} -type f -name "*.map" | xargs rm -rf
    sed -i '1i #!/usr/bin/node\n' prod.js
}

package() {
    install -Dm644 "${pkgname}.conf"     "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm644 "${pkgname}.hook"     "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.hook"
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver}"
    install -Dm644 readme.md             "${pkgdir}/usr/share/doc/${pkgname}/readme.md"
    install -Dm644 *.json             -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 prod.js            -t "${pkgdir}/usr/lib/${pkgname}"
    mv node_modules                      "${pkgdir}/usr/lib/${pkgname}"
    find {client/dist,server} -type f |
        xargs -I {} install -Dm644 {}    "${pkgdir}/usr/lib/${pkgname}/"{}
    install -dm755                       "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/prod.js"  "${pkgdir}/usr/bin/${pkgname}"
}
