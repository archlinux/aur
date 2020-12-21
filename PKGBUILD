# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree
pkgver=0.99.26
pkgrel=1
pkgdesc="Hierarchical note-taking application"
arch=('x86_64')
url="https://www.giuspen.com/${pkgname}/"
license=('GPL3')
depends=('gspell'
	 'gtksourceviewmm'
	 'libxml++2.6'
	 'uchardet')
makedepends=('cmake'
	     'python')
source=(https://www.giuspen.com/software/${pkgname}_${pkgver}.tar.xz)
sha256sums=('29aaabea722faeaaed4e1142551dfeb2e022e5bce25ebccd626d74fe0cd3572e')

prepare() {
  # Fix automatic optimisation flag override
  sed -i 's/-O3/-O2/' "${pkgname}_${pkgver}/CMakeLists.txt"
}

# Remove GMOCK and TESTING options to build tests
# Make sure there are NO instances of cherrytree running when building!
build() {
  cmake \
	-B "${pkgname}_${pkgver}/build" \
	-S "${pkgname}_${pkgver}" \
	-DBUILD_GMOCK:BOOL=OFF \
	-DBUILD_TESTING:BOOL=OFF \
	-Wno-dev
  make -C "${pkgname}_${pkgver}/build" all
}

# Uncomment to build tests
# Make sure there are NO instances of cherrytree running when building!
#check() {
#  make -C "${pkgname}_${pkgver}/build" test
#}

package() {
  make -C "${pkgname}_${pkgver}/build" DESTDIR="${pkgdir}" install
}
