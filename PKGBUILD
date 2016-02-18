# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=guam
pkgver=0.7.1
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
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz")

sha256sums=('bf1b74a1e203754d0476f959094fa71efd5c4253e2887a6c25bfd2094ee058c7')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s|/usr/sbin/guam|/opt/kolab_guam/bin/kolab_guam|g" guam.service
    make deps-up
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}
            
package() {
    cd "${srcdir}/${pkgname}-${pkgver}/rel"
    ../rebar generate
    
    mkdir "${pkgdir}/opt/"
    cp -r "kolab_guam" "${pkgdir}/opt/"
    
    mkdir -p "${pkgdir}/etc/${pkgname}"
    mv "${pkgdir}/opt/kolab_guam/releases/${pkgver}/sys.config" \
        "${pkgdir}/etc/${pkgname}/sys.config"
    ln -s "/etc/${pkgname}/sys.config" \
        "${pkgdir}/opt/kolab_guam/releases/${pkgver}/sys.config"

    mkdir -p "${pkgdir}/var/log/${pkgname}"
    mv "${pkgdir}/opt/kolab_guam/log" "${pkgdir}/var/log/${pkgname}"
    ln -s "/var/log/${pkgname}" "${pkgdir}/opt/kolab_guam/log"
    
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/guam.service" "${pkgdir}/usr/lib/systemd/system/guam.service"
}
