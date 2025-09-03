# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=pcsx-redux
pkgver=r6790.718f0912
pkgrel=1
pkgdesc="A collection of tools, research, hardware design, and libraries aiming at development and reverse engineering on the PlayStation 1."
arch=('x86_64')
url="https://github.com/grumpycoders/pcsx-redux"
license=('GPL-2.0-or-later')
depends=('zlib' 'libluv' 'curl' 'gcc-libs' 'capstone' 'fmt' 'llhttp' 'md4c' 'ffmpeg' 'glibc' 'hicolor-icon-theme' 'libuv' 'libx11' 'freetype2' 'libxcb' 'glfw')
makedepends=('git' 'imagemagick')
options=(!lto)
_commit=718f0912a44320faf2668e71d3ce9cc3207485bd
source=("git+$url.git#commit=$_commit"
	"git+https://github.com/ocornut/imgui.git"
	"git+https://github.com/libuv/libuv.git"
	"git+https://github.com/grumpycoders/uC-sdk.git"
	"git+https://github.com/google/googletest.git"
	"git+https://github.com/fmtlib/fmt.git"
	"git+https://github.com/serge1/ELFIO.git"
	"git+https://github.com/exoticlibraries/libcester.git"
	"luajit::git+https://github.com/grumpycoders/LuaJIT.git"
	"git+https://github.com/luvit/luv.git"
	"git+https://github.com/nothings/stb.git"
	"git+https://github.com/wolfpld/tracy.git"
	"git+https://github.com/Neargye/magic_enum.git"
	"git+https://github.com/Distrotech/ucl.git"
	"git+https://github.com/gabomdq/SDL_GameControllerDB.git"
	"git+https://github.com/herumi/xbyak.git"
	"git+https://github.com/grumpycoders/zep.git"
	"git+https://github.com/mackron/miniaudio.git"
	"git+https://github.com/TartanLlama/expected.git"
	"git+https://github.com/grumpycoders/vixl.git"
	"git+https://github.com/mity/md4c.git"
	"git+https://github.com/mekhontsev/imgui_md.git"
	"git+https://github.com/iafonov/multipart-parser-c.git"
	"git+https://github.com/grumpycoders/nanovg.git"
	"git+https://github.com/grumpycoders/nanosvg.git"
	"git+https://github.com/lunarmodules/luafilesystem.git"
	"git+https://github.com/grumpycoders/luacov.git"
	"git+https://github.com/bluebird75/luaunit.git"
	"git+https://github.com/uriparser/uriparser.git"
	"git+https://github.com/taocpp/PEGTL.git"
	"git+https://github.com/grumpycoders/psxlua.git"
	#luv submodules
	"git+https://github.com/LuaJIT/LuaJIT.git"
	"git+https://github.com/lua/lua.git"
	"git+https://github.com/keplerproject/lua-compat-5.3.git")
sha256sums=('761a7e4d81416aef976949016a6086275769273c7461bed674043d9443fe4119'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	for _submodule in imgui libuv uC-sdk googletest fmt ELFIO libcester luajit luv stb tracy magic_enum ucl SDL_GameControllerDB xbyak zep miniaudio expected vixl md4c imgui_md multipart-parser-c nanovg nanosvg luafilesystem luacov luaunit uriparser PEGTL psxlua
	do
		git config submodule.third_party/$_submodule.url "$srcdir/$_submodule"
	done
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/third_party/luv"
	for _submodule in libuv lua lua-compat-5.3
	do
		git config submodule.$_submodule.url "$srcdir/$_submodule"
	done
	git config submodule.luajit.url "$srcdir/LuaJIT"
	git -c protocol.file.allow=always submodule update
	# change convert to magick convert
	sed -i 's/convert/magick convert/g' "$srcdir/$pkgname/Makefile"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -dm755 "$pkgdir/usr"
	make DESTDIR="$pkgdir/usr" install
}
