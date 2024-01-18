# Maintainer: Kimiblock Moe
# Contributor: Puqns67 <me@puqns67.icu>
# Contributor: yuioto <yuiotochan@outlook.com>


pkgname=wiliwili-wayland
_pkgname=wiliwili
pkgver=1.3.0
pkgrel=3
pkgdesc='专为手柄控制设计的第三方跨平台B站客户端, 使用 Wayland 运行并阻止唤醒独显'
arch=('x86_64' 'aarch64')
url='https://github.com/xfangfang/wiliwili'
license=('GPL-3.0-or-later')
depends=('mpv' 'opencc' 'pystring')
makedepends=('cmake' 'git' 'libxi' 'ninja' 'python' 'wayland-protocols')
source=("${_pkgname}"::"git+${url}.git#tag=v${pkgver}" "wiliwili.sh")
sha512sums=('SKIP' 'SKIP')
conflicts=('wiliwili')

prepare() {
	git -C "${srcdir}/${_pkgname}" submodule update --init --recursive
}

build() {
	cmake \
		-S "${srcdir}/${_pkgname}" \
		-B "${srcdir}/build" \
		-G Ninja \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX='/usr' \
		-D INSTALL=ON \
		-D PLATFORM_DESKTOP=ON \
		-D USE_SYSTEM_CURL=ON \
		-D USE_SYSTEM_OPENCC=ON \
		-D USE_SYSTEM_PYSTRING=ON \
		-D USE_SYSTEM_SDL2=ON \
 		-D GLFW_BUILD_WAYLAND=ON \
		-D GLFW_BUILD_X11=OFF

	ninja -C "${srcdir}/build" wiliwili
}

package() {
	DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
	install -Dm755 "${srcdir}/wiliwili.sh" "${pkgdir}/usr/lib/${_pkgname}/start.sh"
	sed -i 's|Exec=wiliwili|Exec=/usr/lib/wiliwili/start.sh|g' "${pkgdir}/usr/share/applications/cn.xfangfang.wiliwili.desktop"
}
