# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=wiliwili-git
_pkg=wiliwili
pkgver=v1.1.1.r0.g7541334
pkgrel=1
pkgdesc='A 3rd party bilibili client'
url="https://github.com/xfangfang/wiliwili"
license=('GPL3')
arch=('x86_64')
provides=("$_pkg")
conflicts=("$_pkg" "$_pkg-bin")
depends=('mpv')
makedepends=('git' 'cmake' 'gcc' 'libwebp')

# options("name")

source=("${_pkg}::git+$url.git")
sha256sums=('SKIP')

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
	cmake \
		-B build \
		-S "$_pkg" \
		-DCMAKE_INSTALL_PREFIX:PATH='/usr' \
		-DPLATFORM_DESKTOP=ON \
		-DINSTALL=ON \
		-DCMAKE_BUILD_TYPE=Release \
                -USE-SHARED-LIB=ON \
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

	# Now cmake will copy this files.
	# cp -dr --no-preserve=ownership "build/resources/" "$pkgdir/usr/share/$_pkg/"
	# install -Dm755 "$_pkg/scripts/linux/cn.xfangfang.wiliwili.desktop" -t "$pkgdir/usr/share/applications/"
	# install -Dm644 "build/resources/icon/cn.xfangfang.wiliwili.png" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}

