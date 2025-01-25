# Maintainer: Kimiblock Moe
# Contributor: Puqns67 <me@puqns67.icu>
# Contributor: yuioto <yuiotochan@outlook.com>


pkgname=wiliwili-wayland
_pkgname=wiliwili
pkgver=1.5.0
pkgrel=2
pkgdesc='专为手柄控制设计的第三方跨平台B站客户端, 使用 Wayland 运行并阻止唤醒独显'
arch=('x86_64' 'aarch64')
url='https://github.com/xfangfang/wiliwili'
license=('GPL-3.0-or-later')
depends=("mpv" "opencc" "pystring" "glibc" "curl" "hicolor-icon-theme" "openssl" "gcc-libs" "dbus" "zlib" "libwebp" "bash" "libpng" "portable")
makedepends=("cmake" "git" "libxi" "ninja" "python" "wayland-protocols" "sdl2")
source=("${_pkgname}"::"git+${url}.git#tag=v${pkgver}" "wiliwili.sh" "cn.xfangfang.wiliwili.desktop" "portable-config")
sha512sums=('858400ec9030bc1805dcc55fe4072eb6599c8d73911f7111087a6d2a5b5fbc373f3678572a4f3c2c7ef14d1ffe2aa794b3ea512df3a3c48292cc8a39679d07a4'
            'bba4395509aa6580f61a1957ae0bdf858065b29f40a361eabd605bf254e65325566fcd05482516e3ce09379184a2666a05393c8efee5c3dd6de6933af27fa600'
            'c50160e58c1ccc53f5d0455973a484e4d2d133eae834ca157480df23e6ecbe3cd3befe3f6976220c1787cad5192f6550761a82837fe114897a83af5535e4fb5f'
            '5ae515e517a828457b92370bde84d306f683f9bb4623a8512985f136f8f8b7889128eb87fd6c666306e8579c103fc64fdf353a88ab44292dbf34e52de6e1d1fd')
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
	install -Dm755 portable-config "${pkgdir}"/usr/lib/portable/info/cn.xfangfang.wiliwili/config
	DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
	install -Dm755 "${srcdir}/wiliwili.sh" "${pkgdir}/usr/bin/wiliwili-wayland"
	install -Dm644 "${srcdir}/cn.xfangfang.wiliwili.desktop" "${pkgdir}/usr/share/applications/cn.xfangfang.wiliwili.desktop"
}
