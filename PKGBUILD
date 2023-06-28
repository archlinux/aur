# Maintainer: qubidt <qubidt at gmail dot com>
# Contributor: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=gamja
_pkgver=1.0.0-beta.8
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Simple IRC web client'
arch=('any')
url="https://sr.ht/~emersion/gamja/"
license=('AGPL3')
depends=()
makedepends=('npm')
provides=('gamja')
conflicts=('gamja')
source=("${pkgname}-${pkgver}::https://git.sr.ht/~emersion/gamja/archive/v${_pkgver}.tar.gz"
        "config.example.json"
)
sha256sums=('4e4aad554d5cf785d1cd626d27877cb68d6e8a65221da52a9e92c109f4d25845'
            '2ea3471ae8a508d59862acac86d388472468a34380da993d1edac6f2a4ba73cf')
backup=("etc/webapps/${pkgname}/config.json")

prepare() {
    cd "${pkgname}-v${_pkgver}"
    export npm_config_cache="${srcdir}/npm_cache"
    export npm_config_build_from_source=true
    npm install
}

build() {
    cd "${pkgname}-v${_pkgver}"
    export npm_config_cache="${srcdir}/npm_cache"
    export npm_config_build_from_source=true
    npm run build
    echo "{}" > config.json
}

package() {
    install -dm 755 "${pkgdir}/usr/share/webapps/gamja/"

    # install -Dm 644 config.json "${pkgdir}/etc/webapps/${pkgname}/config.json"
    install -Dm 644 config.example.json "${pkgdir}/usr/share/doc/${pkgname}/config.example.json"
    ln -s "/etc/webapps/${pkgname}/config.json" "${pkgdir}/usr/share/webapps/${pkgname}/config.json"

    cd "${pkgname}-v${_pkgver}"
    install -Dm 644 config.json "${pkgdir}/etc/webapps/${pkgname}/config.json"
    cp -r "dist"/* "${pkgdir}/usr/share/webapps/gamja"
}
