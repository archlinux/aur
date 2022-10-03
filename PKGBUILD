# Submitter: Anatol Pomozov <anatol.pomozov@gmail.com>
# Maintainer: Charles Dong <charlesdong_2000@outlook.com>

pkgname=seatools
pkgdesc='Seagate graphical user interface (GUI) tool for managing hard drives and SSDs on a system.'
pkgver=5.0.165
pkgrel=3
arch=('x86_64')
url='http://www.seagate.com/support/downloads/seatools/'
license=('custom:Seagate EULA')
depends=('gcc-libs')
makedepends=('fakechroot')
source=("https://www.seagate.com/files/www-content/support-content/downloads/${pkgname}/_shared/downloads/SeaToolsLinuxX64Installer.zip")
sha256sums=('64149fdc8ef6d84818873bcda10c8c3684bf38c627f1c2c3fcd64fb89c857b33')

_pkgname=SeaTools
_installer_bin=SeaToolsLinuxX64Installer.run

package() {
    echo -ne 'Preparing fake installation environment... '
    # Move installer to fake root
    mv ./$_installer_bin $pkgdir
    chmod u+x $pkgdir/$_installer_bin
    # Create necessary directories (to cheat the installer)
    mkdir -p $pkgdir/tmp $pkgdir/opt $pkgdir/etc $pkgdir/usr/share/applications
    echo 'done'

    echo -ne 'Installing to fake environment... '
    # Use the installer in the fake root
    fakechroot chroot $pkgdir /$_installer_bin --mode unattended
    echo 'done'

    echo -ne 'Removing installer... '
    # Remove installer file
    rm $pkgdir/$_installer_bin
    echo 'done'

    # Help the installer finish the unsuccessful operation (mitigating solution)
    echo -ne 'Mitigating copy operation... '
    mv $pkgdir/opt/SeaTools5/$_pkgname.desktop $pkgdir/usr/share/applications
    echo 'done'

    echo -ne 'Post-installation operations... '
    # No need to be executable
    chmod -x $pkgdir/usr/share/applications/$_pkgname.desktop
    # Remove fake /tmp
    rm -rf $pkgdir/tmp

    # Remove uninstaller
    rm $pkgdir/opt/SeaTools5/uninstall "$pkgdir/opt/SeaTools5/Uninstall SeaTools.desktop" $pkgdir/opt/SeaTools5/uninstall.dat
    echo 'done'
}