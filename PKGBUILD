# Maintainer: HurricanePootis <hurricane
pkgname=panda3ds
pkgver=0.9
pkgrel=4
pkgdesc="HLE 3DS emulator"
arch=(x86_64)
url="https://github.com/wheremyfoodat/Panda3DS"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'zydis' 'qt6-base' 'libx11' 'hicolor-icon-theme' 'bash' 'sdl2' 'libglvnd')
makedepends=('cmake' 'git' 'boost' 'vulkan-headers' 'gendesk' 'rapidjson')
_commit=8cc9bfbb36b2656f05c38bbb01275ef8c8f43c3e
source=("$pkgname::git+$url.git#commit=$_commit"
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
	"git+https://github.com/fmtlib/fmt.git"
	"git+https://github.com/Panda3DS-emu/fdk-aac.git"
	"cryptoppwin::git+https://github.com/shadps4-emu/ext-cryptoppwin.git"
	"git+https://github.com/panda3ds-emu/oaknut.git"
	#Capstone submodule
	"git+https://github.com/tree-sitter/tree-sitter-cpp.git"
	#Dynarmics zydis submodule
	"zycore::git+https://github.com/zyantific/zycore-c.git"
	#Luv submodules
	"git+https://github.com/lua/lua.git"
	"git+https://github.com/keplerproject/lua-compat-5.3.git"
	"luajit::git+https://github.com/LuaJIT/LuaJIT.git"
	"vulkan1.patch::$url/commit/d30f2646eccb8b5cae895ddc7b3461c11c97701e.patch"
	"vulkan2.patch::$url/commit/d85c963c4e477b86759edbb96e3edcab6eb6db7b.patch"
	)
sha256sums=('a56a7f0e54a20a1d2d4c5ad586efd9c229bca4b1db7fc932c3f4da8733e1dd1a'
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
            'SKIP'
            'SKIP'
            '94792e92c50863a8395741a2d50224e045f74b27402f9279ad69e550c634c66d'
            'f5c9715fcc4e65ed7c9c9b4fb24cd75c7f788e0e0c2cc784f4f22542a3840d31')
validpgpkeys=()

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 < "$srcdir/vulkan1.patch"
	patch -p1 < "$srcdir/vulkan2.patch"
	git submodule init
	#third_party submodules first
	for submodule in {elfio,SDL2,xbyak,toml11,cmrc,glm,discord-rpc,LuaJIT,mio,hydra_core,zep,luv,libuv,miniaudio,teakra,boost,dynarmic,nihstro,Catch2,capstone,hips,metal-cpp,fmt,fdk-aac,cryptoppwin,oaknut};
	do
		git config submodule.third_party/${submodule}.url "$srcdir/${submodule}"
	done
	git config submodule.cpp-httplib.url "$srcdir/cpp-httplib"
	git config submodule.stb.url "$srcdir/stb"
	git config submodule.third_party/cryptopp/cryptopp.url "$srcdir/cryptopp"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/third_party/capstone"
	git submodule init
	git config submodule.suite/audio-sync/vendor/tree-sitter-cpp.url "$srcdir/tree-sitter-cpp"
	git -c protocol.file.allow=always submodule update
	
	cd "$srcdir/$pkgname/third_party/dynarmic/externals/zydis"
	git submodule init
	git config submodule.dependencies/zycore.url "$srcdir/zycore"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/third_party/luv"
	git submodule init
	for submodule in {libuv,luajit,lua,lua-compat-5.3};
	do
		git config submodule.${submodule}.url "$srcdir/$submodule"
	done
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	CFLAGS="$CFLAGS -flto=thin -DNDEBUG"
	CXXFLAGS="$CXXFLAGS -flto=thin -DNDEBUG"
	_cmake_args=(
	-DCMAKE_INSTALL_PREFIX=/usr
	-DCMAKE_BUILD_TYPE=None
	-DBUILD_EXAMPLES=OFF
	-DBUILD_TESTING=OFF
	-DBUILD_TESTS=OFF
	-DENABLE_USER_BUILD=ON
	-DENABLE_VULKAN=OFF
	-DUSE_SYSTEM_SDL2=ON
	-GNinja
	-DCMAKE_C_COMPILER=clang
	-DCMAKE_CXX_COMPILER=clang++
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5
	)

	cmake -S $pkgname -B build ${_cmake_args[@]}

	cmake --build build

	_cmake_args+=(
	-DENABLE_QT_GUI=ON
	)

	cmake -S $pkgname -B buildqt ${_cmake_args[@]}

	cmake --build buildqt

	gendesk -f \
	--pkgname=$pkgname \
	--pkgdesc="$pkgdesc" \
	--name=Panda3DS \
	--exec=panda3ds-qt \
	--icon=panda3ds \
	--terminal=false \
	--categories="Games"
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/build/Alber" "$pkgdir/usr/lib/$pkgname/$pkgname"
	install -Dm755 "$srcdir/buildqt/Alber" "$pkgdir/usr/lib/$pkgname/$pkgname-qt"
	install -Dm644 "$srcdir/$pkgname/docs/img/Alber.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
	install -dm755 "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/usr/bin/env bash
cd "\$HOME/.config" || exit
[[ ! -d "\$HOME/.config/$pkgname" ]] && mkdir $pkgname
cd "\$HOME/.config/$pkgname" || exit

cd "\$HOME/.config/$pkgname" || exit
/usr/lib/$pkgname/$pkgname "\$@"
wait
exit
EOF

	cat > "$pkgdir/usr/bin/$pkgname-qt" <<EOF
#!/usr/bin/env bash

cd "\$HOME/.config/" || exit
[[ ! -d "\$HOME/.config/$pkgname" ]] && mkdir $pkgname
cd "\$HOME/.config/$pkgname" || exit

QT_QPA_PLATFORM=xcb /usr/lib/$pkgname/$pkgname-qt "\$@"
wait
exit
EOF
	chmod 755 "$pkgdir/usr/bin/$pkgname"
	chmod 755 "$pkgdir/usr/bin/$pkgname-qt"

	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
