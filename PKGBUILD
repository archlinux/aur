# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgname=xapfish
_major=2
_minor=6
_patch=0
pkgver=$_major.$_minor
cemu_tag="v$pkgver"
pkgrel=4
pkgdesc='Software to emulate Wii U games and applications on PC'
arch=(x86_64)
url=https://cemu.info
license=(MPL2)
options+=(!strip)
depends=(
	# unbundled vcpkg
	'boost-libs' 'fmt<13' 'libzip' 'libpng' 'pugixml' 'sdl2' 'wxwidgets-gtk3' 'wayland' 'wayland-protocols'
	'llvm-libs' 'bluez-libs'
)
makedepends=(
	# build setup
	git 'cmake>=3.21.1' 'clang' 'llvm' ninja
	# unbundled vcpkg
	'boost' 'glslang' 'glm' rapidjson
	# direct cemu dependencies
	nasm 'vulkan-headers'
	# wxwidgets
	glu
	# cubeb optional
	libpulse
)
optdepends=(
	'alsa-lib: Audio output'
	'vulkan-driver: Vulkan graphics'
)
install=cemu.install
source=(
	"git+https://github.com/CorySanin/Cemu#tag=${cemu_tag}"
	# Cemu submodules
	git+https://github.com/mozilla/cubeb.git#commit=2071354a69aca7ed6df3b4222e305746c2113f60
	git+https://github.com/ocornut/imgui.git#commit=f65bcf481ab34cd07d3909aab1479f409fa79f2f
	git+https://github.com/Exzap/ZArchive.git#commit=d2c717730092c7bf8cbb033b12fd4001b7c4d932
	# cubeb submodules
	git+https://github.com/arsenm/sanitizers-cmake.git#commit=aab6948fa863bc1cbe5d0850bc46b9ef02ed4c1a
	git+https://github.com/google/googletest.git#commit=800f5422ac9d9e0ad59cd860a2ef3a679588acb4
)
sha512sums=('f44237e596976939103779f904b9a5f6940820ba4d61227f814730c71d975b2c57d44163a017863a4d12f80cf478a8a9a19be08a6ee3e640bccb6b76a2cf8385'
            '01a7e5c89668300beb9c6a75b955b01696a2ad3e3e9137333610743000f202bd7dc2a017aeace8f44936a517041f1652e0fa8fc2ac7a5f138585fb3575570d7a'
            'c7afdacbbb714e2e770955d5b7f9306a1b952a278c9e48f13d2bd1fb21d45e0c7d08a7e6af66a562bd585b21c10c7f486cbf8d302aaa32c91722b50246c2e125'
            '6ac14841ef983fe5202b23ea5c647959a04b9815bb187c0a0141fb14fb3e2edf8ce14b0c43474774d5ff779284f365981e6d45cc011612e5cd8fb429b3accf5e'
            '587d4d3dea948ce2aac33d3250cab0fe322ae892dc4f7261a56ad467c42a3d782d67113dc09ca7e5aff6d92dc9f0879c16dacb6531a4f3c5e5c62a3d6bfe6ab6'
            '8b65394aaf76a693a95cc493c57df3db61a7ac3474ec36596de5c36dd15b11a051ea46e74058bad184e521712dac570aa3b623c1028305f89ebbdde45457ded8')

prepare() {
	cd Cemu

	# cemu submodules
	git rm --ignore-unmatch dependencies/{Vulkan-Headers,vcpkg}
	for submodule in {cubeb,imgui,ZArchive}; do
		git config --file=.gitmodules submodule.dependencies/"${submodule}".url "$srcdir/$submodule"
	done
	git -c protocol.file.allow=always submodule update --init
	pushd dependencies/cubeb > /dev/null
	git config --file=.gitmodules submodule.googletest.url "$srcdir/googletest"
	git config --file=.gitmodules submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
	git -c protocol.file.allow=always submodule update --init
	popd > /dev/null

	# unbundled fmt
	sed -i '/FMT_HEADER_ONLY/d' src/Common/precompiled.h

	# cubeb fix
	sed -i '/find_package(cubeb)/d' CMakeLists.txt

	# glm fix
	sed -i 's/glm::glm/glm/' src/Common/CMakeLists.txt src/input/CMakeLists.txt
}

build() {
	# Upstream prefers a build with clang+llvm and Ninja.

	cd Cemu
	rm -f build/CMakeCache.txt
	local cmake_args=(
		-B build
		-G Ninja
		-Wno-dev
		-DCMAKE_POLICY_VERSION_MINIMUM=3.21.1
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_C_COMPILER=clang
		-DCMAKE_CXX_COMPILER=clang++
		-DCMAKE_CXX_FLAGS="$CXXFLAGS -w"
		-DENABLE_VCPKG=OFF
		-DEMULATOR_VERSION_MAJOR="$_major"
		-DEMULATOR_VERSION_MINOR="$_minor"
		-DEMULATOR_VERSION_PATCH="$_patch"
	)
	cmake "${cmake_args[@]}"
	cmake --build build
}

package() {
	cd Cemu
	install -D bin/Cemu_release "$pkgdir/usr/bin/Xapfish"
	ln -s 'Xapfish' "$pkgdir/usr/bin/xapfish"

	mkdir -p "$pkgdir/usr/share/Xapfish"

	GLOBIGNORE=bin/Cemu_release
	cp -r bin/* "$pkgdir/usr/share/Xapfish"
	unset GLOBIGNORE

	install -Dm644 dist/linux/info.cemu.Xapfish.png -T "$pkgdir/usr/share/icons/hicolor/128x128/apps/xapfish.png"
	install -Dm644 dist/linux/info.cemu.Xapfish.desktop -T "$pkgdir/usr/share/applications/Xapfish.desktop"
}
