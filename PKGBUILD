# Maintainer: Syhlx <syhlx@live.com>

pkgname=cromite-bin
pkgver=143.0.7499.110
pkgrel=1
_cromite_commit='8e844cf64f8159a72f158eb33e2f09b19f7d115a'
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
        cromite.svg
        LICENSE
        https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz)

source_x86_64=(cromite-x86_64-v${pkgver}-${_cromite_commit}.tar.gz::https://github.com/uazo/cromite/releases/download/v${pkgver}-${_cromite_commit}/chrome-lin64.tar.gz)

sha256sums=('3ddf5b02a7eb51047770c608e23a51d7f70baf7920146c61dfc8c9c653d4e89a'
            'd4a1391331e7a3757f11e65ada488cb8729b612ba2a073b95dafee2f8f76dfa5'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a')
sha256sums_x86_64=('371437e2e08e28c33fa67e632f23462a73e13849b6f24fb8fbf276d640821cbc')

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
		chrome-wrapper
		resources.pak
		snapshot_blob.bin
		icudtl.dat
	)

	local toplevel_binaries=(
		chrome_sandbox
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
	install -Dm644 cromite.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/cromite.svg"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cromite/LICENSE"
}
