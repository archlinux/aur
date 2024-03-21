# Maintainer: Syhlx <syhlx@live.com>

pkgname=cromite-bin
pkgver=123.0.6312.58
pkgrel=1
_cromite_commit='f5d7de125b76b46401894105d589377b2d402249'
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
        LICENSE
        https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz)

source_x86_64=(https://github.com/uazo/cromite/releases/download/v${pkgver}-${_cromite_commit}/chrome-lin64.tar.gz)

sha256sums=('3ddf5b02a7eb51047770c608e23a51d7f70baf7920146c61dfc8c9c653d4e89a'
            '95ea4e28bc95c30200d832c075a04d79191110573f8bbebf881b81c4cef6c211'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a')
sha256sums_x86_64=('e71c67928757b19e19ab871d9d6c74bcece35d03bf72633fba8087f635f1fff1')

build() {
	make CHROMIUM_NAME=cromite -C chromium-launcher-$_launcher_ver
}

package() {
	cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" CHROMIUM_NAME=cromite install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cromite/LICENSE.launcher"

	cd ../chrome-lin

	strip --strip-unneeded chrome
	install -D chrome "$pkgdir/usr/lib/cromite/cromite"

	local toplevel_files=(
		chrome_100_percent.pak
		chrome_200_percent.pak
		resources.pak
		snapshot_blob.bin
		icudtl.dat
	)

	local toplevel_binaries=(
		chrome_crashpad_handler

		# Qt
		libqt5_shim.so
		libqt6_shim.so

		# ANGLE
		libEGL.so
		libGLESv2.so

		# Vulkan
		libvulkan.so.1

		# SwiftShader ICD
		libvk_swiftshader.so
	)

	strip --strip-unneeded "${toplevel_binaries[@]/#/}"
	cp -a "${toplevel_binaries[@]/#/}" "$pkgdir/usr/lib/cromite/"

	cp -a "${toplevel_files[@]/#/}" "$pkgdir/usr/lib/cromite/"
	install -Dm644 -t "$pkgdir/usr/lib/cromite/locales" locales/*.pak

	cd ..

	install -Dm644 cromite.desktop "$pkgdir/usr/share/applications/cromite.desktop"
	install -Dm644 cromite.png "$pkgdir/usr/share/icons/hicolor/192x192/apps/cromite.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cromite/LICENSE"
}
