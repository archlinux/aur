# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Artem Vasilev <artem.vasilev@rwth-aachen.de>
# Contributor: gardenapple <mailbox@appl.garden>

pkgname=duckstation-qt-bin
_pkgname="${pkgname%-bin}"
_fullname=org.duckstation.DuckStation
pkgver=0.1.r11752
pkgrel=1
pkgdesc="Fast PlayStation 1 emulator for PC and Android"
arch=('x86_64')
url='https://github.com/stenzek/duckstation'
license=('CC-BY-NC-ND-4.0')
provides=("$_pkgname" 'duckstation')
conflicts=("$_pkgname" 'duckstation')
depends=('hicolor-icon-theme' 'mesa' 'glibc' 'libstdc++' 'libgcc' 'fontconfig' 'libsm' 'libice' 'wayland' 'bash')
options=('!strip')
source=("${_pkgname}-${pkgver}-x64.AppImage::https://github.com/stenzek/duckstation/releases/download/v${pkgver/.r/-}/DuckStation-x64.AppImage"
	"${_pkgname}-${pkgver}-x64-SSE2.AppImage::$url/releases/download/v${pkgver/.r/-}/Duckstation-x64-SSE2.AppImage")
sha256sums=('169a7dd2c37731780eb3729cbe16f048fff3e3b6ef9c9f499869dc1174899a54'
            'da3bc2f7d849c948e32b94a1d9e12b5615d280466a0540b541e9b0204fb5e779')

package() {
	cd "$srcdir"
	if grep -E "sse4_1|sse4_2" /proc/cpuinfo >/dev/null
	then

		chmod 755 "$srcdir/${_pkgname}-${pkgver}-x64.AppImage"
		"$srcdir/${_pkgname}-${pkgver}-x64.AppImage" --appimage-extract
	else
		chmod 755 "$srcdir/${_pkgname}-${pkgver}-x64-SSE2.AppImage"
		"$srcdir/${_pkgname}-${pkgver}-x64-SSE2.AppImage" --appimage-extract
	fi
	install -Dm644 "squashfs-root/${_fullname}.png" -t "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
	install -Dm644 "squashfs-root/${_fullname}.desktop" -t "$pkgdir/usr/share/applications"
	install -d "$pkgdir/opt"
	cp -avR squashfs-root/ "$pkgdir/opt/$_pkgname"
	cat <<- EOF > "${_pkgname}.sh"
		#!/usr/bin/env sh
		cd /opt/$_pkgname && ./AppRun "\$@"
	EOF
	install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/$_pkgname"
	find "$pkgdir/opt/$_pkgname" -type d -exec chmod 755 {} +
	cd "$pkgdir/opt/$_pkgname"
	rm $_fullname.desktop $_fullname.png .DirIcon
}
