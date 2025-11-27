# Maintainer: thynkon <thynkon at protonmail dot com>
# Maintainer: Florian Freund <florian 88 freund aatt gmail ddoott ccoomm>
# Contributor: Mark Coolen <mark ddoott coolen aatt gmail ddoott ccoomm nniiccee!>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="xournalpp"
pkgname="${_pkgname}-git"

pkgver=1.2.8.r544.g3aeb44b7b
pkgrel=1
pkgdesc='Xournal++ is a handwriting Notetaking software with PDF annotation support. Supports Pen input like Wacom Tablets.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/xournalpp/xournalpp"
license=('GPL2')
depends=('gtk3' 'gtksourceview4' 'poppler-glib' 'libxml2' 'portaudio' 'libsndfile' 'lua53' 'lua53-lgi' 'libzip' 'qpdf')
makedepends=('git' 'cmake' 'ninja' 'help2man' 'gtest')
optdepends=('texlive-latexextra: LaTeX package' 'gtksourceview4' 'gettext')
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

  cmake \
    -G 'Ninja' \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr/' \
    -Wno-dev \
    -DDOWNLOAD_GTEST=on \
    -DENABLE_GTEST=ON ..

  cmake --build .

  cmake --build . --target test-units
}

check() {
  cd "${srcdir}/${_pkgname}/build"

  ./test/test-units
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  DESTDIR="${pkgdir}/" cmake --build . --target install
}
