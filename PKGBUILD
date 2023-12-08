# Maintainer: danieltetraquark
pkgname=scanservjs
pkgver=3.0.3
pkgrel=2
pkgdesc="SANE scanner nodejs web ui"
arch=('any')
url="https://github.com/sbs20/scanservjs"
license=('GPL')
depends=('sane' 'imagemagick' 'curl' 'nodejs' 'tesseract')
makedepends=('npm')
install=scanservjs.install
backup=('etc/webapps/scanservjs/config.js' 'etc/webapps/scanservjs/devices.json')
source=(
"https://github.com/sbs20/scanservjs/archive/refs/tags/v${pkgver}.tar.gz"
"scanservjs.sysusersd"
"scanservjs.service"
)
sha512sums=('e3746cfab118b08b75fe5a862e1b06d35bce3fafe7b5cf482ddfd28aad8ac9879981eef5bdadc35a783607aac49eef95b966ff1d2ddf431eaf6e2d7e335623fb'
            '48cfc5f2ec0fb1428d6d745cfe9e63f1a020d8bdd94225058b9ab16e077ad83492a68b2b974a4c55f071bddf90202a8b3a7b25fdabdb20ac7a94cef8acd7e6d6'
            '07659a9b3e65f32b42977e2d39d114ae45fcab5fcb486b0f3c7a653e7656b27a95af00f3a1af51ec953c37ffa6c6983bf7c9b1c70ca7bcd85b615781231f753f')


_foldername=${pkgname}-${pkgver}
build() {
    cd ${_foldername}

    npm clean-install .
    npm run build
    npm clean-install --omit=dev --only=prod --loglevel=error
#    find dist/node_modules -name "*.map" -type f -delete

#   npm run build:version && npm run build --workspaces && node build.js --assemble

#    export NODE_OPTIONS=--openssl-legacy-provider
#    npm run install
#    npm run build

#    npm run package

    cd dist
    npm install --production

}

package() {
    install -Dm644 "${srcdir}/scanservjs.sysusersd" "${pkgdir}/usr/lib/sysusers.d/scanservjs.conf"

    cd ${_foldername}

    # install LICENSE
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # install documentation
    install -Dm644 ./docs/* -t "${pkgdir}/usr/share/doc/scanservjs/"


    install -d "${pkgdir}/usr/share/webapps/scanservjs" "${pkgdir}/etc/webapps/scanservjs" "${pkgdir}/var/lib/webapps/scanservjs"

    mv dist/config/* "${pkgdir}/etc/webapps/scanservjs/"
    mv dist/data/* "${pkgdir}/var/lib/webapps/scanservjs/"

    chmod +x dist/server/server.js

    # install main files
    cp -r dist/* "${pkgdir}/usr/share/webapps/scanservjs/"

    # replace /var/www/scanservjs/ in systemd service
#    sed -i 's?/var/www/scanservjs?/usr/share/webapps/scanservjs?' packages/server/scanservjs.service
#    sed -i 's?Group=users??' packages/server/scanservjs.service
    install -Dm644  ${srcdir}/scanservjs.service "${pkgdir}/usr/lib/systemd/system/scanservjs.service"

    rm -d ${pkgdir}/usr/share/webapps/scanservjs/config "${pkgdir}/usr/share/webapps/scanservjs/data"
    ln -s /etc/webapps/scanservjs "${pkgdir}/usr/share/webapps/scanservjs/config"
    ln -s /var/lib/webapps/scanservjs "${pkgdir}/usr/share/webapps/scanservjs/data"
}
