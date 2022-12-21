# Maintainer: Patrik Bachan  <patrikbachan@gmail.com>
_pkgname=lcd-image-converter
pkgname=lcd-image-converter-git
provides=('lcd-image-converter')
pkgver=r1776.4d43872
pkgrel=1
pkgdesc="Tool to create bitmaps and fonts for embedded applications. Tracking develop branch."
arch=('i686' 'x86_64')
url="http://www.riuson.com/lcd-image-converter"
license=('GPL')
depends=('qt5-declarative' 'hicolor-icon-theme' 'qt5-xmlpatterns' 'qt5-svg')
makedepends=('qt5-tools' 'desktop-file-utils' 'git')
source=("$_pkgname::git+https://github.com/riuson/lcd-image-converter.git#branch=develop"
        "$_pkgname.desktop")
sha1sums=('SKIP'
          'd64776983303a5defd3ee667d87a53c6b2995bbb')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  	)
}

build() {
	cd "$_pkgname"
	qmake
	make
}

package() {
	cd "$_pkgname"
	#make DESTDIR="$pkgdir/" install
	install -D "release/linux/output/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	
	# Install desktop shortcut
	desktop-file-install \
		--dir="${pkgdir}/usr/share/applications" \
		"${srcdir}/${_pkgname}.desktop"

	# Install pixmaps
	for i in 64 96; do
		install -Dm644 "resources/icons/$_pkgname-${i}.png" \
		"${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
	done
}
