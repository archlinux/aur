# Maintainer: Aditya Mehra <aix.m@outlook.com>
# Prebuilt from the GitHub release: the driver is built in Valve's Steam Runtime SDK so it loads inside SteamVR's
# container on any distribution, which a build with the host's toolchain would not guarantee.
pkgname=riftlinux-bin
_pkgname=riftlinux
pkgver=0.1.5
pkgrel=1
pkgdesc="Oculus Rift CV1 driver for Linux (SteamVR and OpenXR): tracking, Touch, Auto-HDR, motion smoothing"
arch=('x86_64')
url="https://github.com/AIIX/RiftLinux"
license=('BSL-1.0' 'MPL-2.0' 'BSD-3-Clause' 'IJG' 'Zlib')
depends=('python' 'usbutils' 'rtkit' 'glibc' 'systemd-libs' 'libusb' 'dbus' 'vulkan-icd-loader' 'libdrm' 'libx11'
	'libxcb' 'wayland' 'sdl2' 'libglvnd' 'hicolor-icon-theme')
optdepends=('steam: SteamVR runs the driver'
	'libnotify: notifications from the RiftLinux Runtime app entry')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=riftlinux.install
options=('!strip' '!debug')
# License texts of the bundled libraries, from the release's tag (IJG comes with libjpeg-turbo's file in the package).
source=("$_pkgname-$pkgver-BSD-3-Clause.txt::https://raw.githubusercontent.com/AIIX/RiftLinux/v$pkgver/LICENSES/BSD-3-Clause.txt"
	"$_pkgname-$pkgver-Zlib.txt::https://raw.githubusercontent.com/AIIX/RiftLinux/v$pkgver/LICENSES/Zlib.txt")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('e11af671c491efac2f94c1d752bea92f4308ca2450c7d11e582e4b48c40e4de1'
	'bfb1112d49db5b1daecdfef24bd7e2f3ea0bafb33aa67aa0ab51e2bf8407c03d')
sha256sums_x86_64=('a18a5d0c3b8a8fce3c1d9abd6952de94ff39b088e2eaf4d3fc955dcb67e1cd66')

package() {
	# Not cp -a: the extracted files belong to the building user, the package's must belong to root.
	cp -dR --preserve=mode,timestamps "$srcdir/$_pkgname-$pkgver-$CARCH/root/." "$pkgdir/"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	ln -s "/usr/share/doc/$_pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
	ln -s "/usr/share/doc/$_pkgname/libjpeg-turbo-LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/libjpeg-turbo-LICENSE.md"
	install -Dm644 "$srcdir/$_pkgname-$pkgver-BSD-3-Clause.txt" "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause.txt"
	install -Dm644 "$srcdir/$_pkgname-$pkgver-Zlib.txt" "$pkgdir/usr/share/licenses/$pkgname/Zlib.txt"
}
