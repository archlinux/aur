# Maintainer:
pkgname=libcppbor-git
pkgver=r322.ef96268
pkgrel=1
pkgdesc="LibCppBor: A Modern C++ CBOR Parser and Generator"
arch=("x86_64")
url="https://android.googlesource.com/platform/system/libcppbor"
license=("Apache-2.0")
depends=("openssl")
provides=("${pkgname}")

_build_directory=${pkgname}

source=(
	"${pkgname}::git+https://android.googlesource.com/platform/system/libcppbor"
	"CMakeLists.txt"
	"001-cppbor-cpp.patch"
	"002-cppbor-parse-cpp.patch"
)

sha512sums=(
	"SKIP"
	"c424c51e7c1509f9af698a9d6b6e208362bb3ad1ecf16d6ae1a25173f283e5d4ce1b5d16a04d7bfd5fbe8da91fe29b60a1551271c895fbaaaa5b36eb399a3d19"
	"ae68dd423e9fd61113b76c11e37fc84a5ec490ef613ad541b4f41dffdd65d68b7b64fce475e425a869d6f85e161e07c1d1ddea185a8d8b3e127d6e6968ae094a"
	"a43b81a4499359e77e2d2b9136629bb4ac80ab104516100e54947dadb0d5ef9cc1433811bd896072ee966f09dbf882661e751d5d480754855423757561a5357e"
)

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	#git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
	#git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_build_directory}"
	cp "${srcdir}/CMakeLists.txt" "${srcdir}/${_build_directory}/"
	
	patch --forward --strip=1 --input="${srcdir}/001-cppbor-cpp.patch"
	patch --forward --strip=1 --input="${srcdir}/002-cppbor-parse-cpp.patch"
}

build() {
	cd "${srcdir}/${_build_directory}"
	cmake -B build \
	    -DCMAKE_INSTALL_PREFIX=/usr \
	    -DCMAKE_BUILD_TYPE=Release \
	    -DBUILD_SHARED_LIBS=ON
	cmake --build build
}

package() {
	cd "${srcdir}/${_build_directory}"
	DESTDIR="${pkgdir}" cmake --install build
	# license
	mkdir -p "${pkgdir}/usr/share/licenses/libcppbor/"
	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/libcppbor/LICENSE"
}
