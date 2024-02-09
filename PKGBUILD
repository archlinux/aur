# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=wiliwili-git
_pkg=wiliwili
pkgver=v1.3.0.r0.g2183dd1
pkgrel=1
pkgdesc='A 3rd party bilibili client'
url="https://github.com/xfangfang/wiliwili"
license=('GPL-3.0-only')
# Some arches are not tested and may not work properly.
# they are untested and may not compile.
arch=('x86_64' 'i386' 'aarch64' 'armv7h' 'riscv64' 'loong64')
# This program should run on any platform that supports C++17,OpenGL(ES)2.0+,ffmpeg platform.
# arch=('any')
provides=("$_pkg")
conflicts=("$_pkg" "$_pkg-bin")
# This depends list base on  AUR repo wiliwili.
# Thanks Puqns67 <me@puqns67.icu> depends list and and cmake command-line parameter.
depends=('mpv' 'opencc' 'pystring')
makedepends=('git' 'cmake' 'gcc' 'libwebp' 'python' 'wayland-protocols' 'libxi')

# options("name")

source=("${_pkg}::git+$url.git"
	"${_pkg}.sh")
sha256sums=('SKIP'
            '82567c5b14b818d3b628c43f89ae85bc4f60eac22241933379a97318fdebb240')

pkgver() {
	cd "$_pkg"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$_pkg"
	git submodule update --init --recursive
}

build() {
	# If you want to use Debug mode, deleate -DCMAKE_BUILD_TYPE=Releas
	# If you don't want to use system library, deleate -USE-SHARED-LIB=ON
	# and -DUSE_SYSTEM_CURL=ON -DUSE_SYSTEM_OPENCC=ON -DUSE_SYSTEM_PYSTRING=ON
	cmake \
		-B build \
		-S "$_pkg" \
		-DCMAKE_INSTALL_PREFIX:PATH='/usr' \
		-DPLATFORM_DESKTOP=ON \
		-DINSTALL=ON \
		-DCMAKE_BUILD_TYPE=Release \
                -USE-SHARED-LIB=ON \
                -DUSE_SYSTEM_CURL=ON \
                -DUSE_SYSTEM_OPENCC=ON \
                -DUSE_SYSTEM_PYSTRING=ON \
		-DGLFW_BUILD_WAYLAND=ON \
		-DGLFW_BUILD_X11=ON \
		-Wno-dev
	make -C build wiliwili -j$(nproc)
}

check() {
	cd "build"
	ctest --output-on-failure --stop-on-failure -j1
}

package() {
	# main
	DESTDIR="${pkgdir}" cmake --install "build"

	# booting auto choose dark theme use gdbus.
	mv ${pkgdir}/usr/bin/${_pkg} ${pkgdir}/usr/share/${_pkg}/
	install -Dm755 "${_pkg}.sh" ${pkgdir}/usr/bin/${_pkg}

	# Now cmake will copy this files.
	# cp -dr --no-preserve=ownership "build/resources/" "$pkgdir/usr/share/$_pkg/"
	# install -Dm755 "$_pkg/scripts/linux/cn.xfangfang.wiliwili.desktop" -t "$pkgdir/usr/share/applications/"
	# install -Dm644 "build/resources/icon/cn.xfangfang.wiliwili.png" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}

