# Maintainer: Severin Kaderli <severin@kaderli.dev>
# Contributor: aimileus < $(echo YWltaWxpdXNAcHJvdG9ubWFpbC5jb20K | base64 -d)
_pkgname=vita3k
pkgname="${_pkgname}-git"
pkgver=r2257.de68b346
pkgrel=1
pkgdesc="Experimental PlayStation Vita emulator"
arch=('x86_64')
url="https://vita3k.org/"
license=('GPL2')
makedepends=(
	'boost'
	'cmake'
	'git'
	'python2'
	'vulkan-headers'
	'clang'
	'ninja'
)
depends=(
	'boost-libs'
	'gtk3'
	'sdl2'
	'vulkan-icd-loader'
)
provides=('vita3k')
conflicts=('vita3k')
source=(
	"git+https://github.com/vita3k/vita3k.git"
)
md5sums=(
	'SKIP'
)

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	git submodule update --init --recursive
}

build() {
	cd "${_pkgname}"

	export CC="/usr/bin/clang"
	export CXX="/usr/bin/clang++"

	cmake -S . -B build-linux -G Ninja -DCMAKE_TOOLCHAIN_FILE=./cmake/toolchain/linux-x64.cmake -DCMAKE_BUILD_TYPE=Release -DUSE_VULKAN=ON -DUSE_DISCORD_RICH_PRESENCE=OFF
	cmake --build build-linux
}

package() {
	cd "${_pkgname}"

	mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/opt/vita3k/"

	cp -r "build-linux/bin/"* "${pkgdir}/opt/vita3k/"
	ln -s "/opt/vita3k/Vita3K" "${pkgdir}/usr/bin/vita3k"

	# These folders needs 777 permissions because vita3k creates files in them
	chmod 777 "${pkgdir}/opt/vita3k/"
	chmod 777 "${pkgdir}/opt/vita3k/data"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
