# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-panda3ds
pkgname=$_pkgname-git
pkgver=0.8.5.r19.g3787358b
pkgrel=1
pkgdesc="Nintendo 3DS core"
arch=('x86_64')
url="https://panda3ds.com/"
license=('GPL-3.0-only')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info>=1.19.0.r8')
makedepends=('cmake' 'git' 'libxext')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!lto')
source=(
	'Panda3DS::git+https://github.com/wheremyfoodat/Panda3DS.git'
	'capstone::git+https://github.com/capstone-engine/capstone.git'
	'cmrc::git+https://github.com/vector-of-bool/cmrc.git'
	'cryptopp::git+https://github.com/weidai11/cryptopp.git'
	'ELFIO::git+https://github.com/serge1/ELFIO.git'
	'fmt::git+https://github.com/fmtlib/fmt.git'
	'miniaudio::git+https://github.com/mackron/miniaudio.git'
	'mio::git+https://github.com/vimpunk/mio.git'
	'panda3ds-boost::git+https://github.com/Panda3DS-emu/ext-boost.git'
	'panda3ds-dynarmic::git+https://github.com/Panda3DS-emu/dynarmic.git'
	'panda3ds-fdk-aac::git+https://github.com/Panda3DS-emu/fdk-aac.git'
	'SDL::git+https://github.com/libsdl-org/SDL.git'
	'stb::git+https://github.com/nothings/stb.git'
	'teakra::git+https://github.com/wwylele/teakra.git'
	'toml11::git+https://github.com/ToruNiina/toml11.git'
	'xbyak::git+https://github.com/herumi/xbyak.git'
)
b2sums=(
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
)

pkgver() {
	cd Panda3DS
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd Panda3DS
	git config submodule.stb.url ../stb
	git config submodule.third_party/boost.url ../panda3ds-boost
	git config submodule.third_party/capstone.url ../capstone
	git config submodule.third_party/cmrc.url ../cmrc
	git config submodule.third_party/cryptopp/cryptopp.url ../cryptopp
	git config submodule.third_party/dynarmic.url ../panda3ds-dynarmic
	git config submodule.third_party/elfio.url ../ELFIO
	git config submodule.third_party/fdk-aac.url ../panda3ds-fdk-aac
	git config submodule.third_party/fmt.url ../fmt
	git config submodule.third_party/miniaudio.url ../miniaudio
	git config submodule.third_party/mio.url ../mio
	git config submodule.third_party/SDL2.url ../SDL
	git config submodule.third_party/teakra.url ../teakra
	git config submodule.third_party/toml11.url ../toml11
	git config submodule.third_party/xbyak.url ../xbyak
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake -B build -S Panda3DS \
		-DBUILD_LIBRETRO_CORE=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DDYNARMIC_USE_BUNDLED_EXTERNALS=ON \
		-DENABLE_DISCORD_RPC=OFF \
		-DENABLE_LUAJIT=OFF \
		-DENABLE_USER_BUILD=ON \
		-DENABLE_VULKAN=OFF \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/panda3ds_libretro.so
}
