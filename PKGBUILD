# Maintainer: ABOhiccups <https://twitter.com/ABOhiccups>
pkgname=project-plus-netplay
pkgver=2.29
pkgrel=2
pkgdesc="A Mod of Super Smash Bros. Brawl with Netplay."
arch=('x86_64')
url="https://projectplusgame.com/"
license=('GPL')
depends=('alsa-lib' 'bluez-libs' 'cairo' 'curl' 'enet' 'ffmpeg' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'hidapi' 'libevdev' 'libpng' 'libpulse' 'libsm' 'libusb' 'libx11' 'libxi' 'libxrandr' 'libxxf86vm' 'lzo' 'mbedtls' 'miniupnpc' 'official-gamecube-controller-adapter-rules' 'pango' 'sfml' 'systemd-libs' 'zlib')
makedepends=('cmake' 'git' 'qt5-base')
optdepends=('pulseaudio: PulseAudio backend')
options=('!strip')
_url="https://github.com/jlambert360/FPM-AppImage/releases"
_package="Faster_Project_Plus-x86-64.AppImage"
_launcher="Launcher.tar.gz"
_sd="ProjectPlusSd$pkgver.tar.gz"
source=(
	"$_package::$_url/download/v$pkgver/$_package"
	"$_launcher::$_url/download/v$pkgver/$_launcher"
	"$_sd::$_url/download/v$pkgver/$_sd"
)
md5sums=('74ab044274d9dd85116e074ced75f4ba'
	'909b062d9236cbbc5f51de9a402eda41'
	'cdebf3f50af8d5b6e0b252509a02466b')

prepare() {
	chmod +x "$srcdir/$_package"
	$srcdir/$_package --appimage-extract
}

package() {
	install -Dm755 "$_package" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/ishiiruka.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -dm644 "$pkgdir/usr/share/applications"
	printf "[Desktop Entry]\nVersion=$pkgver\nName=Project+ Netplay\nComment=A Mod of Super Smash Bros. Brawl with Netplay.\nPath=/usr/bin\nExec=project-plus-netplay\nIcon=project-plus-netplay\nType=Application\nCategories=Game\nKeywords=project+;brawl;netplay\n" > "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -d "$pkgdir/$HOME/Documents/Project+ Netplay/Games"
	touch "/$pkgdir/$HOME/Documents/Project+ Netplay/Games/Place Brawl ISO here"
	cp -R "Launcher" "$pkgdir/$HOME/Documents/Project+ Netplay"
	chown -R "$USER" "$pkgdir/$HOME/Documents/Project+ Netplay"
	install -d "$pkgdir/$HOME/.config/FasterPPlus"
	printf "[General]\nShowLag = False\nShowFrameCount = False\nISOPaths = 2\nRecursiveISOPaths = False\nNANDRootPath = \nDumpPath = \nWirelessMac = \nWiiSDCardPath = $HOME/.local/share/FasterPPlus/Wii/sd.raw\nISOPath0 = $HOME/Documents/Project+ Netplay/Games\nISOPath1 = $HOME/Documents/Project+ Netplay/Launcher" > "$pkgdir/$HOME/.config/FasterPPlus/Dolphin.ini"
	chown -R "$USER" "$pkgdir/$HOME/.config/FasterPPlus"
	install -D "ProjectPlusSd$pkgver.raw" "$pkgdir/$HOME/.local/share/FasterPPlus/Wii/sd.raw"
	chown -R "$USER" "$pkgdir/$HOME/.local/share/FasterPPlus"
}