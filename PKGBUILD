# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: Julien Desgats <julien at desgats dot fr>

pkgname=osrm-backend
pkgver=6.0.0
pkgrel=1
pkgdesc="High performance routing engine written in C++14 designed to run on OpenStreetMap data."
arch=('x86_64')
url="https://github.com/Project-OSRM/${pkgname}"
license=('BSD')
depends=(
	'expat'
	'boost-libs'
	'lua'
	'intel-tbb'
	'libxml2'
	'libzip'
	'bzip2'
	'doxygen'
	'libc++'
	'protozero'
	'libosmium'
)
makedepends=(
	'cmake'
	'boost'
)
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}-LICENSE::${url/github/raw.githubusercontent}/refs/heads/master/LICENSE.TXT")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

b2sums=('7e714e99eaea01b1ce336c74e2f4a6f5af6aa059ef16d0e353864c7e188df88682ea5a41b94d42e6daeabfd96e7f352790e04a0bb273c1633747c17e5c348f5a')
b2sums_x86_64=('318ad504099a93585a2ec8d39998e375519f511359fe927718638c5a4dd0221bf15f02babca9ee7f3752f08e7315393370aaf2584f813e34542ccaed08b295fe')

# prepare() {
# https://man.archlinux.org/man/makepkg.conf.5.en
# sudo sed -i -e 's/-D_FORTIFY_SOURCE=3/-D_FORTIFY_SOURCE=2/g' /etc/makepkg.conf

# echo "CXXFLAGS=\"-D_FORTIFY_SOURCE=2\"" | sudo tee /etc/makepkg.conf.d/cflags.conf
# mkdir -p "$XDG_CONFIG_HOME/pacman"
# if [ ! -f "$XDG_CONFIG_HOME/pacman/makepkg.conf" ]; then
# echo "CFLAGS=\"-D_FORTIFY_SOURCE=2\"" | sudo tee "$XDG_CONFIG_HOME/pacman/makepkg.conf"
# elseif [ -f "$XDG_CONFIG_HOME/pacman/makepkg.conf" ] && ! grep -Fxq "CFLAGS=\"-D_FORTIFY_SOURCE=2\""; then
# 	echo "CFLAGS=\"-D_FORTIFY_SOURCE=2\"" | sudo tee -a "$XDG_CONFIG_HOME/pacman/makepkg.conf"
# else
# 	install -Dm644 -T ./cflags.patch "/etc/makepkg.conf.d/cflags.conf"
# fi
# install -Dm644 -T ./cflags.patch "/etc/makepkg.conf.d/cflags.conf"
#
# cd "${pkgname}-${pkgver}"
# patch -p1 -i ../pkg.patch
# for p in ../*.patch; do
# 	patch -Np1 -i "$p"
# done
#

# export CXX=clang++
# export CXXFLAGS="-std=c++14"
# export CC=clang

# }

build() {
	# export CFLAGS="${CFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"
	# export CFLAGS="${CFLAGS} -Wno-error=format-security"

	# Why do you need to remove anything - just append the value(s) you want.  Gcc will only use the last march specified:
	# export CFLAGS+=" -march=whatever"
	# export CFLAGS+=" -D_FORTIFY_SOURCE=2"

	# Must be set to 2:
	# -D_FORTIFY_SOURCE=2

	# cd "${srcdir}/${pkgname}-${pkgver}"
	# mkdir -p build
	# cd build

	local cmake_options=(
		# -B <path-to-build>           = Explicitly specify a build directory.
		# This is relative to /src
		-B build

		# -S <path-to-source>          = Explicitly specify a source directory.
		-S "${srcdir}/${pkgname}-${pkgver}"
		-D CMAKE_BUILD_TYPE=RelWithDebInfo
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_INSTALL_LIBDIR=lib
		-D BUILD_SHARED_LIBS=ON
		-D LUA_INCLUDE_DIR=/usr/include
		-W no-dev
	)
	cmake "${cmake_options[@]}"
	# make VERBOSE=1

	echo -e "PWD:<$(pwd)>"
	cmake --build build
}

check() {
	local excluded_tests=""
	local ctest_flags=(
		--test-dir "${srcdir}/build"
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
	# cd "${srcdir}/${pkgname}-${pkgver}"

	# cd build
	# sudo cmake --build build --target install #--config Debug
	DESTDIR="${pkgdir}/" cmake --install build

	install -Dvm644 -T "${srcdir}/${pkgname}-${pkgver}/LICENSE.TXT" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	# install -Dvm755 -t "bin/${pkgname}" "${pkgdir}/usr/bin"
	# install -Dvm644 -T LICENCE "${pkgdir}/usr/share/licenses/${pkgname}"
	# install -Dvm644 -t "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}
