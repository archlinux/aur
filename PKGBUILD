# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Hakim <acrox999 at gmail dot com>
# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

_pkgname=supertux
pkgname=supertux-git

pkgver=0.6.3.r1780.ga6d3088f2
pkgrel=2

pkgdesc="A classic 2D jump'n run sidescroller game in a style similar to the original SuperMario game"
url='https://www.supertux.org'

license=(GPL-3.0-only)
arch=('x86_64' 'riscv64' 'aarch64' 'i686' 'riscv32' 'armv7h')

depends=('sdl2_image' 'openal' 'libvorbis' 'glew' 'boost-libs' 'curl' 'physfs' 'hicolor-icon-theme' 'libraqm')
makedepends=('git' 'cmake' 'boost' 'glm')
optdepends=(
	'discord: Discord Rich Presence integration'
	'arrpc: Unofficial Discord client Rich Presence integration'
)

conflicts=(supertux)
provides=(supertux)

source=('git+https://github.com/SuperTux/supertux.git')
sha512sums=('SKIP')
options=(!debug)

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

prepare() {
	cd "$_pkgname"

	git submodule update --init --recursive

	#sed -i '/curl\/types.h/d' src/addon/addon_manager.cpp
	#sed -i '1i#include <cstddef>' src/supertux/screen_manager.hpp
}

build() {
	cd "$_pkgname"

	export CFLAGS+=" -fPIC"
	export CXXFLAGS+=" -fPIC"

	cmake -B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DINSTALL_SUBDIR_BIN=bin -DINSTALL_SUBDIR_SHARE=share/supertux2 \
		-DSSQ_USE_SQ_SUBMODULE=ON \
		-DENABLE_DISCORD=On

	cmake --build build
}

package() {
	cd "$_pkgname"

	mkdir "${pkgdir}/usr"

	cmake --install build --prefix "${pkgdir}/usr"

	#rm -r "$pkgdir/usr/lib"
}
