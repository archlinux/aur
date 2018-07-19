# Maintainer: Mikołaj Chwalisz <chwalisz at tkn.tu-berlin dot de>
pkgname=ticloudagent
pkgver=0.5
# TI Cloud Agent 0.5 --- Built on 2018-03-28 15:39:06 IB: 17.10.0-201710271125
pkgrel=1
pkgdesc="The TI Cloud Agent is a small application that facilitates flashing and debugging hardware devices from the Texas Instruments Cloud Tools."
arch=('i686' 'x86_64')
url="http://processors.wiki.ti.com/index.php/TI_Cloud_Agent"
license=('custom:TECHNOLOGY SOFTWARE PUBLICLY AVAILABLE by Texas Instruments Incorporated')
depends=('libudev0-shim')
source=(${pkgname}_${pkgver}.run::https://dev.ti.com/ticloudagent/getInstaller?os=linux
    ${pkgname}.desktop
    61-msp430uif.rules
    )
noextract=("${pkgname}_${pkgver}.run" )
options=(!strip)
sha256sums=('1d1814dbd69af9fa98a379efc340435b94db40caad6b6d989cb78cdd99864524'
            '3764e8a5680bd825e7b95da2a93e43caafb982b4788112e57e5ab1d0f308fc26'
            'e6fc064be173031f3a845f937b2dd7bd6742125e2bcb18f943968dde27b10cfb')

DLAGENTS=('https::/usr/bin/curl -fLC - --cookie nada -o %o %u')

prepare() {
    cd "$srcdir"
    msg "If you continue you will accept the license, more information at http://processors.wiki.ti.com/index.php/Category:CCS_UniFlash."
    chmod +x ${pkgname}_${pkgver}.run
}

build() {
    ./${pkgname}_${pkgver}.run --unattendedmodeui none --mode unattended --debuglevel 4 --prefix "."
}

package() {
    cd "$srcdir"
    install -m755 -d $pkgdir/opt/ti/
    cp -R TICloudAgent $pkgdir/opt/ti/

    install -m 755 -d "$pkgdir/etc/udev/rules.d/"
    install -m 644 "61-msp430uif.rules" "$pkgdir/etc/udev/rules.d/61-msp430uif.rules"
    cd "$srcdir/TICloudAgent/install_scripts"
    install -m 644 -D "70-mm-no-ti-emulators.rules" "$pkgdir/etc/udev/rules.d/"
    install -m 644 -D "71-ti-permissions.rules" "$pkgdir/etc/udev/rules.d/"

    install -m 755 -d "$pkgdir/usr/share/applications/"
    install -m 644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
