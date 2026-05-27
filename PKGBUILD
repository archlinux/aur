# Maintainer: Lucas van Leijen <lvanl at tuta dot io>
# Maintainer: tee < teeaur at duck dot com >
# Maintainer: mcck < m.ckk at tuta dot io >

pkgname=appflowy-bin
_pkgname=appflowy
pkgver=0.12.0
pkgrel=3
pkgdesc="AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations."
arch=(x86_64)
url="https://appflowy.io"
license=('AGPL-3.0-only')
provides=('appflowy')
conflicts=('appflowy')
depends=('gtk3' 'libkeybinder3' 'libnotify' 'xdg-user-dirs' 'gst-plugins-base-libs' 'zstd')
optdepends=('kdialog: For file picker on KDE plasma'
	'zenity: bash dialog boxes')
_src="https://github.com/AppFlowy-IO/AppFlowy"
source=(
    "$_src/raw/$pkgver/LICENSE"
    "$_src/releases/download/$pkgver/AppFlowy-$pkgver-linux-$arch.deb")
b2sums=('6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237'
        '168fddb076926f3ecd617dcb1ad786c3e9da7c3571746ae31c94f51dfc4633d7b329d39b12da59dc87d2eec3712d4565c3c29fdbee545a726b415795d2852a23')

package(){
    cd "$pkgdir"
    tar --zstd -xf "$srcdir"/data.tar.zst

	install -Dm644 "$srcdir"/LICENSE -t "usr/share/licenses/$_pkgname"
    sed -i "s;Icon=.*;Icon=appflowy;" "usr/share/applications/AppFlowy.desktop"
	install -Dm644 "usr/lib/AppFlowy/data/flutter_assets/assets/images/flowy_logo.svg" \
        "usr/share/icons/hicolor/scalable/apps/appflowy.svg"
	install -Dm644 "usr/lib/AppFlowy/data/flutter_assets/assets/images/flowy_logo.svg" \
        "usr/share/pixmaps/appflowy.svg"
	install -dm755 "usr/bin"

	ln -s "/usr/lib/AppFlowy/AppFlowy" -t "usr/bin/"

	# Clean-up stray dot-files
	echo "Removing stray dot‑files from the package root…"
	find "$pkgdir" -mindepth 1 -maxdepth 1 -name ".*" -exec rm -rf {} + && echo "... dot‑files removed."
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
