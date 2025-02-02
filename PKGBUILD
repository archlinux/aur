# Maintainer: teackot <teackot at gmail dot com>
_prjname=MControlCenter
pkgname=mcontrolcenter-bin
pkgver=0.5.0
pkgrel=2
pkgdesc='An application that allows you to change the settings of MSI laptops'
arch=('x86_64')
url='https://github.com/dmitry-s93/MControlCenter'
license=('GPL3')
depends=('qt6-base' 'hicolor-icon-theme')
source=(https://github.com/dmitry-s93/$_prjname/releases/download/${pkgver}/${_prjname}-${pkgver}-bin.tar.gz)
b2sums=('d567aab2aa8bee8d89109845758b459ddf4b67d7d8ddf951308a6c8c78cd3a989a0f34d148751061764df8185661802e12428d2c7326e844a7689a7084328b9f')
provides=('mcontrolcenter')
conflicts=('mcontrolcenter')

prepare() {
    echo "ec_sys" > $pkgname-kmod.conf
    echo "options ec_sys write_support=1" > $pkgname-opts.conf
}

package() {
    _binname=mcontrolcenter

    # load ec_sys on boot
    install -Dm644 $pkgname-kmod.conf $pkgdir/usr/lib/modules-load.d/$_binname.conf

    # set ec_sys options
    install -Dm644 $pkgname-opts.conf $pkgdir/usr/lib/modprobe.d/$_binname.conf
    
    cd "$_prjname-$pkgver-bin/app/"
    install -Dm755 $_binname $pkgdir/usr/bin/$_binname
    install -Dm644 $_binname.desktop $pkgdir/usr/share/applications/$_binname.desktop
    install -Dm644 $_binname.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$_binname.svg
    install -Dm755 $_binname-helper $pkgdir/usr/libexec/$_binname-helper
    install -Dm644 $_binname-helper.conf $pkgdir/usr/share/dbus-1/system.d/$_binname-helper.conf
    install -Dm644 $_binname.helper.service $pkgdir/usr/share/dbus-1/system-services/$_binname.helper.service
}

