# Maintainer: TF <mail | at | sedi [DOT] one>
pkgname=avast-rest
pkgver=4.1.0
_pkgverbuild='1~debian11'
pkgrel=5
arch=('x86_64')
pkgdesc='Avast Antivirus REST API. Provides a REST API for the avast scanner.'
url='https://www.avast.com/business/products/linux-antivirus'
license=('custom')
noextract=("avast-rest_${pkgver}-${_pkgverbuild}_amd64.deb" )
options=("!strip")
install=${pkgname}.install
depends=("avast=${pkgver}")
backup=('etc/avast/rest.conf')
# Ubuntu Jammy depends on OpenSSL v3 (alpha) and I dont want to depend on openssl3-git here. so.. bullseye
source=(
        "https://repo.avcdn.net/linux-av/deb/pool/debian-bullseye/avast-rest_${pkgver}-${_pkgverbuild}_amd64.deb"
        "${pkgname}.install"
       )
sha256sums=('ed4d2138f8d85105ff562f7060d08c02b06b8ce1a59fad37027c1c6f8ea1d0c3'
            'd8b5d7a89e84332cd0f0344ce71e34f2460a1d3b5312f9f36ce35a8e6940c249')
validpgpkeys=('6AFE173577C4CBD621DF217FD093435AA3ED2C4A')

package() {
    # uncompress base packages
    bsdtar -xf avast-rest_${pkgver}-${_pkgverbuild}_amd64.deb
    bsdtar -xf data.tar.xz -C ${pkgdir}/

    # install deb post/pre scripts
    [ ! -d "${pkgdir}/usr/share/${pkgname}/pkgscripts" ] && mkdir -p ${pkgdir}/usr/share/${pkgname}/pkgscripts
    bsdtar -xf control.tar.gz -C ${pkgdir}/usr/share/${pkgname}/pkgscripts
    chmod -R 755 ${pkgdir}/usr/share/${pkgname}/pkgscripts

    # install lic
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    install -Dm644 $pkgdir/usr/share/doc/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
