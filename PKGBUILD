# Maintainer: TF <mail | at | sedi [DOT] one>
pkgname=avast-fss
pkgver=4.1.0
_pkgverbuild='1~debian11'
pkgrel=6
arch=('x86_64')
pkgdesc='Avast File Server Shield. Provides the On-Write scanning service.'
depends=("avast=${pkgver}")
backup=('etc/avast/fss.conf')
url='https://www.avast.com/business/products/linux-antivirus'
license=('custom')
noextract=(
            "avast-fss_${pkgver}-${_pkgverbuild}_amd64.deb"
          )
options=("!strip")
conflicts=( 'avast-proxy'
            'eea'
            'esets'
            'eea-dkms'
            'eea7-dkms')
install=${pkgname}.install
# Ubuntu Jammy depends on OpenSSL v3 (alpha) and I dont want to depend on openssl3-git here. so.. bullseye
source=(
        "https://repo.avcdn.net/linux-av/deb/pool/debian-bullseye/avast-fss_${pkgver}-${_pkgverbuild}_amd64.deb"
         "${pkgname}.install"
       )
sha256sums=('fe5bc08a3e015368c61c0db2b5dc3fd0d0a926f3a11aa9976b4d9f191aedb3fe'
            '97974db01b47671bd8705eac7c106d6b27ca4d033dd07f03774838d2abe4bc77')
validpgpkeys=('6AFE173577C4CBD621DF217FD093435AA3ED2C4A')

package() {
    # uncompress base packages
    bsdtar -xf avast-fss_${pkgver}-${_pkgverbuild}_amd64.deb
    bsdtar -xf data.tar.xz -C ${pkgdir}/

    # install deb post/pre scripts
    [ ! -d "${pkgdir}/usr/share/${pkgname}/pkgscripts" ] && mkdir -p ${pkgdir}/usr/share/${pkgname}/pkgscripts
    bsdtar -xf control.tar.gz -C ${pkgdir}/usr/share/${pkgname}/pkgscripts
    chmod -R 755 ${pkgdir}/usr/share/${pkgname}/pkgscripts

    # install lic
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    install -Dm644 $pkgdir/usr/share/doc/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
