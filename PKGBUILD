# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=lyx-git
_pkgname=lyx
pkgver=2.5.gamma1.337.ge96f4ec
pkgrel=1
pkgdesc="An advanced WYSIWYM document processor & LaTeX front-end"
arch=('i686' 'x86_64')
url="http://www.lyx.org"
license=('GPL')
depends=(qt6-svg qt6-base python imagemagick enchant python-pyenchant boost-libs libmythes file)
makedepends=(glibc qt6-base git autoconf automake gcc bc)
optdepends=(texlive-core rcs texlive-latexextra)
provides=('lyx')
conflicts=('lyx')
source=("${_pkgname}::git://git.lyx.org/${_pkgname}.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/\1/;s/-/./g' ||
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
	cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --enable-qt6 \
    --without-included-boost \
    --without-included-mythes
  make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="$pkgdir/" install
}
