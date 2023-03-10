# Maintainer: teackot <teackot at gmail dot com>
_prjname=MControlCenter
pkgname=mcontrolcenter-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='An application that allows you to change the settings of MSI laptops'
arch=('x86_64')
url='https://github.com/dmitry-s93/MControlCenter'
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=(https://github.com/dmitry-s93/$_prjname/releases/download/${pkgver}/${_prjname}-${pkgver}-bin.tar.gz)
b2sums=('7aea529be439885dcf16dcfdb5666ca07758b41e068c91da1d3f2e202a98283616cfefbd25154592f825d8a956f54a550e9c0f7f4639c79c4079bac401561347')

prepare() {
    echo "ec_sys" > $pkgname-kmod.conf
    echo "options ec_sys write_support=1" > $pkgname-opts.conf
}

package() {
    _binname=mcontrolcenter

    # load ec_sys on boot
    install -Dm644 $pkgname-kmod.conf $pkgdir/etc/modules-load.d/$_binname.conf

    # set ec_sys options
    install -Dm644 $pkgname-opts.conf $pkgdir/etc/modprobe.d/$_binname.conf
    
    cd "$_prjname-$pkgver-bin/app/"
    install -Dm755 $_binname $pkgdir/usr/bin/$_binname
    install -Dm644 $_binname.desktop $pkgdir/usr/share/applications/$_binname.desktop
    install -Dm644 $_binname.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$_binname.svg
    install -Dm755 $_binname-helper $pkgdir/usr/libexec/$_binname-helper
    install -Dm644 $_binname-helper.conf $pkgdir/usr/share/dbus-1/system.d/$_binname-helper.conf
    install -Dm644 $_binname.helper.service $pkgdir/usr/share/dbus-1/system-services/$_binname.helper.service
}

