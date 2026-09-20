# Maintainer: Naxels <naxels at gmail dot com>

pkgname=plexamp-beta-appimage
pkgver=4.50.17
pkgrel=1
pkgdesc="Modern music client for Plex BETA with new backend"
provides=('plexamp')
conflicts=('plexamp' 'plexamp-appimage')
arch=('x86_64' 'aarch64')
depends=('fuse2')
url="https://plexamp.com"
options=(!strip)
_desktop_name=Plexamp.desktop
_filename=Plexamp-${pkgver}-${CARCH}.AppImage
source_x86_64=(
  https://plexamp.plex.tv/desktop/${_filename}
)
source_aarch64=(
  https://plexamp.plex.tv/desktop/${_filename}
)
sha256sums_x86_64=('95b3b878b77636113d2d60914ba0e3ef5dc352d614144786a6691d8053be3b22')
sha256sums_aarch64=('aa5b030b31957d100fae40e3b4ddf6472bd4a6506bdf5ac918980008a15a4286')


prepare() {
	cd "$srcdir"
	rm -rf squashfs-root
	chmod +x $_filename
	./$_filename --appimage-extract
	sed -i -e "s|Exec=.\+|Exec=env LD_PRELOAD=/usr/lib/libwayland-client.so APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/Plexamp.AppImage --disable-seccomp-filter-sandbox|" squashfs-root/${_desktop_name}
}

package() {
	echo "Starting install"
	install -Dm755 $_filename "$pkgdir"/usr/bin/Plexamp.AppImage
	echo "Installing desktop launch file to $pkgdir/usr/bin/Plexamp.AppImage"
	install -Dm755 squashfs-root/${_desktop_name} "$pkgdir"/usr/share/applications/${_desktop_name}
	echo "Installing icons"
	for res in "32x32" "128x128" "256x256@2"; do
		install -Dm644 squashfs-root/usr/share/icons/hicolor/$res/apps/Plexamp.png $pkgdir/usr/share/icons/hicolor/$res/apps/Plexamp.png
	done
}
