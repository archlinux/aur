# Maintainer: Andrea Zanoni <andrea dot zanoni at polimi dot it>
pkgname=mbdyn-git
pkgver=r8479.eb3297c34
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
options=(buildflags)

# Note: edit the list of modules to suit your needs
_modules="hfelem"

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${srcdir}/${pkgname}
	sh bootstrap.sh
}

build() {
	cd ${srcdir}/${pkgname}
	CPPFLAGS+=" -I/usr/include/suitesparse/"
	LDFLAGS+=" -rdynamic -lsuitesparseconfig"
	./configure \
		--with-module="${_modules}" \
		--prefix=/usr \
		--with-y12=no \
		--with-lapack=yes \
		--enable-python \
		--enable-Werror=no \
		--with-superlu=no \
		--enable-runtime-loading \
		--libexecdir=/usr/lib/${pkgname::-4}
	make -j$(nproc) all
}

package() {
	cd ${srcdir}/${pkgname}
	mkdir -p "${pkgdir}/usr/lib/${pkgname::-4}"
	sudo make install
}
