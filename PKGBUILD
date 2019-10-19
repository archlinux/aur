# Maintainer: ccat3z <c0ldcat3z@gmail.com>
# Contributor: bruceutut <zttt183525594@gmail.com>

pkgname=insomnia-src
_name=insomnia
pkgver=7.0.3
pkgrel=1
pkgdesc="Cross-platform HTTP and GraphQL Client (Build from source)"
arch=('x86_64' 'i686')
url="https://github.com/getinsomnia/insomnia"
license=('MIT')
depends=('electron3')
provides=("$_name")
conflicts=("$_name")
source=("$_name-$pkgver.src.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ef76a43ee734a26ba98f7aba3ca59b5e1417995ba9a80c6c1dcb106248872dd0')

prepare() {
	cd "$_name-$pkgver/packages/insomnia-app"

	# Make electron version to match community/electron
	electronV=$(electron3 --version)
	electronVer=${electronV#v}
    electronDist=$(dirname $(realpath $(which electron3)))
	sed -i "/\"electron\": \"/c\\\"electron\": \"$electronVer\"," package.json

	# Edit electron builder config
	sed -i 's/"AppImage",//' .electronbuilder
	sed -i 's/"deb",//' .electronbuilder
	sed -i 's/"tar.gz",//' .electronbuilder
	sed -i 's/"snap",//' .electronbuilder
	sed -i 's/"rpm"/"dir"/' .electronbuilder
	sed -i "s#\"appId\": \"com.insomnia.app\",#\"appId\": \"com.insomnia.app\",\"electronDist\": \"${electronDist}\",#" .electronbuilder
}

build() {
	cd "$_name-$pkgver"
	npm run bootstrap
	npm run app-package
}

package() {
	cd "$srcdir/$_name-$pkgver/packages/insomnia-app/dist/linux-unpacked"

	# Install asar files
	install -Dm644 resources/app.asar "$pkgdir/usr/share/insomnia/app.asar"
	install -Dm644 resources/bin/yarn-standalone.js "$pkgdir/usr/share/insomnia/bin/yarn-standalone.js"

	cd "$srcdir/$_name-$pkgver/packages/insomnia-app/build"

	# Install start script
	echo "#!/usr/bin/env sh
exec electron3 /usr/share/insomnia/app.asar \$@
" > "$srcdir/insomnia.sh"
	install -Dm755 "$srcdir/insomnia.sh" "$pkgdir/usr/bin/insomnia"

	# Install desktop file
	echo "[Desktop Entry]
Name=Insomnia
Comment=Debug APIs like a human, not a robot
Exec=insomnia %U
Terminal=false
Type=Application
Icon=insomnia
MimeType=x-scheme-handler/insomnia;
Categories=Development;
" > "$srcdir/insomnia.desktop"
	install -Dm644 "$srcdir/insomnia.desktop" "$pkgdir/usr/share/applications/insomnia.desktop"

	# Install icons
	cd icons
	for size in 16 32 48 128 256 512; do
        install -Dm644 ${size}x${size}.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/insomnia.png"
    done
}
