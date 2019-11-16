# Maintainer: Mikaela Szekely <mikaela.szekely@qyriad.me>
pkgname=gr-fosphor
pkgver=3.8
pkgrel=3
pkgdesc='GNU Radio block for RTSA-like spectrum visualization; repackaged from Ubuntu'
arch=('x86_64')
url="http://sdr.osmocom.org/trac/wiki/fosphor"
license=('GPL')
groups=('')
depends=('boost' 'gnuradio>=3.8.0.0' 'hicolor-icon-theme' 'log4cpp' 'python>=3.7.0' 'qt5-base>=5.12.2' 'opencl-driver')
makedepends=('boost' 'ocl-icd' 'opencl-headers' 'cmake')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(debian.tar.xz::"https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gr-fosphor/3.8~1.278b66e-2/gr-fosphor_3.8~1.278b66e-2.debian.tar.xz" gr-fosphor.tar.xz::"https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gr-fosphor/3.8~1.278b66e-2/gr-fosphor_3.8~1.278b66e.orig.tar.xz" "cmake_swig.patch" "cmake_python.patch")
sha512sums=('2ca99e78205314c6e72c8553658ed168ba433253e30a303e7cb28d76997b0a31c2689581567bd5c3750d94a94e7a4fb3a246359e8f66a773a11ed24832b0c2aa'
            'f0e622bd1efc79bb2120d660b964028c3fa1c4436afa32673d86edbe67d72bf76bf49a75ac33efe638a6334944ed82e431191c2773b9bf91da7a48733e31e31e'
            '4602104ba845f598fa16ae736c38dd22768d02c21e29e4e87721a3889ba6624dbd1792ee2d26e499d8737153612faa3c4584c58323a0d32946f5b76cf4968e22'
            'c603e5cc0e891cb0e1d751f960b9aafffa7c804bcc18ff1c072cde89579d79de10aeced8237db4b18febba75e818c56bd176c66e93188eaab1f76ec567ffbc70')
_gr_name=""

prepare()
{
	cd "${srcdir}"

	_gr_name=$(tar --exclude='*/*' -tf "${srcdir}/gr-fosphor.tar.xz" | tr -d '\n')

	# Patch source files
	_patch_001="${srcdir}/debian/patches/0001-port-to-GNU-Radio-3.8-and-QT5.patch"
	_soname_patch="${srcdir}/debian/patches/debian-set-soname"

	cd "${srcdir}/${_gr_name}"
	patch -p1 < "${_patch_001}"
	patch -p1 < "${_soname_patch}"

	patch "${srcdir}/${_gr_name}/swig/CMakeLists.txt" "${srcdir}/cmake_swig.patch"
	patch "${srcdir}/${_gr_name}/python/CMakeLists.txt" "${srcdir}/cmake_python.patch"
}


build()
{
	_gr_name=$(tar --exclude='*/*' -tf "${srcdir}/gr-fosphor.tar.xz" | tr -d '\n')
	cd "${srcdir}/${_gr_name}"
	cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}" -B build
	make -C build
}


package()
{
	_gr_name=$(tar --exclude='*/*' -tf "${srcdir}/gr-fosphor.tar.xz" | tr -d '\n')
	cd "${srcdir}/${_gr_name}"
	make -C build install

	cd "${pkgdir}"
	mv include usr/
	mv share usr/
	mv lib/* usr/lib/

}
