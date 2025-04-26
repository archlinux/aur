# Maintainer: Gustavo Rehermann <rehermann6046@gmail.com>
pkgname=ckdl-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=1.0.r3.ge5a94d6
pkgrel=1
pkgdesc="KDL parsing library in C, Python, C++"
arch=(x86_64)
url="https://github.com/tjol/ckdl"
license=('MIT')
groups=()
depends=()
makedepends=(git cmake)
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=($pkgname'::git+https://github.com/tjol/ckdl')
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/$pkgname"

	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir"

	local cmake_options=(
		-B build
		-S $pkgname
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D BUILD_SHARED_LIBS=ON
		-D CMAKE_INSTALL_PREFIX=/usr
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

check() {
	cd "$srcdir"
	
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
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
