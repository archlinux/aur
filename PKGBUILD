# $Id$
# Maintainer: notvidya <transient.sepia // at // gmail dot com>
# Contributor: physkets <physkets // at // tutanota dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Filippo 'JoeyrS' Civiletti <joeyrs@gmail.com>

pkgname=armagetronad-experimental-bin
_pkgname=armagetronad-experimental
_pkgname2=armagetronad
pkgver=0.4.0.alpha.z5876
pkgrel=1
pkgdesc='A Tron Clone in 3D.'
arch=('x86_64')
url='https://www.armagetronad.org'
license=('GPL')
depends=()
provides=($_pkgname)
conflicts=('armagetronad-git')

_package_id="192925708"
_download_url="https://gitlab.com/armagetronad/armagetronad/-/package_files/$_package_id/download"
_target="ArmagetronExperimental.AppImage"
_squashfs_root="squashfs-root"

source=(
    "$_target::$_download_url"
    "$_pkgname.bash"
)
sha256sums=(
    'b403620e006982bf1df575ce59f71e1d5e0cf04a91c2429cbd1c65160237e3ff'
    '3557d1037871700f2008e23913570b77b1ba232f669875df10dc81be80710b25'
)

prepare() {
    echo -ne 'Extracting the AppImage... '
    rm -rf $_squashfs_root
    chmod +x $_target
    ./$_target --appimage-extract &>/dev/null
    find $_squashfs_root -type d -exec chmod g+rX,a+rX {} \;
    chmod +x $_squashfs_root/AppRun
    echo 'done'
}

package() {
    mkdir -p $pkgdir/opt/$_pkgname
    cp -rf ./$_squashfs_root $pkgdir/opt/$_pkgname
    install -Dm644 ./$_squashfs_root/org.$_pkgname2.$_pkgname.desktop -t $pkgdir/usr/share/applications
    for directory in 16x16 32x32 48x48 64x64 128x128; do
      install -Dm644 ./$_squashfs_root/usr/share/games/$_pkgname/desktop/icons/$directory/$_pkgname2.png $pkgdir/usr/share/icons/hicolor/$directory/apps/org.$_pkgname2.$_pkgname.png
    done
    install -Dm755 ./$_pkgname.bash $pkgdir/usr/bin/$_pkgname
}
