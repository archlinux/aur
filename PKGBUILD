# Maintainer:  Malstrond <malstrond@gmail.com>
# Contributor: Jose Riha <jose1711@gmail.com>
# Contributor: Bazon <bazonbloch@arcor.de>

pkgname=activtools
pkgver=5.18.19
pkgrel=2
pkgdesc="Tools for Promethean hardware: activmanager, activcalibrate, activremote, activmonitor."
arch=('x86_64')
url="https://support.prometheanworld.com/product/activdriver"
license=('unknown')
#libQt5WebView.so?
depends=('nss' 'pcre' qt5-{base,imageformats,x11extras,location,declarative,webchannel,webengine,websockets})
makedepends=('binutils' 'patchelf')
optdepends=('activinspire: Prometheans presentation software'
            'activdriver: Driver for Promethean hardware'
            'qt5-wayland')
source=("http://activsoftware.co.uk/linux/repos/driver/ubuntu/pool/non-oss/a/${pkgname}/${pkgname}_$pkgver-0~Ubuntu~1804_amd64.deb")
md5sums=('460a49108127cd9c532d3b9ccc2a23d1')

prepare() {
	bsdtar -xf data.tar.xz
}

build() {
	mv usr/local/* usr
	#Drop Qt5 symbol version
	patchelf --remove-rpath usr/bin/activmgr $(nm -D usr/bin/activmgr|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
	#todo: drop insecure RPATH (use namcap)
	rm -r usr/bin/{imageformats,platforms,xcbglintegrations,qtwebengine*,QtWebEngineProcess,icudtl.dat} usr/share/promethean/lib
	ln -sf /usr/lib/libactivsystem.so usr/lib/libactivsystem.so.2.4
	ln -sf /usr/lib/libactivsystem.so usr/lib/libactivsystem.so.2.4.0
	ln -sf /usr/lib/libclassflowclient.so usr/lib/libclassflowclient.so.1.0
	ln -sf /usr/lib/libclassflowclient.so usr/lib/libclassflowclient.so.1.0.0
# activmgr works only when started after the ActivBoard is attached, so no autostart.
# Delete the following line if you want an autostart of activmgr.
	rm -r etc/xdg
}

package() {
	mv usr "$pkgdir"/usr
	mv etc "$pkgdir"/etc
 # These tools attempt to create a lockfile in /var/Promethean, the path is hardcoded.
 # Since they are started by the user, this directory needs to be world-writable, even if that's a bad idea.
 	install -dm0777 "$pkgdir"/var/Promethean
 # activcalibrate attemps to store calibration information in /etc/promethean/calibration, the path is hardcoded.
 # Since it is started by the user, this directory needs to be world-writable, even if that's a bad idea.
 	install -dm0777 "$pkgdir"/etc/promethean/calibration

 echo "Promethean software has a bug that often causes it to hang when attempting to close it using the GUI."
 echo "This means you need to manually kill activcalibrate.sh after you finished calibration."
 echo "Use ALT+F4, your desktop environments method, killall, or start it using the timeout command."
}
