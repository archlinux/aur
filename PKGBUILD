# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Theodoros Theodoridis <theodoridisgr@gmail.com>

_pkgname='range-v3'
pkgname=${_pkgname}-git
pkgver=0.12.0.r11.g3d6e6f56e
pkgrel=1
pkgdesc='Experimental range library for C++11/14/17'
arch=('any')
url='https://github.com/ericniebler/range-v3'
license=('custom')
makedepends=('git' 'cmake')
source=("git+https://github.com/ericniebler/${_pkgname}.git")
md5sums=('SKIP')

_dir="${_pkgname}"

_flags=(
	-Wno-dev
	-DCMAKE_INSTALL_PREFIX=/usr
	-DRANGE_V3_EXAMPLES=OFF
	-DRANGE_V3_PERF=OFF
	-DRANGES_ENABLE_WERROR=OFF
	-DRANGES_NATIVE=OFF
	-DRANGES_CXX_STD=20
)

pkgver() {
	cd "${_dir}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "${_dir}" -B 'build' \
		"${_flags[@]}" \
		-DRANGE_V3_TESTS=OFF \
		-DRANGE_V3_HEADER_CHECKS=OFF
	cmake --build 'build'
}

check() {
	cmake -S "${_dir}" -B 'build' \
		"${_flags[@]}" \
		-DRANGE_V3_TESTS=ON \
		-DRANGE_V3_HEADER_CHECKS=ON
	cmake --build 'build'
	cmake --build 'build' --target test
}

package() {
	DESTDIR="${pkgdir}" cmake --install 'build'
	
	cd "${_dir}" 
	# install custom license
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
