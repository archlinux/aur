# Maintainer: SoftExpert <softexpert at gmail dot com>
pkgname=lightning-image-viewer-git
pkgver=0.3.0.r0.g6674155
pkgrel=1
pkgdesc='Fast and lightweight desktop image viewer'
arch=(aarch64 armv7h i686 pentium4 x86_64)
url='https://github.com/shatsky/lightning-image-viewer/'
license=(GPL-3.0-only)
depends=(
	# As reported by namcap
	glibc
	libexif
	hicolor-icon-theme
	sdl3
	sdl3_image
)
makedepends=(
	gcc
)
provides=(lightning-image-viewer)
conflicts=(
	lightning-image-viewer
	lightning-image-viewer-bin
)
options=(
	!emptydirs # Remove empty directories from package because why not
)
source=(
	"lightning-image-viewer::git+https://github.com/shatsky/lightning-image-viewer.git"
)
b2sums=('SKIP')

pkgver() {
	cd "${srcdir}/lightning-image-viewer/"
	# The tags don't belong to a branch so we have to get the latest tag across all branches
	git describe --long --tags --abbrev=7 "$(git rev-list --tags --max-count=1)" |
		sed -e 's/^v//' -e 's/-\([[:digit:]]\+\)-\(g[[:alnum:]]\{7\}\)$/.r\1.\2/' -e 's/-/./g'
}

build() {
	export SDL_VER="3.2.8"
	export SDL_IMAGE_VER="3.2.4/"
	export LIBEXIF_VER="0.6.25"
	export DEBIAN_FRONTEND="noninteractive"
	# try to mitigate some namcap complaints
	#export CFLAGS='-L-zrelro -L-znow'

	mkdir -p "${srcdir}/lightning-image-viewer/build/"
	gcc -DWITH_LIBEXIF lightning-image-viewer/src/viewer.c -lSDL3 -lSDL3_image -lexif -lm -o lightning-image-viewer/build/lightning-image-viewer
}

package() {
	install -Dm755 \
		"${srcdir}/lightning-image-viewer/build/lightning-image-viewer" \
		"${pkgdir}/usr/bin/lightning-image-viewer"
	cp -a \
		"${srcdir}/lightning-image-viewer/share/" \
		"${pkgdir}/usr/share/"
}
