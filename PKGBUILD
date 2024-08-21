# Maintainer: Paris Oplopoios <parisoplop@gmail.com>

_pkgname=Panda3DS
_latest_release=0.8
_executable_name=Alber
_install_name=panda3ds

pkgname=panda3ds-git
pkgver=0.8.r2131.471bdd6a
pkgrel=1
pkgdesc="HLE 3DS emulator"
arch=('x86_64')
url="https://panda3ds.com"
license=('GPL-3.0-only')

# Panda3DS Dependencies
depends=(
	gcc-libs
	libxext
	zydis
	fmt
	glibc
	libxext
	vulkan-driver
	opengl-driver
	sdl2
	qt6-base
)

# Build Dependencies
makedepends=(
	cmake
	ninja
	git
	rapidjson
	alsa-lib
	libpulse
	libxrandr
	libxinerama
	wayland
	libxkbcommon
	wayland-protocols
	ibus
	fcitx5
	libxss
	jack
	pipewire
	libdecor
	vulkan-headers
	glslang
	gendesk
)

provides=(panda3ds)
conflicts=(panda3ds)
source=("git+https://github.com/wheremyfoodat/Panda3DS.git"
	"elfio::git+https://github.com/serge1/ELFIO.git"
	"SDL2::git+https://github.com/libsdl-org/SDL.git"
	"git+https://github.com/weidai11/cryptopp.git"
	"git+https://github.com/herumi/xbyak.git"
	"git+https://github.com/ToruNiina/toml11.git"
	"git+https://github.com/yhirose/cpp-httplib.git"
	"git+https://github.com/nothings/stb.git"
	"git+https://github.com/vector-of-bool/cmrc.git"
	"git+https://github.com/g-truc/glm.git"
	"git+https://github.com/Panda3DS-emu/discord-rpc.git"
	"git+https://github.com/Panda3DS-emu/LuaJIT.git"
	"git+https://github.com/vimpunk/mio.git"
	"hydra_core::git+https://github.com/hydra-emu/core.git"
	"git+https://github.com/Panda3DS-emu/zep.git"
	"git+https://github.com/merryhime/oaknut.git"
	"git+https://github.com/luvit/luv.git"
	"git+https://github.com/libuv/libuv.git"
	"git+https://github.com/mackron/miniaudio.git"
	"git+https://github.com/wwylele/teakra.git"
	"boost::git+https://github.com/Panda3DS-emu/ext-boost.git"
	"git+https://github.com/Panda3DS-emu/dynarmic.git"
	"git+https://github.com/neobrain/nihstro.git"
	"git+https://github.com/catchorg/Catch2.git"
	"git+https://github.com/capstone-engine/capstone.git"
	"hips::git+https://github.com/wheremyfoodat/Hips.git"
	"git+https://github.com/Panda3DS-emu/metal-cpp.git"
	# capstone submodule
	"git+https://github.com/tree-sitter/tree-sitter-cpp.git"
	# dynarmic zydis submodule
	"zycore::git+https://github.com/zyantific/zycore-c.git"
	# luv submodules
	"luajit::git+https://github.com/LuaJIT/LuaJIT.git"
	"git+https://github.com/lua/lua.git"
	"git+https://github.com/keplerproject/lua-compat-5.3.git"
	#zep gitmodule
	"git+https://github.com/Microsoft/vcpkg.git")
sha256sums=('SKIP'
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
	cd $_pkgname
	printf "%s.r%s.%s" \
	"$_latest_release" \
	"$(git rev-list --count HEAD)" \
	"$(git rev-parse --short HEAD)"
}

prepare(){
	cd "$srcdir/$_pkgname"
	git submodule init
	for submodule in {elfio,SDL2,xbyak,toml11,cmrc,glm,discord-rpc,LuaJIT,mio,hydra_core,zep,oaknut,luv,libuv,miniaudio,teakra,boost,dynarmic,nihstro,Catch2,capstone,hips,metal-cpp};
	do
		git config submodule.third_party/$submodule.url "$srcdir/$submodule"
	done
	git config submodule.cpp-httplib.url "$srcdir/cpp-httplib"
	git config submodule.stb.url "$srcdir/stb"
	git config submodule.third_party/cryptopp/cryptopp.url "$srcdir/cryptopp"
	git -c protocol.file.allow=always submodule update

	pushd "$srcdir/$_pkgname/third_party/capstone"
	git submodule init
	git config submodule.suite/auto-sync/vendor/tree-sitter-cpp.url "$srcdir/tree-sitter-cpp"
	git -c protocol.file.allow=always submodule update
	popd
	pushd "$srcdir/$_pkgname/third_party/dynarmic/externals/zydis/"
	git submodule init
	git config submodule.dependencies/zycore.url "$srcdir/zycore"
	git -c protocol.file.allow=always submodule update
	popd
	pushd "$srcdir/$_pkgname/third_party/luv"
	git submodule init
	for submodule in {libuv,luajit,lua,lua-compat-5.3};
	do
		git config submodule.$submodule.url "$srcdir/$submodule"
	done
	git -c protocol.file.allow=always submodule update
	popd
	pushd "$srcdir/$_pkgname/third_party/zep"
	git submodule init
	git config submodule.vcpkg.url "$srcdir/vcpkg"
	git -c protocol.file.allow=always submodule update
	popd
}

build() {
	cd "$srcdir"
	gendesk -f \
	--pkgname=panda3ds \
	--pkgdesc="$pkdesc" \
	--name=Panda3DS \
	--exec=panda3ds-qt \
	--icon=panda3ds \
	--terminal=false \
	--categories="Games"

	# Build GUI
	cmake -S $_pkgname -B buildqt \
	-Wno-dev \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DENABLE_USER_BUILD=ON \
	-DENABLE_VULKAN=ON \
	-DENABLE_QT_GUI=ON \
	-GNinja

	# Build CLI
	cmake -S $_pkgname -B build \
	-Wno-dev \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DENABLE_USER_BUILD=ON \
	-DENABLE_VULKAN=ON \
	-DENABLE_QT_GUI=OFF \
	-GNinja

	cmake --build build

	cmake --build buildqt
}

package() {
	cd "$srcdir"
	install -vDm 755 "build/$_executable_name" "$pkgdir/usr/bin/$_install_name"
	install -vDm 755 "buildqt/$_executable_name" "$pkgdir/usr/bin/$_install_name-qt"
	install -vDm 644 "panda3ds.desktop" "$pkgdir/usr/share/applications/panda3ds.desktop"
	install -vDm 644 "Panda3DS/docs/img/Alber.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/panda3ds.png"
	sed -i 's/Exec=panda3ds-qt/Exec=env QT_QPA_PLATFORM=xcb panda3ds-qt/g' "$pkgdir/usr/share/applications/panda3ds.desktop"
}
