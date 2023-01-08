# Maintainer: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/dpp-git
pkgname=dpp-git
_pkgname=DPP
pkgver=10.0.22.r1.788377d2
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library - git version"
arch=('x86_64')
url="https://dpp.dev/"
license=('Apache')
depends=('gcc-libs' 'openssl' 'zlib' 'opus' 'libsodium' 'nlohmann-json')
makedepends=('cmake' 'pkgconf' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("${pkgname}::git+https://github.com/brainboxdotcc/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s" "$(git describe --long --tag | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//g')"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	find . \( -iname "*.h" -o -iname "*.cpp" \) -exec sed -i -E "s/dpp\/(nlohmann)\//\1\//" '{}' \+
	sed -i -E "s/^.*dpp\/nlohmann.*$//" "library/CMakeLists.txt"
	rm -rf "include/dpp/nlohmann"
}

build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p build
	cd build
	cmake -DDPP_BUILD_TEST=OFF -DRUN_LDCONFIG=OFF -DDPP_NO_VCPKG=ON -DDPP_CORO=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_MESSAGE=NEVER -Wno-dev ..
	make
}

package() {
	cd "${srcdir}/${pkgname}/build"
	make DESTDIR="${pkgdir}/" install
	ln -s "/usr/include/nlohmann" "${pkgdir}/usr/include/dpp/nlohmann"
}
