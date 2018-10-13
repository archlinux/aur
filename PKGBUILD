# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Bazon <bazonbloch@arcor.de>

pkgname=activtools
pkgver=5.17.14
pkgrel=1
pkgdesc="Includes activmanager, activcalibrate, activremote and activmonitor.
 You must install activtools if you want to use ActivInspire with Promethean
 hardware. You do not need activtools if you just want to run ActivInspire 
 Personal Edition."
arch=('i686' 'x86_64')
url="https://support.prometheanworld.com/product/activdriver"
license=('unknown')
depends=('qt4')

optdepends=('activinspire: activboard presentation')
source_x86_64=(http://activsoftware.co.uk/linux/repos/driver/ubuntu/pool/non-oss/a/activtools/activtools_$pkgver-0~Ubuntu~1604_amd64.deb activinspire-restart.desktop)
source_i686=(http://activsoftware.co.uk/linux/repos/driver/ubuntu/pool/non-oss/a/activtools/activtools_$pkgver-0~Ubuntu~1604_i386.deb activinspire-restart.desktop)

md5sums_i686=('314d782256db4b6090c755d9af720dd4'
              'fe9981eca6b2e3299f3a7ed908a6b83d')
md5sums_x86_64=('4d8daf99cbf6aaeaab69009e60b2f230'
                'fe9981eca6b2e3299f3a7ed908a6b83d')

package() {
	# extract archive
        bsdtar -C "$pkgdir" -xf data.tar.xz

        # move out of the local directory to match arch standards
        mv "$pkgdir"/usr/local/* "$pkgdir"/usr/
        rmdir "$pkgdir"/usr/local

        # activmgr works only when started after board is attached, so no autostart. 
        # Delete the following line if you want an autostart of activmgr
        cd "$pkgdir"
	rm -r etc

	sed -i '/LD_LIBRARY_PATH/d' usr/bin/activmgr.sh

        echo " "
        echo "when activtools is installed, activinspire needs to be killed before it can restart"
        #(if you know how to fix: please tell!)
        echo "therefore, a second launcher to restart activinspire is created (inspire-restart)"
        cd "$pkgdir"/usr/bin
        touch inspire-restart
        chmod a+x inspire-restart
        echo "#!/bin/bash" > inspire-restart
        echo "killall inspire Inspire ; inspire \"\$1\"" >> "$pkgdir"/usr/bin/inspire-restart
        echo " "
        echo "activcalibrate has to be closed by Alt+F4 or get killed after the last calibration-point."
        echo " "
}
