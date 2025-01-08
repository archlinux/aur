# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=sdrpp-mirisdr-source-git
pkgver=r9.9d2f9dd
pkgrel=1
pkgdesc="Libmirisdr source plugin for SDR++"
arch=(x86_64)
url=""
license=('GPL-3.0')
groups=()
depends=(sdrpp libmirisdr5)
makedepends=('git' 'sdrpp-headers-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('sdrpp-mirisdr-source::git+https://github.com/cropinghigh/sdrpp-mirisdr-source.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	local cmake_options=(
		-B build
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

check() {
	cd "$srcdir/${pkgname%-git}"
	local excluded_tests=""
	local ctest_flags=(
		--test-dir build
		# show the stdout and stderr when the test fails
		--output-on-failure
		# execute tests in parallel
		--parallel $(nproc)
		# exclude problematic tests
		--exclude-regex "$excluded_tests"
	)
	ctest "${ctest_flags[@]}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir" cmake --install build
}
