# Maintainer: Posi <posi1981@gmail.com>

# Contributor: Bruce Zhang
pkgname=cpod
_name=CPod
_nodeversion=8.16.1
pkgver=1.28.2
pkgrel=1
pkgdesc="A simple, beautiful podcast app for Windows, macOS, and Linux."
arch=('x86_64' 'i686')
url="https://github.com/z-------------/CPod"
license=('Apache-2.0')
depends=('electron2')
makedepends=('yarn' 'jq' 'moreutils' 'nvm' 'gulp' 'python2')
provides=('cpod')
conflicts=('cpod-bin' 'cpod-git')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/z-------------/$_name/archive/v$pkgver.tar.gz")
sha256sums=('aac8f4d5ba63a45141442c265252e52a65906eca8d2e449f859dd8dadf390485')

prepare() {
	cd "$_name-$pkgver"
    electronVersion=$(tail -1 /usr/lib/electron2/version)
    sed -i "s|\"electron\": \".*|\"electron\": \"$electronVersion\",|" package.json
	source /usr/share/nvm/init-nvm.sh
	nvm install "$_nodeversion"
	nvm use "$_nodeversion"
	yarn
}

build() {
	cd "$_name-$pkgver"
	gulp
	yarn run pack
	source /usr/share/nvm/init-nvm.sh
	nvm deactivate
	nvm uninstall "$_nodeversion"
}

package() {
	cd "$srcdir/$_name-$pkgver/dist/linux-unpacked/resources"
	install -Dm644 app.asar "$pkgdir/usr/share/cpod/app.asar"

	cd "$srcdir/$_name-$pkgver/build/icons"
	for file in *x*.png; do
		install -Dm644 "$file" "$pkgdir/usr/share/icons/hicolor/${file%.png}/apps/cpod.png"
	done
	cd "$srcdir/$_name-$pkgver/build"
	install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/cpod.svg"

	echo "#!/bin/env sh
exec electron2 /usr/share/cpod/app.asar \$@" > "$srcdir/cpod.sh"
	install -Dm755 "$srcdir/cpod.sh" "$pkgdir/usr/bin/cpod"

	echo "[Desktop Entry]
Name=CPod
Comment=A simple, beautiful podcast app.
Exec=/usr/bin/cpod %U
Terminal=false
Type=Application
Icon=cpod
Categories=Audio;AudioVideo;" > "$srcdir/cpod.desktop"
	install -Dm644 "$srcdir/cpod.desktop" "$pkgdir/usr/share/applications/cpod.desktop"
}

