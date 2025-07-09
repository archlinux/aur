# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=igv-web
_pkgname=igv
pkgver=2.2.8
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
sha256sums=('45f2002159e3088ac1af7179b056599b7b746810ef361d2201579a69667b1133'
            '44cb1fbd23c869fb6e06cff5d9144fd81c6d8951b5a42e762718033fb0fb790c'
            '813c375ee0c763d38b66ea589dd9340b4f2c7ff8b969ab57ec13870cc0348a56')

options=('!debug' '!strip')

prepare() {
    patch igv-webapp.${pkgver}/index.html -i ${pkgname}.patch
    mkdir -p igv-webapp.${pkgver}/node_modules
}

build() {
    cd igv-webapp.${pkgver}
    npm install bootstrap@5.3.3 \
	jquery@3.5.1 \
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
