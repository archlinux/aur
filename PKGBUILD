# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=igv-web
_pkgname=igv
pkgver=3.5.2
pkgrel=1
pkgdesc='A web application for exploring genomic datasets using igv.js'
arch=('x86_64' 'aarch64')

url='https://igv.org/doc/webapp/'
license=('MIT')
keywords=('bioinformatics')
depends=('nginx')
makedepends=('npm')

backup=("etc/nginx/conf.d/${pkgname}.conf")
source=("https://igv.org/app-archive/igv-webapp.${pkgver}.zip"
    "igv-web.patch"
    "igv-web.conf"
)
sha256sums=('cfe91138eab7e30cf84f64d8c8c39178306c578090501cfec9a792a38a5323cd'
            'b131c27b138880a92dd24fa4c4c1c99161ab2ff1ab268fa8f1637a585e7c40e2'
            '813c375ee0c763d38b66ea589dd9340b4f2c7ff8b969ab57ec13870cc0348a56')

options=('!debug' '!strip')

prepare() {
    patch igv-webapp.${pkgver}/index.html -i ${pkgname}.patch
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
}

package() {
    install -Dm644 ${pkgname}.conf ${pkgdir}/etc/nginx/conf.d/${pkgname}.conf
    install -dm755 ${pkgdir}/srv/http
    cp -r ${srcdir}/igv-webapp.${pkgver} ${pkgdir}/srv/http/${pkgname}

    echo "you can customize igvwebConfig.js in /srv/http/${pkgname}"
    echo "you should include conf.d/ in /etc/nginx/nginx.conf"
}
