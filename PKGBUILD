# Maintainer: Troughy <troughyofficial at proton dot me>

pkgname=alvr-bin
_pkgname=${pkgname%-bin}
pkgver=20.14.1
pkgrel=1
pkgdesc="Experimental Linux version of ALVR. Stream VR games from your PC to your headset via Wi-Fi."
arch=('x86_64')
url="https://github.com/alvr-org/ALVR"
license=('MIT')
groups=()
depends=('vulkan-icd-loader' 'bash' 'hicolor-icon-theme' 'libpipewire')
makedepends=('tar' 'imagemagick')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/alvr-org/ALVR/releases/download/v$pkgver/${_pkgname}_streamer_linux.tar.gz"
		"${_pkgname}.png"
		"${_pkgname}.desktop")
md5sums=('3f3a849db25d490be0ed73483151f713'
         'cd2c37fd286efad87b679d50631ca3d7'
         'e4fd7a8205ee67e5a0c69ba0210a20c6')

prepare() {
	cd "$srcdir/${_pkgname}_streamer_linux"

	sed -i 's:../../../lib64/libalvr_vulkan_layer.so:libalvr_vulkan_layer.so:' share/vulkan/explicit_layer.d/alvr_x86_64.json
}

build() {
	cd "$srcdir/${_pkgname}_streamer_linux"

	for res in 16x16 32x32 48x48 64x64 128x128 256x256; do
		mkdir -p "icons/hicolor/${res}/apps/"
		magick "$srcdir/alvr.png" -thumbnail "${res}" -alpha on -background none -flatten "./icons/hicolor/${res}/apps/alvr.png"
	done
}

package() {
	cd "$srcdir/${_pkgname}_streamer_linux"
	
	install -Dm644 licenses/ALVR.txt -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 bin/alvr_dashboard -t "$pkgdir/usr/bin/"

	# vrcompositor wrapper
	install -Dm755 libexec/alvr/vrcompositor-wrapper "$pkgdir/usr/libexec/alvr/vrcompositor-wrapper"
	install -Dm644 libexec/alvr/alvr_drm_lease_shim.so "$pkgdir/usr/libexec/alvr/alvr_drm_lease_shim.so"

	# OpenVR Driver
	install -d "$pkgdir/usr/lib/alvr"
	cp -ar lib64/alvr/* "$pkgdir/usr/lib/alvr/"

	# Vulkan Layer
	install -Dm644 lib64/libalvr_vulkan_layer.so -t "$pkgdir/usr/lib/"
	install -Dm644 share/vulkan/explicit_layer.d/alvr_x86_64.json -t "$pkgdir/usr/share/vulkan/explicit_layer.d/"

	# Desktop
	install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

	# Icons
	install -d "$pkgdir/usr/share/icons/hicolor/"{16x16,32x32,48x48,64x64,128x128,256x256}/apps/
	cp -ar icons/* "$pkgdir/usr/share/icons/"

	# Firewall
	install -Dm644 libexec/alvr/ufw-alvr -t "$pkgdir/etc/ufw/applications.d/"

	install -Dm755 libexec/alvr/alvr_fw_config.sh -t "$pkgdir/usr/libexec/alvr/"
}
