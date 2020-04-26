# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com> 
# Software Vendor: Harrison Consoles <mixbus@harrisonconsoles.com>

pkgname=harrison-xt
appname=mixbus-plugins
pkgver=6.0.702
pkgrel=1
pkgdesc="Harrison XT LV2 Plugins"
arch=('x86_64')
url="http://harrisonconsoles.com/site/${appname}.html"
license=('EULA, GPLv2')
groups=('lv2-plugins' 'pro-audio')
depends=('glibc' 'xorg-server')

prepare() {
## Setup XT Plugins for installation
_archive="`xdg-user-dir DOWNLOAD`/Mixbus-$pkgver-Linux-64bit-gcc5.tar"
if [ -f ${_archive} ]; then
	ln -srf ${_archive} "$srcdir/`basename ${_archive}`"
	msg2 "Unpacking Installer..."
	tar -xf ${_archive}
	./Mixbus-$pkgver-$(uname -m)-gcc5.run --tar xf
	tar -xf $srcdir/Mixbus_$(uname -m)-$pkgver.tar
elif [ -f ${_archive/Mixbus/Mixbus32C} ]; then
    ln -srf ${_archive/Mixbus/Mixbus32C} "$srcdir/`basename ${_archive/Mixbus/Mixbus32C}`"
    msg2 "Unpacking Installer..."
    tar -xf ${_archive/Mixbus/Mixbus32C}
	./Mixbus32C-$pkgver-$(uname -m)-gcc5.run --tar xf
    tar -xf $srcdir/Mixbus32C_$(uname -m)-$pkgver.tar
else
	msg2 "Please download a copy from https://harrisonconsoles.com/site/${appname}.html. Then put the `basename ${_archive}` in the `xdg-user-dir DOWNLOAD` directory."
    exit 1
fi
}

package() {
## Create Base Directory
mkdir -p ${pkgdir}/usr/lib/lv2

## Copy Harrison XT Plugins
for plugin in 3D BC DC DM DS EG EQ GV LC MC ME MG SC SP TG VC; do
    if [ -f ${srcdir}/Mixbus_$(uname -m)-$pkgver ]; then
		cp -r ${srcdir}/Mixbus_$(uname -m)-$pkgver/lib/LV2/XT-${plugin}.lv2 ${pkgdir}/usr/lib/lv2
	elif [ -f ${srcdir}/Mixbus32C_$(uname -m)-$pkgver ]; then
		cp -r ${srcdir}/Mixbus32C_$(uname -m)-$pkgver/lib/LV2/XT-${plugin}.lv2 ${pkgdir}/usr/lib/lv2
	fi
done
    
## Package has built successfully message
msg2 "Package Built Successfully!!"

## License Install Message
msg2 "Install licenses to ${HOME} to unlock plugins"
}
