# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=majsoul-plus
pkgver=2.0.0b7
_pkgver=${pkgver/b/-beta.}
pkgrel=1
pkgdesc="Majsoul browser, with more features"
arch=('x86_64' 'i686')
url="https://github.com/MajsoulPlus/majsoul-plus"
license=('AGPL3')
depends=('electron')
makedepends=('yarn' 'moreutils' 'jq' 'imagemagick')
source=("https://github.com/MajsoulPlus/majsoul-plus/archive/v$_pkgver.tar.gz")
sha256sums=('acbb8d13d460f86c37d55d856cc97709206a741c8661a835f2430ac4848d0733')
conflicts=("majsoul-plus-bin")

prepare() {
	cd "$pkgname-$_pkgver"
	targetArch="x64"
	if [ "$CARCH" == "i686" ]; then
		targetArch="ia32"
	fi
	electronDist="\/usr\/lib\/electron"
    electronVersion=$(tail -1 /usr/lib/electron/version)
    sed -i "s|\"electron\": \".*|\"electron\": \"$electronVersion\",|" package.json
    jq '.build.linux.target = ["dir"]' package.json | sponge package.json
    jq ".build.electronDist = \"$electronDist\"" package.json | sponge package.json
    jq ".build.electronVersion = \"$electronVersion\"" package.json | sponge package.json

	yarn
}

build() {
	cd "$pkgname-$_pkgver"
	yarn build
}

package() {
	targetArch="x64"
	if [ "$CARCH" == "i686" ]; then
		targetArch="ia32"
	fi

	cd "$pkgname-$_pkgver"
	mkdir -p "$pkgdir/usr/share/majsoul-plus"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"

	cd "build/linux-unpacked/resources"
	install -Dm644 app.asar "$pkgdir/usr/share/majsoul-plus/app.asar"

	for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p "$target"
        convert "$srcdir/$pkgname-$_pkgver/assets/bin/icons/icon.png" -resize ${size}x${size} "$target/majsoul-plus.png"
    done

	echo "#!/usr/bin/env bash
exec electron --enable-logging /usr/share/majsoul-plus/app.asar" > "$srcdir/majsoul-plus.sh"
	install -Dm755 "$srcdir/majsoul-plus.sh" "$pkgdir/usr/bin/majsoul-plus"

	echo "[Desktop Entry]
Name=Majsoul Plus
Name[zh_CN]=雀魂 Plus
GenericName[zh_CN]=雀魂 Plus
Comment=Majsoul Plus Browser
Comment[zh_CN]=一款设计用于雀魂麻将的 PC 专用浏览器
Exec=majsoul-plus %U
Terminal=false
Type=Application
Icon=majsoul-plus
Categories=Game;" > "$srcdir/majsoul-plus.desktop"
	install -Dm644 "$srcdir/majsoul-plus.desktop" "$pkgdir/usr/share/applications/majsoul-plus.desktop"
}
