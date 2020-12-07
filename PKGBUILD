# Maintainer: BrainDamage

pkgname=eqonomize-git
pkgver=r490.a55847a
pkgrel=2
pkgdesc='Efficient and easy accounting for the small household economy'
arch=('x86_64')
url='https://eqonomize.github.io/'
depends=('qt5-charts' 'qt5-base')
makedepends=('qt5-tools')
# strip the -git suffix from name
_dirname="${pkgname%-git}"
_basename="${pkgname%-git}"
source=("${_basename}::git+https://github.com/Eqonomize/Eqonomize")
sha256sums=('SKIP')

# template start; name=git; version=1;
makedepends+=('git')

# conflict/provide the same package as the non -git version
provides=("${_basename}")
conflicts=("${_basename}")

pkgver() {
	cd "${srcdir}/${_dirname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	# 0.9.9.r27.g2b039da # if tags exist
	# r1581.2b039da      # else fallback
}
# template end;

build() {
	cd "${srcdir}/${_dirname}"
	lrelease Eqonomize.pro
	qmake PREFIX=/usr \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		QMAKE_LFLAGS="${LDFLAGS}"
	make
}

package() {
	cd "${srcdir}/${_dirname}"
	make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
}
