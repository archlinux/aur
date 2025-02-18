# Maintainer: Imperator Storm <imperatorstorm11@protonmail.com
# shellcheck disable=SC2034,SC2154,SC2164,SC2148
pkgname=memsed-git
pkgver=0.1.r3.gd950305
pkgrel=4
pkgdesc="MEMory Search and EDit for Linux, inspired by Cheat Engine"
arch=(x86_64)
url="https://github.com/Willy-JL/MemSed"
license=('GPL-3.0-only')
groups=()
depends=(glibc)
makedepends=(git cmake 'python>=3.10' python-jinja 'python-ply>=3.11' clang # memsed
libxext libxrender libx11 libgl libxcursor hidapi libusb wayland-protocols alsa-lib mesa libpulse libxrandr libxinerama wayland libxkbcommon ibus
libxss libdecor # SDL
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
source=('memsed::git+https://github.com/Willy-JL/MemSed.git'
		'memsed-dear_bindings::git+https://github.com/dearimgui/dear_bindings.git'
		'memsed-imgui::git+https://github.com/ocornut/imgui.git'
		'memsed-sdl3::git+https://github.com/libsdl-org/SDL.git'
		'memsed-glad::git+https://github.com/Dav1dde/glad.git'
		do_not_pip.patch
		dont_werror.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '984a5accc29029229778edb526f6121e0ded903f9477b2ecc399461192d0e840'
            '46a844e3391423880970798d223d1c0c6b0fbcf4f7e7b42025fc41352098a916')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --tags --long --abbrev=7 | sed 's/^memsed.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	env -C "$srcdir/${pkgname%-git}" patch -tp1 <do_not_pip.patch
	env -C "$srcdir/${pkgname%-git}" patch -tp1 <dont_werror.patch
	#//TODO: figure out how to link dcimgui against OS-provided sdl/glad
	#//TODO: Remove developer-specified optimization flags?
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.lib/vendor/dear_bindings.url "$srcdir/memsed-dear_bindings"
	git config submodule.lib/vendor/imgui.url "$srcdir/memsed-imgui"
	git config submodule.lib/vendor/sdl3.url "$srcdir/memsed-sdl3"
	git config submodule.lib/vendor/glad.url "$srcdir/memsed-glad"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
	cmake --build build
}

#check() {
#	cd "$srcdir/${pkgname%-git}"
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	#DESTDIR="$pkgdir/" cmake --install build //NYI
	install -D -m755 "$srcdir/${pkgname%-git}"/build/memsed "${pkgdir}"/usr/bin/memsed
    install -D -m644 "$srcdir/${pkgname%-git}"/LICENSE  "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
