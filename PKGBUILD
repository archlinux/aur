# Maintainer: Bruce Zhang
pkgname=rubick
pkgver=0.0.12
pkgrel=1
pkgdesc='Based on electron open source toolbox, free integration of rich plug-ins, to create the ultimate desktop efficiency tool'
arch=('x86_64')
url='https://github.com/rubickCenter/rubick'
license=('MIT')
depends=('electron11')
makedepends=('yarn' 'npm')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/rubickCenter/rubick/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('79cef0df250cdcfb984afb3bacd408c7123024055720d709200ce1d624b86046')

prepare() {
	local cache="$srcdir/.cache"
	export YARN_CACHE_FOLDER="$cache"
	cd "$pkgname-$pkgver"
	yarn
}

build() {
	cd "$pkgname-$pkgver"
	yarn rebuild_linux
	yarn build --linux --dir
}

package() {
	cd "$pkgname-$pkgver"

	# Create startup script
	echo "#!/usr/bin/env sh
exec electron11 /usr/lib/rubick/app.asar \$@
" > "$srcdir/rubick.sh"

	echo "[Desktop Entry]
Name=Rubick2
Exec=/usr/bin/rubick --no-sandbox %U
Terminal=false
Type=Application
Icon=rubick2
StartupWMClass=rubick2
X-AppImage-Version=0.0.12
Comment=Based on electron open source toolbox, free integration of rich plug-ins, to create the ultimate desktop efficiency tool
Categories=Utility;
" > "$srcdir/rubick.desktop"

	# Install resources
	install -Dm644 "build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/rubick/app.asar"
	cp -r "build/linux-unpacked/resources/app.asar.unpacked" "$pkgdir/usr/lib/rubick/"
	install -Dm755 "$srcdir/rubick.sh" "$pkgdir/usr/bin/rubick"
	install -Dm644 "$srcdir/rubick.desktop" "$pkgdir/usr/share/applications/rubick.desktop"
	install -Dm644 "build/icons/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/rubick2.png"
}
