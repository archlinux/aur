# Maintainer: Patrik Bachan  <patrikbachan@gmail.com>
pkgname=lcd-image-converter
pkgver=r1689.030b30d
pkgrel=1
pkgdesc="Tool to create bitmaps and fonts for embedded applications"
arch=('i686' 'x86_64')
url="http://www.riuson.com/lcd-image-converter"
license=('GPL')
#groups=()
depends=('qt5-declarative' 'hicolor-icon-theme' 'qt5-xmlpatterns' 'qt5-svg')
makedepends=()
source=("$pkgname::git+https://github.com/riuson/lcd-image-converter.git"
        "$pkgname.desktop")
sha1sums=('SKIP'
          'd64776983303a5defd3ee667d87a53c6b2995bbb')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  	)
}

build() {
	cd "$pkgname"
	qmake
	make
}

package() {
	cd "$pkgname"
	#make DESTDIR="$pkgdir/" install
	install -D "release/linux/output/$pkgname" "$pkgdir/usr/bin/$pkgname"
	
	# Install desktop shortcut
	desktop-file-install \
		--dir="${pkgdir}/usr/share/applications" \
		"${srcdir}/${pkgname}.desktop"

	# Install pixmaps
	for i in 64 96; do
		install -Dm644 "resources/icons/$pkgname-${i}.png" \
		"${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
	done
}
