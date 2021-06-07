# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>
# Maintainer: Kavplex Bot <kavplex@hunterwittenborn.com>

pkgname=termius-snap
pkgver=7.12.0
pkgrel=1
arch=("x86_64")
license=("custom")
depends=("libnotify" "libappindicator-gtk3" "libxtst" "nss" "libxss")
makedepends=('squashfs-tools')
conflicts=('termius' 'termius-app' 'termius-beta')

# Look at version_check.sh to see how these are generated
source=('termius.snap::https://api.snapcraft.io/api/v1/snaps/download/WkTBXwoX81rBe3s3OTt3EiiLKBx2QhuS_76.snap')
sha512sums=('8e550e8bca0ba425cf5298ea9f3f7c4fa81635a8ceb2dae173437b85ca748f3996d6b5a469806d3d4611851bdfcb93586c4b631e49a891bfca6cf4f0664009ef')

prepare() {
	unsquashfs termius.snap
}

package() {
	echo "Copying files"
	mkdir "${pkgdir}/opt/"
	cp -R "${srcdir}/squashfs-root/" "${pkgdir}/opt/termius-snap"
	
	echo "Placing extra files..."
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/"
	cp "${srcdir}/squashfs-root/meta/gui/icon.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/termius.png"
	
	mkdir -p "${pkgdir}/usr/share/applications/"
	cp "${srcdir}/squashfs-root/meta/gui/termius-app.desktop" "${pkgdir}/usr/share/applications/"
	
	echo "Patching .desktop file..."
	sed -i 's|Exec=.*|Exec=/opt/termius-snap/termius-app|' "${pkgdir}/usr/share/applications/termius-app.desktop"
	sed -i 's|Icon=.*|Icon=/usr/share/applications/hicolor/1024x1024/termius.png|' "${pkgdir}/usr/share/applications/termius-app.desktop"
}
