# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Lubosz Sarnecki <lubosz at gmail dot com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>

pkgname=siril-git
_pkgname=${pkgname%-git}
pkgver=1.2.0.6313.272d5c6a8
pkgrel=2
pkgdesc="An astronomical image processing software for Linux. (IRIS clone)"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://www.siril.org/"
depends=(
		'gtk3'
		'fftw'
		'cfitsio'
		'gsl'
		'opencv'
		'exiv2'
		'libxisf'
		'ffms2'
		'libraw'
		'libheif'
		)
checkdepends=('criterion' 'libcurl-gnutls')
makedepends=('git' 'cmake' 'meson' 'ninja')
optdepends=('libpng: PNG import'
'libjpeg: JPEG import and export'
'libtiff: TIFF import and export'
'libcurl-gnutls: online astrometry'
)
source=('git+https://gitlab.com/free-astro/siril.git')
sha1sums=('SKIP')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "%s.%s.%s" "$(git describe | cut -d "-" -f1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/${_pkgname}"
	arch-meson _build -D criterion=true -D enable-libcurl=yes
	meson compile -C _build
}

check() {
  cd "${srcdir}/${_pkgname}"
  meson test -C _build --print-errorlogs
}

package() {
	cd "${srcdir}/${_pkgname}"
	meson install -C _build --destdir "$pkgdir"
}
