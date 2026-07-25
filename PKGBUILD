# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=igv-web
_pkgname=igv
pkgver=2.4.7
pkgrel=1
pkgdesc='A web application for exploring genomic datasets using igv.js'
arch=('any')

url='https://igv.org/doc/webapp/'
license=('MIT')
keywords=('bioinformatics')
depends=('nginx')
makedepends=('npm')

backup=("etc/nginx/conf.d/${pkgname}.conf")
source=("https://igv.org/app-archive/igv-webapp.${pkgver}.zip"
    "igv-web.patch"
    "igv-web.conf"
    "igvwebConfig.patch"
)
sha256sums=('0d02ba01df2e1ad3d10884d4267075d24b1950d54e3f0580c62c80b94257ed86'
            'b131c27b138880a92dd24fa4c4c1c99161ab2ff1ab268fa8f1637a585e7c40e2'
            '813c375ee0c763d38b66ea589dd9340b4f2c7ff8b969ab57ec13870cc0348a56'
            '2b0c9a51f42ae36ac7c50a01e7f923440fa56f9f63c14134d46ee497e6281fd9')

options=('!debug' '!strip')

prepare() {
    patch igv-webapp.${pkgver}/index.html -i ${pkgname}.patch
    patch igv-webapp.${pkgver}/igvwebConfig.js -i igvwebConfig.patch
    mkdir -p igv-webapp.${pkgver}/node_modules
}

build() {
    cd igv-webapp.${pkgver}
    npm install bootstrap@5.3.3 \
	bootstrap-icons \
	jquery@3.5.1 \
	datatables.net-select-dt@1.3.1 \
	react-dom@16.14.0 \
	@jbrowse/react-circular-genome-view@1.7

    echo "you can customize igvwebConfig.js in /srv/http/${pkgname}"
}

package() {
    install -Dm644 ${pkgname}.conf ${pkgdir}/etc/nginx/conf.d/${pkgname}.conf
    install -dm755 ${pkgdir}/srv/http
    cp -r ${srcdir}/igv-webapp.${pkgver} ${pkgdir}/srv/http/${pkgname}

    echo "you should include conf.d/ in /etc/nginx/nginx.conf http block"
}
