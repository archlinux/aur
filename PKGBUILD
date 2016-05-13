# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Bazon <bazonbloch@arcor.de>
pkgname=activtools
pkgver=5.10.15
pkgrel=1
pkgdesc="Includes activmanager, activcalibrate, activremote and activmonitor.
 You must install activtools if you want to use ActivInspire with Promethean
 hardware. You do not need activtools if you just want to run ActivInspire 
 Personal Edition."
arch=('i686' 'x86_64')
url="http://activsoftware.co.uk/linux/repos/ubuntu/dists/precise/Release"
license=('unknown')
if [ "$CARCH" = "i686" ]; then
  _arch='i386'
  _md5sum='748d75db8520778572dbada9f004e547'
  depends=('qt4' 'libudev.so.0')
else
  _arch='amd64'
  _md5sum='c7e54948cc6d38c71a8e70e123d7c200'
  depends=('qt4' 'libudev.so.0' 'lib32-libudev.so.0' 'lib32-glibc<2.21')
fi
optdepends=('activinspire: activboard presentation')
source=(http://activsoftware.co.uk/linux/repos/ubuntu/pool/non-oss/a/activtools/activtools_$pkgver-1~ubuntu~1204_$_arch.deb)
md5sums=( $_md5sum )

package() {
        # extract the archive
        bsdtar -xf data.tar.gz -C "$pkgdir"

        # move out of the local directory to match arch standards
        mv "$pkgdir"/usr/local/* "$pkgdir"/usr/
        rmdir "$pkgdir"/usr/local

        #activmgr works only when started after board is attached, so no autostart. 
        #Delete the follwing line if you want an autostart of activmgr
        cd "$pkgdir"
	rm -r etc

        #activcalibrate needs libactivboardex.so.1 instead of libactivboardex.so.1.0 
        #(and needs to be killed after last calibration point with Alt+F4)
        #(if you know how to fix: please tell!)
	cd "$pkgdir"/usr/lib
	ln -s libactivboardex.so.1.0 libactivboardex.so.1 
        if [ "$CARCH" = "x86_64" ]; then
            cd "$pkgdir"/usr/lib32    libactivboardex.so.1.0
            ln -s libactivboardex.so.1.0 libactivboardex.so.1 
        fi

        echo " "
        echo "when activtools is installed, activinspire needs to be killed before it can restart"
        #(if you know how to fix: please tell!)
        echo "therefore, a second launcher to restart activinspire is created (inspire-restart)"
        cd "$pkgdir"/usr/bin
        touch inspire-restart
        chmod a+x inspire-restart
        echo "#! /bin/bash" > inspire-restart
        echo "killall inspire Inspire ; inspire \"\$1\"" >> "$pkgdir"/usr/bin/inspire-restart

        cd "$pkgdir"/usr/share/applications/
        echo "[Desktop Entry]" > activinspire-restart.desktop
        echo "Name=ActivInspire (restart)" >> activinspire-restart.desktop
        echo "Comment=Promethean ActivInspire - restart needed when using activtools" >> activinspire-restart.desktop
        echo "Exec=/usr/bin/inspire-restart" >> activinspire-restart.desktop
        echo "Icon=/usr/share/icons/hicolor/512x512/apps/inspire.ico" >> activinspire-restart.desktop
        echo "Terminal=false" >> activinspire-restart.desktop
        echo "Encoding=UTF-8" >> activinspire-restart.desktop
        echo "Type=Application" >> activinspire-restart.desktop
        echo "Categories=Education;Promethean;Applications;" >> activinspire-restart.desktop
        echo "MimeType=application/x-asstudio;" >> activinspire-restart.desktop
        echo "StartupNotify=false" >> activinspire-restart.desktop

        echo " "
        echo "activcalibrate has to be closed by Alt+F4 or get killed after the last calibration-point."
        echo " "
}
