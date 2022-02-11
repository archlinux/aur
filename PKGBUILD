# Maintainer: ChuJian <2474681296 at qq dot com>
# Contributor: jingutech
# Contributor: Bruce Zhang
pkgname=listen1-desktop
pkgver=2.21.7
pkgrel=1
listen1_commit=445b3293f62ccf45b514eca35fa14c63a051810f
pkgdesc="one for all free music in china (Build from source)"
arch=('x86_64' 'i686')
url="https://github.com/listen1/listen1_desktop"
license=('MIT')
depends=('electron13')
makedepends=('npm' 'git')
provides=('listen1')
conflicts=('listen1')
source=(
	"$pkgname-$pkgver.src.tar.gz::https://github.com/listen1/listen1_desktop/archive/v$pkgver.tar.gz"
	"git+https://github.com/listen1/listen1_chrome_extension.git#commit=$listen1_commit"
)
sha256sums=('babe1255bf1d74c261bb6d82fb94f2128c6f1a0b52220d2bbce5817e19bb0a7e'
            'SKIP')

prepare() {
	cd "${pkgname/-/_}-$pkgver"
	electronDist="\/usr\/lib\/electron13"
	electronVersion="tail /usr/lib/electron13/version"
	sed -i "s#\"productName\": \"Listen1\",/\"productName\": \"Listen1\",\"electronDist\": \"$electronDist\",\"electronVersion\": \"$electronVersion\",##" package.json
	rmdir app/listen1_chrome_extension
	cp -r "$srcdir/listen1_chrome_extension" app/listen1_chrome_extension
}

build() {
	cd "${pkgname/-/_}-$pkgver"
	npm install
	npm run dist:linux64 -- --dir
}

package() {
	cd "${pkgname/-/_}-$pkgver/dist/linux-unpacked"

	# Install asar file
	install -Dm644 resources/app.asar "$pkgdir/usr/share/listen1/app.asar"

	# Install start script
	echo "#!/usr/bin/env sh
exec /usr/lib/electron13/electron /usr/share/listen1/app.asar" > "$srcdir/listen1.sh"
	install -Dm755 "$srcdir/listen1.sh" "$pkgdir/usr/bin/listen1"

	# Install desktop file
	echo "[Desktop Entry]
Name=Listen1
Comment=One for all free music in China
Exec=/usr/bin/listen1
Terminal=false
Type=Application
Icon=listen1
StartupWMClass=Listen1
X-AppImage-Version=2.21.7
Categories=Utility;
X-AppImage-BuildId=1HvKDJ3EUJMJwm6YxKB8wQfQx3p
" > "$srcdir/listen1.desktop"
	install -Dm644 "$srcdir/listen1.desktop" "$pkgdir/usr/share/applications/listen1.desktop"

	# Install icons
	cd "$srcdir/${pkgname/-/_}-$pkgver/app/resources"
	install -Dm644 logo_16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/listen1.png"
	install -Dm644 logo_32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/listen1.png"
	install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/listen1.png"
	install -Dm644 logo512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/listen1.png"
}
