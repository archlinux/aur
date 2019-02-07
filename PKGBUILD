# Maintainer: Florian Freund <florian 88 freund aatt gmail ddoott ccoomm>
# Contributor: Mark Coolen <mark ddoott coolen aatt gmail ddoott ccoomm nniiccee!>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="xournalpp"
pkgname="${_pkgname}-git"

pkgver=1.0.7.124.gd5f89600
pkgrel=1
pkgdesc='Xournal++ is a handwriting Notetaking software with PDF annotation support. Supports Pen input like Wacom Tablets.'
arch=('i686' 'x86_64')
url="https://github.com/xournalpp/xournalpp"
license=('GPL-2.0')
makedepends=('git' 'cmake' 'gettext')
depends=('texlive-bin' 'gtk3' 'glib2' 'desktop-file-utils' 'poppler-glib' 'libxml2' 'portaudio' 'libsndfile')
optdepends=('curl: recording support'
            'vlc: recording support'
            'alsa-utils: recording support')
conflicts=('xournalpp')
install="xournalpp.install"
source=("${_pkgname}::git+https://github.com/xournalpp/xournalpp.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	git describe --tags | sed -e 's|v||g' -e 's|glib.||g' -e 's|-|.|g'
}

prepare() {
	cd "${srcdir}/${_pkgname}/"

	test -e "${srcdir}/${_pkgname}/build" || mkdir -p "${srcdir}/${_pkgname}/build"
	cd "${srcdir}/${_pkgname}/build"

	if [ -z "$XDG_CONFIG_HOME" ]; then
		configdir=".config"
	else
		configdir="$XDG_CONFIG_HOME"
	fi
	cmake -DENABLE_TEX="ON" -DCMAKE_INSTALL_PREFIX="/usr/" -DDEV_CONFIG_DIR="$configdir/xournalpp" ..
}

build() {
	cd "${srcdir}/${_pkgname}/build"
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	# sed 's|/usr/local|/usr|g' -i "${srcdir}/${_pkgname}/build/cmake_install.cmake" || true
	make DESTDIR="${pkgdir}/" install
}
