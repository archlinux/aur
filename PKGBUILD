# Maintainer: TF <mail | at | sedi [DOT] one>
pkgname=('avast' 'avast-fss' 'avast-rest' 'avast-gui')
pkgver=4.1.0
_pkgverbuild='1~debian11'
pkgrel=1
arch=('x86_64')
pkgdesc='Avast Antivirus for Linux'
url='https://www.avast.com/business/products/linux-antivirus'
license=('custom')
noextract=("avast_${pkgver}-${_pkgverbuild}_amd64.deb"
            "avast-fss_${pkgver}-${_pkgverbuild}_amd64.deb"
            "avast-rest_${pkgver}-${_pkgverbuild}_amd64.deb"
          )
options=("!strip")
conflicts=( 'avast-proxy'
            'eea'
            'esets'
            'eea-dkms'
            'eea7-dkms')
install=${pkgname}.install
# Ubuntu Jammy depends on OpenSSL v3 (alpha) and I dont want to depend on openssl3-git here. so.. bullseye
source=("https://repo.avcdn.net/linux-av/deb/pool/debian-bullseye/avast_${pkgver}-${_pkgverbuild}_amd64.deb"
        "https://repo.avcdn.net/linux-av/deb/pool/debian-bullseye/avast-fss_${pkgver}-${_pkgverbuild}_amd64.deb"
        "https://repo.avcdn.net/linux-av/deb/pool/debian-bullseye/avast-rest_${pkgver}-${_pkgverbuild}_amd64.deb"
        "https://static3.avast.com/10002535/web/i/v2/components/logos/avast-logos/avast-logo-inverse.svg"
        "https://static3.avast.com/10002535/web/i/v2/components/logos/avast-logos/avast-logo-business.svg"
        "avast-logo-transp.png::https://img.informer.com/icons_mac/png/128/580/580294.png"
        "git+https://github.com/secure-diversITy/arch_avast-gui.git"
         "${pkgname}.install")
sha256sums=('2e41c9b929c872308731f75e1a2ed268750898b7a589a1c3a73e0ab92e7dbce7'
            'fe5bc08a3e015368c61c0db2b5dc3fd0d0a926f3a11aa9976b4d9f191aedb3fe'
            'ed4d2138f8d85105ff562f7060d08c02b06b8ce1a59fad37027c1c6f8ea1d0c3'
            '63b2334f1a7b6023acc55f36fc44424d050c65bf421ca871ebcf967e1dea7ff6'
            '7404130ed0154296a67713b1a7421336482ee8bdc1c4e90327c4ae666e7b31f5'
            '808451b4f82dec1e463428f0fdc0ea783955d36df96ad6e50d6fae877c39f7b7'
            'SKIP'
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

package_avast-fss() {
    pkgdesc='Avast File Server Shield is a service which provides scanning of file server shared directories.'
    depends=("avast=${pkgver}")
    install=${pkgname}.install
    backup=('etc/avast/fss.conf')

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

package_avast-rest() {
    pkgdesc='Avast Antivirus REST API. avast-rest is an HTTP server which provides a REST API for avast scanner.'
    depends=("avast=${pkgver}")
    install=${pkgname}.install
    backup=('etc/avast/rest.conf')

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

package_avast-gui() {
    pkgdesc='Avast Antivirus GUI (unofficial)'
    depends=("avast=${pkgver}" "avast-fss=${pkgver}")
    _pkgver="0.1.0-ALPHA"
    #install=${pkgname}.install

    # prep
    mkdir -p $pkgdir/usr/share/$pkgname/ $pkgdir/usr/share/applications/ $pkgdir/usr/share/$pkgname/desktopfiles/

    # install the Avast icons
    cp $srcdir/avast-logo-inverse.svg $pkgdir/usr/share/$pkgname/icon.svg
    cp $srcdir/avast-logo-business.svg $pkgdir/usr/share/$pkgname/icon-biz.svg
    cp $srcdir/avast-logo-transp.png $pkgdir/usr/share/$pkgname/icon-transp.png

    # install the yad wrapper
    install -Dm755 arch_avast-gui/$pkgname.in $pkgdir/usr/bin/$pkgname
    sed -i "s/%VER%/$_pkgver/g" $pkgdir/usr/bin/$pkgname

    # install application shortcut
    install -Dm755 arch_avast-gui/$pkgname.desktop $pkgdir/usr/share/applications/

    # install menu items for the main window
    install -Dm755 arch_avast-gui/desktopfiles/* $pkgdir/usr/share/$pkgname/desktopfiles/

    # install lic
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    install -Dm644 arch_avast-gui/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
