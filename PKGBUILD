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
_cmake_install_directory=_install

source=(
	"${pkgname}::git+https://github.com/openthread/ot-commissioner.git"
	"001-service.patch"
	"002-service.patch"
)

sha512sums=(
	"SKIP"
	"917379265289b52d2275ee889103df75a56e82842ab7b02c5a2c92506b1da959f4bc35e4c550bd60b793cedd54e14ed492bdcde93d8fb0d90f6ef1999a6e2c41"
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
	patch --forward --strip=1 --input="${srcdir}/002-service.patch"
	cmake -G Ninja \
		-DBUILD_TESTING=OFF \
		-DUSE_STATIC_MBEDTLS_LIBRARY=ON \
		-DSERVICE_PREFIX=${srcdir}/${pkgname}/${_cmake_install_directory} \
		-DCMAKE_INSTALL_PREFIX=${srcdir}/${pkgname}/${_cmake_install_directory} \
		-DCMAKE_BUILD_TYPE=${build_type} \
		-DCMAKE_CONFIGURATION_TYPES=${build_type} \
		-S ${srcdir}/${pkgname} \
		-B ${srcdir}/${_build_directory}
}

build() {
	cmake --build ${_build_directory}
	cmake --install ${_build_directory}
}

package() {
	install_dir=${pkgdir}/usr

	install -dm755 "${install_dir}"
	install -Dm644 ${pkgname}/LICENSE ${install_dir}/share/licenses/${pkgname}/LICENSE
	cp -R ${srcdir}/${pkgname}/${_cmake_install_directory}/bin ${install_dir}
	cp -R ${srcdir}/${pkgname}/${_cmake_install_directory}/etc ${pkgdir}
}
