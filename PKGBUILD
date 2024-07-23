# Maintainer: Kimiblock Moe
# Contributor: Puqns67 <me@puqns67.icu>
# Contributor: yuioto <yuiotochan@outlook.com>


pkgname=wiliwili-wayland
_pkgname=wiliwili
pkgver=1.4.1
pkgrel=1
pkgdesc='专为手柄控制设计的第三方跨平台B站客户端, 使用 Wayland 运行并阻止唤醒独显'
arch=('x86_64' 'aarch64')
url='https://github.com/xfangfang/wiliwili'
license=('GPL-3.0-or-later')
depends=("mpv" "opencc" "pystring" "glibc" "curl" "hicolor-icon-theme" "openssl" "gcc-libs" "dbus" "zlib" "libwebp" "bash" "libpng")
makedepends=("cmake" "git" "libxi" "ninja" "python" "wayland-protocols" "sdl2")
source=("${_pkgname}"::"git+${url}.git#tag=v${pkgver}" "wiliwili.sh")
sha512sums=('2c1ffb5c6f11929bca60a30e7c16857b1b94aecfa42cbcfad0fbbe21b2e0f9421030f2463f9f8e95a9c5b42790a775b3b5a5f4159fefe322b833c674a25a53fd'
            '77ea4254c2d47853729f3e358fd2ef52ba5ad504db535c10a588fdfc1ab2180fee16f91a371ece85efd73f8a10d6600d4f7bd8aa60cf90ac217c7af67464c21a')
conflicts=(wiliwili)
provides=(wiliwili)

function prepare() {
	git -C "${srcdir}/${_pkgname}" submodule update --init --recursive
}

function build() {
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

function package() {
	DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
	install -Dm755 "${srcdir}/wiliwili.sh" "${pkgdir}/usr/bin/wiliwili-wayland"
	sed -i 's|Exec=wiliwili|Exec=wiliwili-wayland|g' "${pkgdir}/usr/share/applications/cn.xfangfang.wiliwili.desktop"
}
