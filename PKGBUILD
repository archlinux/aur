# Maintainer: Nikita Sivakov <cryptomaniac.512@gmail.com>
# Contributor: Nikita Sivakov <cryptomaniac.512@gmail.com>

pkgname=xf86-input-egalax
pkgver=2.5.5814
pkgrel=2
_reldate=20151022
pkgdesc="Touchscreen driver for eGalax (eeti) devices"
arch=('i686' 
      'x86_64')
url="http://home.eeti.com.tw/drivers_Linux.html"
license=('custom:EULA')
groups=('xorg-input-drivers')
depends=('linux' 
         'libpng12' 
         'gksu' 
         'alsa-lib' 
         'hicolor-icon-theme')
optdepends=('xorg-server')
backup=(etc/eGTouchL.ini)
install='xf86-input-egalax.install'
#http://home.eeti.com.tw/touch_driver/Linux/20141009/eGTouch_v2.5.4330.L-x.zip
source=("eGTouch_v${pkgver}.L-x.tar.gz::http://home.eeti.com.tw/touch_driver/Linux/${_reldate}/eGTouch_v${pkgver}.L-x.tar.gz" 
        "eGalaxConfig.desktop" 
        "eGTouchD.service"
        "eGTouchD.conf")
md5sums=('fb29252cd9ebf3a4ebd1530e4946f092'
         '0ee99c83fd74bdb8357427eae9b2dc7d' 
         'a52c4c1682ee196a6bbffe4768154a92'
         'c9284fbcf2bdaec8d3eea21f6b7be34d')

_architect="32"
[ "$CARCH" = "x86_64" ] && _architect="64"

package() {
    if [ -d /etc/modules-load.d ]; then
        _modules="modules-load.d"
    else
        _modules="modprobe.d"
    fi

    mkdir -p \
        "$pkgdir/etc/X11/xorg.conf.d" \
        "$pkgdir/etc/$_modules" \
        "$pkgdir/usr/lib/systemd/system/" \
        "$pkgdir/usr/share/eGTouch/sample" \
        "$pkgdir/usr/share/applications" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps" \
        "$pkgdir/usr/share/licenses/$pkgname" \
        "$pkgdir/usr/bin" || return 1

    cd $srcdir/eGTouch_v${pkgver}.L-x/eGTouch${_architect}/eGTouch${_architect}withX

    install -D -m755 eGTouchU $pkgdir/usr/bin
    install -D -m755 eGTouchD $pkgdir/usr/bin
    install -D -m755 eCalib $pkgdir/usr/bin
    install -D -m755 eGTouchL.ini $pkgdir/etc

    cd $srcdir/eGTouch_v${pkgver}.L-x/Rule

    install -D -m644 52-egalax-virtual.conf $pkgdir/etc/X11/xorg.conf.d
    install -D -m644 eGTouchU.png $pkgdir/usr/share/icons/hicolor/scalable/apps

    install -D -m755 serio_raw.sh $pkgdir/usr/share/eGTouch/sample

    cd $srcdir/eGTouch_v${pkgver}.L-x

    install -D -m644 EULA.pdf $pkgdir/usr/share/licenses/$pkgname
    install -D -m644 "EETI_Declaration_and_Disclaimer.pdf" $pkgdir/usr/share/licenses/$pkgname

    cd $srcdir/eGTouch_v${pkgver}.L-x/Guide

    # install -D -m644 "EETI_eGTouch_Utility_Guide_for Linux_v1.03.pdf" $pkgdir/usr/share/eGTouch
    # install -D -m644 "EETI_eGTouch_Linux_Programming_Guide_v2.5h.pdf" $pkgdir/usr/share/eGTouch

    install -D -m644 GetEvent.c $pkgdir/usr/share/eGTouch/sample

    cd $srcdir/

    install -D -m755 eGalaxConfig.desktop $pkgdir/usr/share/applications
    install -D -m755 eGTouchD.service $pkgdir/usr/lib/systemd/system
    install -D -m755 eGTouchD.conf $pkgdir/etc/$_modules
}
