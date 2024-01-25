# Maintainer: Syhlx <syhlx@live.com>

pkgname=cromite-bin
pkgver=121.0.6167.101
pkgrel=1
_cromite_commit='a2939070ae135da07dc1d3730f20a5b5dd68481c'
_launcher_ver=8
pkgdesc='Cromite a Bromite fork with ad blocking and privacy enhancements (binary release)'
arch=(x86_64)
url=https://github.com/uazo/cromite
license=(GPL3)
depends=(alsa-lib
         gtk3
         libxss
         nss
         ttf-font)
optdepends=('cups: Printer support'
            'pipewire: WebRTC desktop sharing under Wayland'
            'libnotify: Native notification support'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'libgnome-keyring: Enable GNOME keyring support'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'kdialog: support for native dialogs in Plasma'
            'qt5-base: enable Qt5 with --enable-features=AllowQt')
provides=('cromite')
conflicts=('cromite')
options=(!strip)
source=(cromite.desktop
        cromite.png
        https://raw.githubusercontent.com/uazo/cromite/v${pkgver}-${_cromite_commit}/LICENSE
        https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz)

source_x86_64=(https://github.com/uazo/cromite/releases/download/v${pkgver}-${_cromite_commit}/chrome-lin64.tar.gz)

sha256sums=('3ddf5b02a7eb51047770c608e23a51d7f70baf7920146c61dfc8c9c653d4e89a'
            '95ea4e28bc95c30200d832c075a04d79191110573f8bbebf881b81c4cef6c211'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a')
sha256sums_x86_64=('93299bc93b30dc12e59471c873145808b95318145ada4f1c316bd6eca3c9e4c0')

build() {
	make CHROMIUM_NAME=cromite -C chromium-launcher-$_launcher_ver
}

package() {
	cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" CHROMIUM_NAME=cromite install
  install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

	cd ../chrome-lin

	install -D chrome "$pkgdir/usr/lib/cromite/cromite"

	local toplevel_files=(
		chrome_100_percent.pak
		chrome_200_percent.pak
		chrome_crashpad_handler
		libqt5_shim.so
		libqt6_shim.so
		resources.pak
		snapshot_blob.bin
		icudtl.dat

		# ANGLE
		libEGL.so
		libGLESv2.so

		# Vulkan
		libvulkan.so.1

		# SwiftShader ICD
		libvk_swiftshader.so
	)

	cp -a "${toplevel_files[@]/#/}" "$pkgdir/usr/lib/cromite/"
	install -Dm644 -t "$pkgdir/usr/lib/cromite/locales" locales/*.pak

	cd ..

	install -Dm644 cromite.desktop "$pkgdir/usr/share/applications/cromite.desktop"
	install -Dm644 cromite.png "$pkgdir/usr/share/icons/hicolor/192x192/apps/cromite.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cromite/LICENSE"
}
