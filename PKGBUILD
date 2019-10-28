# Maintainer: Florian Freund <florian 88 freund aatt gmail ddoott ccoomm>
# Contributor: Mark Coolen <mark ddoott coolen aatt gmail ddoott ccoomm nniiccee!>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="xournalpp"
pkgname="${_pkgname}-git"

pkgver=1.0.15.r49.gf2535dd5
pkgrel=1
pkgdesc='Xournal++ is a handwriting Notetaking software with PDF annotation support. Supports Pen input like Wacom Tablets.'
arch=('i686' 'x86_64')
url="https://github.com/xournalpp/xournalpp"
license=('GPL2')
makedepends=('git' 'cmake' 'cppunit')
depends=('texlive-bin' 'gtk3' 'poppler-glib' 'libxml2' 'portaudio' 'libsndfile' 'lua' 'libzip')
conflicts=('xournalpp')
install="xournalpp.install"
source=("${_pkgname}::git+https://github.com/xournalpp/xournalpp.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p "${srcdir}/${_pkgname}/build"
}

build() {
	if [ -z "$XDG_CONFIG_HOME" ]; then
		configdir=".config"
	else
		configdir="$(realpath --relative-to="$HOME" "$XDG_CONFIG_HOME")"
	fi
	cd "${srcdir}/${_pkgname}/build"

	cmake -DCMAKE_INSTALL_PREFIX="/usr/" -DDEV_CONFIG_DIR="$configdir/xournalpp" -DENABLE_CPPUNIT=ON ..
        cmake --build . --target pot
        cmake --build . --target translations
	cmake --build .
}

check() {
	cd "${srcdir}/${_pkgname}/build"

	cmake --build . --target test
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	make DESTDIR="${pkgdir}/" install
}
