# Maintainer: Bruce Zhang
pkgname=markdown-electron
_name=Markdown-Electron
pkgver=1
pkgrel=1
pkgdesc="Electron version of Markdown app"
arch=('x86_64' 'i686')
url="https://github.com/JP1016/Markdown-Electron"
license=('MIT')
depends=('electron')
makedepends=('npm' 'jq' 'moreutils')
provides=('markdown-electron')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/JP1016/$_name/archive/$pkgver.tar.gz")
sha256sums=('47a1b8de58eafae21e5ecfc99553036e2d172fee26323950eb74a24c36e744d6')

prepare() {
	cd "$srcdir/$_name-$pkgver"

	local cache="$srcdir/npm-cache"
    local dist=/usr/lib/electron

    jq '.electronDist = $dist | .electronVersion = $version' \
        --arg dist "$dist" \
        --arg version "$(sed s/^v// $dist/version)" \
        electron-builder.json | sponge electron-builder.json

	export NG_CLI_ANALYTICS=1
    npm install --cache "$cache"
}

build() {
	cd "$srcdir/$_name-$pkgver"
	npm run electron:linux -- --dir
}

package() {
	cd "$srcdir/$_name-$pkgver/release/linux-unpacked/resources"
	install -Dm644 app.asar "$pkgdir/usr/share/$pkgname/app.asar"

	cd "$srcdir/$_name-$pkgver/dist"
	install -Dm644 favicon.256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
	install -Dm644 favicon.512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

	cd "$srcdir"
	echo "#!/bin/env sh
exec electron /usr/share/$pkgname/app.asar \$@
" > "$pkgname.sh"
	echo "[Desktop Entry]
Name=MarkdownEditor
Exec=/bin/$pkgname %U
Terminal=false
Type=Application
Icon=$pkgname
StartupWMClass=MarkdownEditor
X-AppImage-Version=6.1.0
Comment=Markdown editor by devzstudio
Categories=Utility;
" > "$pkgname.desktop"
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
