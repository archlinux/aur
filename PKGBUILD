# Maintainer: Lubosz Sarnecki <lubosz at gmail dot com>
# Past Maintainer: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>

pkgname=siril-git
_gitname=siril
pkgver=0.9.12.2520.85ba0388
pkgrel=1
pkgdesc="An astronomical image processing software for Linux. (IRIS clone)"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'fftw' 'cfitsio' 'gsl' 'libconfig' 'opencv' 'exiv2' 'libheif' 'libraw')
makedepends=('intltool')
url="https://www.siril.org/"
optdepends=('libpng: PNG import'
'libjpeg: JPEG import and export'
'libtiff: TIFF import and export'
'ffms2: films native support as image sequences and import'
'libcurl-gnutls: online astrometry'
)
source=('git+https://gitlab.com/free-astro/siril.git')
sha1sums=('SKIP')
provides=($_gitname=$pkgver)
conflicts=($_gitname)
replaces=($_gitname)

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "%s.%s.%s" "$(git describe | cut -d "-" -f1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_gitname}"
	git submodule update --init --recursive
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "${_gitname}"
	make DESTDIR="${pkgdir}" install
	install -v -d ${pkgdir}/usr/share/applications/
	install -v -d ${pkgdir}/usr/share/mime/packages/
	install -v -m 644 platform-specific/linux/org.free_astro.siril.desktop ${pkgdir}/usr/share/applications/
	install -v -m 644 platform-specific/linux/siril.xml ${pkgdir}/usr/share/mime/packages/
}
