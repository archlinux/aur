# Maintainer: Florian Freund <florian 88 freund aatt gmail ddoott ccoomm>
# Contributor: Mark Coolen <mark ddoott coolen aatt gmail ddoott ccoomm nniiccee!>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="xournalpp"
pkgname="${_pkgname}-git"

pkgver=1.1.1.r172.g932d46f18
pkgrel=1
pkgdesc='Xournal++ is a handwriting Notetaking software with PDF annotation support. Supports Pen input like Wacom Tablets.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/xournalpp/xournalpp"
license=('GPL2')
makedepends=('git' 'cmake' 'help2man' 'gtest')
depends=('texlive-bin' 'gtk3' 'poppler-glib' 'libxml2' 'portaudio' 'libsndfile' 'lua53' 'lua53-lgi' 'libzip')
conflicts=('xournalpp')
source=("${_pkgname}::git+https://github.com/xournalpp/xournalpp.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	git describe --long --tags --exclude nightly | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p "${srcdir}/${_pkgname}/build"
}

build() {
	cd "${srcdir}/${_pkgname}/build"

	cmake -DCMAKE_INSTALL_PREFIX="/usr/" -DENABLE_GTEST=ON ..
        cmake --build . --target pot
        cmake --build . --target translations
	cmake --build .
	cmake --build . --target test-units
}

check() {
	cd "${srcdir}/${_pkgname}/build"

	cmake --build . --target test
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	DESTDIR="${pkgdir}/" cmake --build . --target install
}
