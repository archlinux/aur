# Maintainer: danieltetraquark
pkgname=scanservjs
pkgver=2.16.1
pkgrel=1
pkgdesc="SANE scanner nodejs web ui"
arch=('any')
url="https://github.com/sbs20/scanservjs"
license=('GPL')
depends=('sane' 'imagemagick' 'curl' 'nodejs' 'tesseract')
makedepends=('npm')
install=scanservjs.install
backup=('etc/webapps/scanservjs' 'var/lib/webapps/scanservjs')
source=(
"https://github.com/sbs20/scanservjs/archive/refs/tags/v${pkgver}.tar.gz"
"scanservjs.sysusersd"
"removeFiberDependency.patch"
)
sha512sums=(
'18d42d560b33bb4604858fb0b13ac03b8098b61f5649f3691e5ce954f369293ac43fe72e7f1d4c122ebe4b437971e208a86a08b9a6e7588d94b9f921da194feb'
'SKIP'
'SKIP'
)

# TODO backup and symlink for config, data; sysuser
build() {
    cd scanservjs-${pkgver}

    patch -p1 --input ../removeFiberDependency.patch

    npm run install
    npm run build

    cd dist
    npm install --production

}

package() {
    install -Dm644 "${srcdir}/scanservjs.sysusersd" "${pkgdir}/usr/lib/sysusers.d/scanservjs.conf"

    cd scanservjs-${pkgver}

    # install LICENSE
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # install documentation
    install -Dm644 ./docs/* -t "${pkgdir}/usr/share/doc/scanservjs/"


    install -d "${pkgdir}/usr/share/webapps/scanservjs" "${pkgdir}/etc/webapps/scanservjs" "${pkgdir}/var/lib/webapps/scanservjs"

    # remove the installer, and systemd from the scanservjs directory in /usr/share/webapps
    rm dist/installer.sh dist/scanservjs.service

    mv dist/config/* "${pkgdir}/etc/webapps/scanservjs/"
    mv dist/data/* "${pkgdir}/var/lib/webapps/scanservjs/"

    chmod +x dist/server/server.js

    # install main files
    cp -r dist/* "${pkgdir}/usr/share/webapps/scanservjs/"

    # replace /var/www/scanservjs/ in systemd service
    sed -i 's?/var/www/scanservjs?/usr/share/webapps/scanservjs?' packages/server/scanservjs.service
    sed -i 's?Group=users??' packages/server/scanservjs.service
    install -Dm644  packages/server/scanservjs.service "${pkgdir}/usr/lib/systemd/system/scanservjs.service"

    rm -d ${pkgdir}/usr/share/webapps/scanservjs/config "${pkgdir}/usr/share/webapps/scanservjs/data"
    ln -s /etc/webapps/scanservjs "${pkgdir}/usr/share/webapps/scanservjs/config"
    ln -s /var/lib/webapps/scanservjs "${pkgdir}/usr/share/webapps/scanservjs/data"
}
