# Maintainer: TF <mail | at | sedi [DOT] one>
pkgname=avast
pkgver=4.1.0
_pkgverbuild='1~debian11'
pkgrel=7
arch=('x86_64')
pkgdesc='Avast Antivirus for Linux'
url='https://www.avast.com/business/products/linux-antivirus'
license=('custom')
noextract=(
            "avast_${pkgver}-${_pkgverbuild}_amd64.deb"
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
        "https://repo.avcdn.net/linux-av/deb/pool/debian-bullseye/avast_${pkgver}-${_pkgverbuild}_amd64.deb"
         "${pkgname}.install"
       )
sha256sums=('2e41c9b929c872308731f75e1a2ed268750898b7a589a1c3a73e0ab92e7dbce7'
            '9d8567e1ecf3b0f1020b277ed533da070e902f95313048bce126abaf71825d48')
validpgpkeys=('6AFE173577C4CBD621DF217FD093435AA3ED2C4A')

package_avast() {
    pkgdesc='Avast antivirus scanner provides a scan command line tool and unix domain sockets which are used by other services.'
    depends=('tar' 'file' 'curl' 'ca-certificates' 'glibc>=2.34' 'libcurl-gnutls>=7.16.2' 'util-linux-libs>=2.16' 'openssl>=1.1.0')
    install=${pkgname}.install
    backup=('etc/avast/avast.conf' 'etc/avast/vps.conf' 'etc/avast/whitelist')

    # uncompress base packages
    bsdtar -xf avast_${pkgver}-${_pkgverbuild}_amd64.deb
    bsdtar -xf data.tar.xz -C ${pkgdir}/

    # install deb post/pre scripts
    [ ! -d "${pkgdir}/usr/share/${pkgname}/pkgscripts" ] && mkdir -p ${pkgdir}/usr/share/${pkgname}/pkgscripts
    bsdtar -xf control.tar.gz -C ${pkgdir}/usr/share/${pkgname}/pkgscripts
    chmod -R 755 ${pkgdir}/usr/share/${pkgname}/pkgscripts

    chmod 700 $pkgdir/var/lib/avast/submit-data/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    install -Dm644 $pkgdir/usr/share/doc/avast/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
