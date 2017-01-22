# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=pillarsofeternity-thewhitemarch2-gog
pkgver=2.5.0.6
pkgrel=1
pkgdesc="Part 2 of The White March expansion to Pillars of Eternity"
arch=("any")
url="https://www.gog.com/game/pillars_of_eternity_the_white_march_expansion_pass"
license=("custom:commercial")
options=("!emptydirs")
depends=("pillarsofeternity-gog")
source=("gog_pillars_of_eternity_white_march_part_2_dlc_${pkgver}.sh::file://gog_pillars_of_eternity_white_march_part_2_dlc_${pkgver}.sh")
sha256sums=("ee0252373adeb38bf742fb2f53d08c1acc2827eb22605432c52d4b8443203b4b")

# Disable compression of the package
PKGEXT=".pkg.tar"

prepare() {
    ln -s "data/noarch/" "$srcdir/pe"
    # Remove duplicate/conflicting file from Part 1
    rm "$srcdir/pe/game/PillarsOfEternity_Data/assetbundles/prefabs/objectbundle/px1_cre_blight_ice_terror.unity3d"
}

package() {
    # Data
    install -m755 -d "$pkgdir/opt/pillarsofeternity-gog/game"
    # Hardlink files to save the disk space and time spent copying them (they are large)
    cp -Ral -t "$pkgdir/opt/pillarsofeternity-gog/game/" "$srcdir/pe/game/PillarsOfEternity_Data"
    find "$pkgdir/opt/pillarsofeternity-gog/game/PillarsOfEternity_Data" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/pillarsofeternity-gog/game/PillarsOfEternity_Data" -type f -print0 | xargs -0 chmod 644

    #
    # System integration
    #

    # License
    install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "/opt/pillarsofeternity-gog/docs/End User License Agreement.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA"
}
