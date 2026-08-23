# Submitter:   Anatol Pomozov <anatol.pomozov@gmail.com>
# Maintainer:  nltimv <git at nltimv dot com>
# Contributor: Charles Dong <charlesdong_2000@outlook.com>

pkgname=seatools-bin
_pkgname=SeaTools
pkgdesc='Seagate graphical user interface (GUI) tool for managing hard drives and SSDs on a system.'
pkgver=5.2.5
pkgrel=2
_pkgrealver=$pkgver
arch=('x86_64')
url='http://www.seagate.com/support/downloads/seatools/'
license=('LicenseRef-Seagate-EULA')
depends=('gcc-libs')
makedepends=('fakechroot')
provides=("seatools=${pkgver}")
conflicts=('seatools')
replaces=('seatools<=5.2.5')
_installer_bin="SeaTools-${pkgver}-linux-x64-installer.run"
source=(
    "SeaTools-${pkgver}-${pkgrel}.zip::https://www.seagate.com/content/dam/seagate/migrated-assets/www-content/support-content/downloads/seatools/_shared/downloads/${_pkgname}LinuxX64Installer.zip"
    "seatools_documentation.pdf::https://www.seagate.com/content/dam/seagate/migrated-assets/www-content/support-content/downloads/seatools/_shared/downloads/100869623_B.pdf"
    "seatools_eula.pdf::https://www.seagate.com/content/dam/seagate/assets/legal/end-user-license-agreements/eula_single_user_final_15_06_2026_us_english.pdf"
)
sha256sums=('c4823485939a221d690a75430fdae22ca1796a451235c1c1b686019aa7f2325c'
            'SKIP'
            'SKIP')

package() {
    echo "Seatools version: ${_pkgrealver}"

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
    cp $pkgdir/opt/SeaTools5/$_pkgname.desktop $pkgdir/usr/share/applications/ || true
    echo 'done'

    echo -ne 'Post-installation operations... '
    # No need to be executable
    chmod -x $pkgdir/usr/share/applications/$_pkgname.desktop
    # Remove fake /tmp
    rm -rf $pkgdir/tmp

    # Remove uninstaller
    rm $pkgdir/opt/SeaTools5/uninstall "$pkgdir/opt/SeaTools5/Uninstall SeaTools.desktop" $pkgdir/opt/SeaTools5/uninstall.dat
    
    # Create symlink to /usr/bin/SeaTools
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/SeaTools5/SeaTools $pkgdir/usr/bin/SeaTools
    
    # Install documentation
    mkdir -p $pkgdir/usr/share/doc/seatools
    cp seatools_documentation.pdf $pkgdir/usr/share/doc/seatools/SeaTools.pdf
    
    # Install license
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -Dm644 seatools_eula.pdf $pkgdir/usr/share/licenses/$pkgname/EULA.pdf
    
    echo 'done'
}
