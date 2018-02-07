# Maintainer: Martin Kröning <m dot kroening at hotmail dot germantld>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
pkgname=sync-my-l2p
pkgver=2.3.0
pkgrel=1
pkgdesc="Sync the L2P of RWTH Aachen University"
arch=('x86_64')
url="https://github.com/RobertKrajewski/Sync-my-L2P"
license=('LGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
options=('!strip')
source=("$url/releases/download/v$pkgver/SyncMyL2P-$pkgver-linux.AppImage"
'sync-my-l2p.desktop.diff')
noextract=('SyncMyL2P-$pkgver-linux.AppImage'
'sync-my-l2p.desktop.diff')
sha256sums=('b1fb5fb354864a59be09837e4d44c6e213ec61fa41b0e6df4c3a7229fbccfd1a'
            '9fa15afce0c4c367341935f2ff1731b9cbac0e0a32df931356a15a3711f4a82d')

prepare() {
	# Extract Appimage
	chmod +x SyncMyL2P-$pkgver-linux.AppImage
	./SyncMyL2P-$pkgver-linux.AppImage --appimage-extract &> /dev/null
	
	# Patch desktop file
	patch squashfs-root/Sync-my-L2P.desktop sync-my-l2p.desktop.diff > /dev/null
}

package() {
	# Install desktop file
	install -Dm755 squashfs-root/Sync-my-L2P.desktop "$pkgdir"/usr/share/applications/sync-my-l2p.desktop

	# Install icons
	for size in 16 32 48 128; do
		install -Dm755 squashfs-root/hicolor/${size}x${size}/apps/sync-my-L2P.png \
			"$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/sync-my-l2p.png
	done

	# Install bin
	install -Dm755 squashfs-root/usr/bin/Sync-my-L2P "$pkgdir"/usr/bin/sync-my-l2p
}
