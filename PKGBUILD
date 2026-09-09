# Maintainer: Naxels <naxels at gmail dot com>

pkgname=plexamp-beta-appimage
pkgver=4.50.7
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
sha256sums_x86_64=('61064f5d5d7b2b89bfe0031b0f259a116eb1e5442c3052648cdabb80e495b026')
sha256sums_aarch64=('64fe1a50134ea403d7770aa101be569f1f144602aa7824940c9924d7c0764922')


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
