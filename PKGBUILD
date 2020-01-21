# Maintainer: Bruce Zhang
pkgname=ppet
_name=PPet
pkgver=1.0.0
pkgrel=2
pkgdesc='给你的桌面添加一点趣味~'
arch=('x86_64')
url="https://github.com/zenghongtu/PPet"
license=('MIT')
depends=('electron')
makedepends=('yarn' 'jq' 'moreutils')
conflicts=("$pkgname-bin")
source=("$pkgname-$pkgver.src.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('164575f10253867f34b135fa3e84e3d81bdbb2c896d7425ea12cb44da99f9c7c')

prepare() {
	cd "$srcdir/$_name-$pkgver"
	local electron_dist='/usr/lib/electron'
	local electron_version=$(tail -1 "$electron_dist/version")
	local yarn_cache="$srcdir/yarn_cache"

	jq '.build.electronDist = $dist | .build.electronVersion = $version | .devDependencies.electron = $version' \
        --arg dist "$electron_dist" \
        --arg version "$electron_version" \
        package.json | sponge package.json

	jq '.electronWebpack.staticSourceDirectory = $static' \
		--arg static "static" \
		package.json | sponge package.json

	sed -i 's#CmdOrCtrl+r#CmdOrCtrl+R#' src/main/ppetTray.ts

    export YARN_CACHE_FOLDER="$yarn_cache"
    yarn
}

build() {
	cd "$srcdir/$_name-$pkgver"
	yarn dist:dir
}

package() {
	cd "$srcdir/$_name-$pkgver/dist/linux-unpacked/resources"
	install -Dm644 app.asar "$pkgdir/usr/share/ppet/app.asar"

	cd static/icons/png
	for file in *x*.png; do
		install -Dm644 "$file" "$pkgdir/usr/share/icons/hicolor/${file%.png}/apps/ppet.png"
	done

	cd "$srcdir"
	echo "#!/usr/bin/env sh
exec electron /usr/share/ppet/app.asar \$@
" > "$srcdir/ppet.sh"
	echo "[Desktop Entry]
Name=PPet
Exec=/usr/bin/ppet %U
Terminal=false
Type=Application
Icon=ppet
StartupWMClass=PPet
Comment=给你的桌面添加一点趣味~
Categories=Development;
" > "$srcdir/ppet.desktop"

	install -Dm755 "$srcdir/ppet.sh" "$pkgdir/usr/bin/ppet"
	install -Dm644 "$srcdir/ppet.desktop" "$pkgdir/usr/share/applications/ppet.desktop"
}
