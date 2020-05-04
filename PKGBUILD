# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=goverlay-git
pkgver=0.3.1.r16.g03bcfc9
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('gtk2')
makedepends=('git' 'lazarus')
checkdepends=('appstream')
optdepends=('mangohud: Configure MangoHUD'
            'vkbasalt: Configure vkBasalt'
            'mesa-demos: OpenGL preview'
            'vulkan-tools: Vulkan preview')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/benjamimgois/goverlay.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	make clean
}

build() {
	cd "$srcdir/${pkgname%-git}"
	lazbuild \
		--lazarusdir=/usr/lib/lazarus \
		--build-all \
		"${pkgname%-git}.lpi"
}

check() {
	cd "$srcdir/${pkgname%-git}"
#	appstreamcli validate --pedantic "data/${pkgname%-git}.metainfo.xml"
	make tests
}

package() {
	cd "$srcdir/${pkgname%-git}"
#	install -Dm755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
#	install -Dm644 "data/${pkgname%-git}.desktop" -t \
#		"$pkgdir/usr/share/applications"
#	install -Dm644 "data/${pkgname%-git}.metainfo.xml" -t \
#		"$pkgdir/usr/share/metainfo"

#	for icon_size in 128 256 512; do
#		icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
#		install -d $pkgdir/$icons_dir
#		install -m644 data/icons/${icon_size}x${icon_size}/${pkgname%-git}.png -t \
#			$pkgdir/$icons_dir
#	done
	make --prefix=/usr DESTDIR="$pkgdir/" install
}
