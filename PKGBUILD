# Maintainer: Feakster <feakster at posteo dot eu>

### Info ###
pkgname=simplenote-electron-arm-bin
_pkgname=${pkgname%-electron-arm-bin}
pkgver=2.8.0
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
b2sums_armv7h=('bcbe6cf9fd8fa6710dd5a0843211cdf0de73833cfe940fcfa96a5bebe9c4c98e7a32ed5cfc27ccdc3fc9120b3cb77ea5929374f77a3c6e0239fe450aca711cf6')
b2sums_aarch64=('f80a3258192ddef1d96e99579efc8da62c5869b85d23534d885090f19a8704f704f2f5e845c35426ea87e16d5cdceb3a992f10fe1ad8490b23a066faf9674579')

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
