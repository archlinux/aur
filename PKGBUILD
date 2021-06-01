# Maintainer: Feakster <feakster at posteo dot eu>

### Info ###
pkgname=simplenote-electron-arm-bin
_pkgname=${pkgname%-electron-arm-bin}
pkgver=2.12.0
_appimage="simplenote-electron-${pkgver}-${CARCH}.AppImage"
pkgrel=1
pkgdesc='The simplest way to keep notes'
arch=('armv7h' 'aarch64')
url='https://github.com/Automattic/simplenote-electron'
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme' 'libxss' 'mesa' 'nss')
optdepends=(
	'libnotify: desktop notifications'
	'noto-fonts-emoji: emoji support'
	'ttf-joypixels: emoji support'
)
makedepends=('zlib')
provides=('simplenote')
options=(!strip)
source_armv7h=("simplenote-electron-${pkgver}-armv7h.AppImage"::"${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-armv7l.AppImage")
source_aarch64=("simplenote-electron-${pkgver}-aarch64.AppImage"::"${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-arm64.AppImage")
noextract=("${source[@]%%::*}")
b2sums_armv7h=('54b1b48941742cb6978348101bdd277994fbabcef8ec08bfd58c3721789868f1c2accb8ab409fae48fb140df3624db2a8583cddfe0a42029ae6a110bbd203502')
b2sums_aarch64=('9cf802ddae6b119ca7361d20ebb44d61e8bf461a9068bb52ea2f0061cea7490e63b6655577dbc7cc34aa2effe1265ee6cfbce5fa1e53a57b7b835a6b50b5e209')

### Prepare ###
prepare() {
	## Change Directory ##
	cd "$srcdir"

	## Mark AppImage as Executable ##
	chmod a+x $_appimage

	## Extract AppImage into squashfs-root Directory ##
	./$_appimage --appimage-extract

	## Remove Unneccessary Files ##
	rm squashfs-root/{.DirIcon,AppRun,$_pkgname.png}

	## Fix Permissions ##
	find squashfs-root -type d -exec chmod 0755 {} \;
	find squashfs-root -type f -name '*.so' -exec chmod 0755 {} \;

	## Modify Desktop File ##
	sed -i \
	-e "s|^Exec=AppRun$|Exec=${_pkgname}|" \
	-e '/^TryExec=.*/d' \
	-e '/^X-AppImage-Version=.*/d' \
	squashfs-root/${_pkgname}.desktop
	echo "TryExec=/opt/${_pkgname}/${_pkgname}" >> squashfs-root/${_pkgname}.desktop
}

### Package ###
package() {
	## Move AppImage Contents to /opt/$_pkgname ##
	install -dm0755 "$pkgdir"/opt/$_pkgname
	cp -RT "$srcdir"/squashfs-root "$pkgdir"/opt/$_pkgname

	## SUID Sandbox ##
	chmod 4755 "$pkgdir"/opt/$_pkgname/chrome-sandbox

	## Executable Binary ##
	install -dm0755 "$pkgdir"/usr/bin
	ln -fs \
	/opt/$_pkgname/$_pkgname \
	"$pkgdir"/usr/bin/$_pkgname

	## Replace Shared Objects with Symlinks ##
	for SO in EGL GLESv2 vulkan
	do
		ln -fs \
		/usr/lib/lib${SO}.so \
		"$pkgdir"/opt/$_pkgname/lib${SO}.so
	done

	## Install Icons ##
	for SIZE in 16 32 48 64 128 256 512 1024
	do
		install -dm0755 "$pkgdir"/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps
		ln -fs \
		/opt/$_pkgname/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${_pkgname}.png \
		"$pkgdir"/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${_pkgname}.png
	done

	## Desktop Icon ##
	install -dm0755 "$pkgdir"/usr/share/applications
	ln -fs \
	/opt/$_pkgname/${_pkgname}.desktop \
	"$pkgdir"/usr/share/applications/${_pkgname}.desktop

	## Licenses ##
	install -dm0755 "$pkgdir"/usr/share/licenses/$pkgname
	ln -fs \
	/opt/$_pkgname/LICENSE.electron.txt \
	"$pkgdir"/usr/share/licenses/$pkgname/LICENSE.electron.txt
	ln -fs \
	/opt/$_pkgname/LICENSES.chromium.html \
	"$pkgdir"/usr/share/licenses/$pkgname/LICENSES.chromium.html
}
