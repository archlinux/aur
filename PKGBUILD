# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
# Contributor: ganthern <https://github.com/ganthern>
pkgname=tutanota-desktop
pkgver=3.72.0
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('nss' 'libxss' 'libxtst' 'libappindicator-gtk3' 'libnotify')
makedepends=('npm')
source=("https://github.com/tutao/tutanota/archive/tutanota-release-$pkgver.tar.gz"
        '1928.patch'
        "$pkgname"
        "$pkgname.desktop")
sha256sums=('2d2fad61b85fec6398a4efaaf5aa23be3049fe632439ebaf01604ecc21662136'
            '614755f15fe792caf617829b19198d6a74b480436fea45568b315773c60a9ae6'
            '4f91e842bd92a3312943854383e4929f9baf6cb684a7027aa55edcce1bf4ca16'
            '1215678e2fc23cfbeb73063f68dc440891e5b2e10734fa7f402e06860c292e31')

prepare() {
	cd "${pkgname%-*}-${pkgname%-*}-release-$pkgver"

	# add builds w/o auto-updates and unpacked builds, close #1857
	patch -p1 -i "$srcdir/1928.patch"
}

build() {
	cd "${pkgname%-*}-${pkgname%-*}-release-$pkgver"
	npm install --cache "$srcdir/npm-cache"
	node dist -l --custom-desktop-release --unpacked
}

package() {
	cd "${pkgname%-*}-${pkgname%-*}-release-$pkgver"

	install -d "$pkgdir/opt/$pkgname"
	cp -r build/desktop/linux-unpacked/* \
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
