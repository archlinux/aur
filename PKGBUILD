# Maintainer: Amirul Fitri <tounghacker@gmail.com>

# maintainer's variables
_commit=f75fffcc077e5cda0bf3c87121dca103855d2be5

pkgname=frozen
pkgver=1.1.1
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
		-DBUILD_TESTING=OFF
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
	#cmake --build .build --target test
}

package() {
	cd "${pkgname}"
	DESTDIR="${pkgdir}" cmake --install .build --config Release
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
