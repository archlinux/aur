# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
pkgname=tutanota-desktop
pkgver=3.69.5
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('nss' 'libxss' 'libxtst' 'libappindicator-gtk3' 'libnotify')
makedepends=('npm')
source=("https://github.com/tutao/tutanota/archive/tutanota-release-$pkgver.tar.gz"
        "$pkgname"
        "$pkgname.desktop")
sha256sums=('2369e8339d2ca382d95a34077eb697d824e1395155cf8b649d53159844894009'
            '4f91e842bd92a3312943854383e4929f9baf6cb684a7027aa55edcce1bf4ca16'
            '1215678e2fc23cfbeb73063f68dc440891e5b2e10734fa7f402e06860c292e31')

prepare() {
	cd "${pkgname%-*}-${pkgname%-*}-release-$pkgver"

	# Change target to dir instead of AppImage
	sed -i 's/"target": "AppImage"/"target": "dir"/g' \
		buildSrc/electron-package-json-template.js

	# Disable removing distDir
	sed -i '65d' buildSrc/DesktopBuilder.js
}

build() {
	cd "${pkgname%-*}-${pkgname%-*}-release-$pkgver"
	npm install --cache "$srcdir/npm-cache"
	node dist -l prod
}

package() {
	cd "${pkgname%-*}-${pkgname%-*}-release-$pkgver"

	install -d "$pkgdir/opt/$pkgname"
	cp -r build/dist/installers/linux-unpacked/* \
		"$pkgdir/opt/$pkgname"

	install -Dm755 "$srcdir/$pkgname" -t "$pkgdir/usr/bin"

	for icon_size in 64 512; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir$icons_dir
		install -m644 resources/desktop-icons/icon/${icon_size}.png \
			$pkgdir$icons_dir/$pkgname.png
	done

	install -Dm644 "$srcdir/$pkgname.desktop" -t \
		"$pkgdir/usr/share/applications"
}
