# Maintainer: Aditya Mehra <aix.m@outlook.com>
pkgname=rift-home
pkgver=0.1.0
pkgrel=1
pkgdesc="A VR desktop for the Oculus Rift CV1 on RiftLinux: your apps as windows in a room around you"
arch=('x86_64')
url="https://github.com/AIIX/RiftHome"
license=('Apache-2.0' 'CC-BY-4.0' 'BSL-1.0' 'CC0-1.0' 'LicenseRef-BlendKit-Royalty-Free')
depends=('riftlinux' 'qt6-base' 'qt6-declarative' 'wlroots0.20' 'wayland' 'libxkbcommon' 'pixman' 'libdrm' 'openxr'
	'vulkan-icd-loader' 'libglvnd' 'polkit' 'glib2' 'dbus' 'xorg-xwayland' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'wayland-protocols' 'vulkan-headers' 'shaderc' 'libxcb')
optdepends=('mpv: HDR video player'
	'firefox: web browser with HDR video'
	'xdg-desktop-portal-gtk: file dialogs in the login session'
	'networkmanager: Network settings'
	'bluez-utils: Bluetooth settings'
	'libpulse: Sound settings (pactl)'
	'libnotify: messages from the desktop menu entry'
	'kde-cli-tools: keeps the desktop awake while Rift Home runs from the desktop'
	'steam: games and SteamVR apps')
# The release's own source tarball (the same files as the tag's archive, with a checksum that never changes).
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7baf2012a4953a55e5bbc96ff18369b0ebc6f7b1aa882b5a9420888f9d750ca1')

build() {
	cmake -S "RiftHome-$pkgver" -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

check() {
	QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "RiftHome-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "RiftHome-$pkgver/LICENSES/"*.txt
}
