# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=guam
pkgver=0.9.2
pkgrel=1
pkgdesc='A smart, unjustly outcasted Reverse IMAP Proxy that lives at the perimeter of your IMAP environment.'
arch=('any')
license=('GPL3')
depends=('erlang')
optdepends=('pykolab: configuration tool')
makedepends=()
backup=("etc/${pkgname}/sys.config")
url='http://kolab.org'
install="guam.install"
source=("https://mirror.kolabenterprise.com/pub/releases/${pkgname}-${pkgver}.tar.gz")

sha256sums=('940287d6a683147445d913c9346632bfb09a783fd10a6038fd659aa4c829dbcd')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s|/usr/sbin/guam|/opt/kolab_guam/bin/kolab_guam|g" contrib/guam.service
    make deps
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make guam
}
            
package() {
    cd "${srcdir}/${pkgname}-${pkgver}/rel"
    ../rebar generate
    
    mkdir "${pkgdir}/opt/"
    cp -r "kolab_guam" "${pkgdir}/opt/"
    
    mkdir -p "${pkgdir}/etc/${pkgname}"
    mv "${pkgdir}/opt/kolab_guam/releases/0.9/sys.config" \
        "${pkgdir}/etc/${pkgname}/sys.config"
    ln -s "/etc/${pkgname}/sys.config" \
        "${pkgdir}/opt/kolab_guam/releases/0.9/sys.config"

    mkdir -p "${pkgdir}/var/log/${pkgname}"
    mv "${pkgdir}/opt/kolab_guam/log" "${pkgdir}/var/log/${pkgname}"
    ln -s "/var/log/${pkgname}" "${pkgdir}/opt/kolab_guam/log"
    
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/contrib/guam.service" "${pkgdir}/usr/lib/systemd/system/guam.service"
}
