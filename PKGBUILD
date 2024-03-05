# Maintainer: Andrea Zanoni <andrea dot zanoni at polimi dot it>
pkgname=mbdyn-git
pkgver=r8465.53a8e2a5a
pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=1
pkgdesc="The first *free* general purpose Multibody Dynamics analysis software"
arch=('any')
url='www.mbdyn.org'
license=('GPLv2')
depends=(suitesparse netcdf netcdf-cxx)
makedepends=(git autoconf automake gcc-fortran libtool)
optdepends=('ginac: symbolic elements support',
	    'lapack: eigenanalysis support',
	    'blas-openblas: eigenanalysis support, openBLAS version')
source=("${pkgname}::git+https://public.gitlab.polimi.it/DAER/mbdyn.git#branch=develop")
install=mbdyn.install
sha256sums=('SKIP')

# Note: edit the list of modules to suit your needs
_modules="hfelem"

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${srcdir}/${pkgname}
	patch --forward --strip=1 --input="../../mbdyn-utils-aur.patch"
	sh bootstrap.sh
	CXXFLAGS="-O3 -march=native" \
	FCFLAGS="-O3" \
	CFLAGS="-O3 -march=native" \
	./configure \
	--with-module="${_modules}" \
	--prefix=/usr \
	--with-y12=no \
	--with-lapack=yes \
	--enable-python \
	--enable-Werror=no \
	--with-superlu=no \
	--enable-runtime-loading \
	--libexecdir=/usr/lib/${pkgname::}
	perl -p -i -e 's#^(\s*libfile=")(\$libdir/)#$1\$DESTDIR$2#' libtool
	perl -p -i -e 's#^(\s*if test "X\$destdir" = "X)(\$libdir")#$1\$DESTDIR$2#' libtool
	cd ${srcdir}/${pkgname}/modules
	perl -p -i -e 's#^(\s*libfile=")(\$libdir/)#$1\$DESTDIR$2#' libtool
	perl -p -i -e 's#^(\s*if test "X\$destdir" = "X)(\$libdir")#$1\$DESTDIR$2#' libtool
}

build() {
	cd ${srcdir}/${pkgname}
	make -j$(nproc) all
}

package() {
	cd ${srcdir}/${pkgname}
	mkdir -p "${pkgdir}/usr/lib/${pkgname::-4}"
	libtool --finish "${pkgdir}/usr/lib/${pkgname::-4}"
	make DESTDIR=${pkgdir} install
}
