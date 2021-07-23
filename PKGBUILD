# Maintainer:
pkgname=ot-commissioner-cli-git
pkgver=0.0.1.r28.g5bf54fa
pkgrel=1
pkgdesc='OpenThread Commissioner'
arch=('x86_64')
url='https://github.com/openthread/ot-commissioner'
license=('BSD')
makedepends=('git' 'cmake' 'ninja' 'swig')
depends=('readline' 'python-pexpect')
provides=('commissioner-cli' 'commissioner_ctl' 'commissionerd')

_build_directory=${pkgname}/_build
_install_directory=/usr

source=(
	"${pkgname}::git+https://github.com/openthread/ot-commissioner.git"
	"001-service.patch"
)

sha512sums=(
	"SKIP"
	"81a699577cb2e16f202e768627fa757f159bfb940595cb36c1064a289bb28a95d27d60a1285d5137aeb4553aceebdd9182efee984ab88348f4ba1075d5822b88"
)

pkgver() {
	cd ${pkgname}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	build_type=Release

	cd ${pkgname}
	git submodule update --init
	patch --forward --strip=1 --input="${srcdir}/001-service.patch"
	cmake -G Ninja \
		-S "${srcdir}"/${pkgname} \
		-B "${srcdir}"/${_build_directory} \
		-DBUILD_TESTING=OFF \
		-DUSE_STATIC_MBEDTLS_LIBRARY=ON \
		-DCMAKE_INSTALL_PREFIX=${_install_directory} \
		-DCMAKE_BUILD_TYPE=${build_type} \
		-DCMAKE_CONFIGURATION_TYPES=${build_type}
}

build() {
	cd "${srcdir}"/${_build_directory}
	ninja
}

package() {
	install_dir="${pkgdir}"${_install_directory}
	cd "${srcdir}"/${_build_directory}
	DESTDIR="${pkgdir}" ninja install

	install -dm755 "${install_dir}"
	install -Dm644 "${srcdir}"/${pkgname}/LICENSE ${install_dir}/share/licenses/${pkgname}/LICENSE
	rm -r -f ${install_dir}/{include,lib}
	mv "${pkgdir}"/etc ${install_dir}/lib
	mv ${install_dir}/etc "${pkgdir}"/etc
}
