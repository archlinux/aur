# Maintainer: Amirul Fitri <tounghacker@gmail.com>

# maintainer's variables
_commit=06bee5321cecd9a9ffaceb164b5adb2ffafae781

pkgname=frozen
pkgver=1.2.0
pkgrel=1
pkgdesc="A header-only, constexpr alternative to gperf for C++14 users"
arch=('any')
url="https://github.com/serge-sans-paille/frozen"
license=('Apache')
makedepends=('git' 'cmake')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}::git+https://github.com/serge-sans-paille/frozen.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
	cd "${pkgname}"
	cmake -E make_directory .build
	cmake -B.build \
		-DCMAKE_SKIP_INSTALL_RPATH=YES \
		-DCMAKE_SKIP_RPATH=YES \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_TESTING=ON
}

pkgver() {
	cd "${pkgname}"
	git describe --tags | sed 's/-/+/g'
}

build() {
	cd "${pkgname}"
	cmake --build .build
}

check() {
	cd "${pkgname}"
	cmake --build .build --target test
}

package() {
	cd "${pkgname}"
	DESTDIR="${pkgdir}" cmake --install .build --config Release
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
