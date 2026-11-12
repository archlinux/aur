# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
# Contributor: Retro Gamer <https://github.com/eGax>
# Contributor: matrixDoppelganger <www.kinker31.com>

pkgname=trenchbroom-git
pkgver=v2025.3.r2218.g8f329f11e
pkgrel=2
pkgdesc="TrenchBroom is a modern cross-platform level editor for Quake-engine based games. (Git-nightly release)"
arch=("i686" "x86_64")
url="https://trenchbroom.github.io/"
license=("GPLv3")

makedepends=("git" "pandoc" "cmake" "ninja" "libxcb" "zip" "unzip")
depends=("qt6-base" "qt6-svg" "freeimage" "freetype2" "mesa" "libgl" "freeglut" "libxxf86vm" "glew" "glm" "tinyxml2")
conflicts=("trenchbroom")
provides=("trenchbroom")

source=("trenchbroom::git+https://github.com/TrenchBroom/TrenchBroom.git#branch=master"
	trenchbroom.desktop)

sha1sums=('SKIP'
          '028252ac86ec7f733e94589062eb316224887bd4')

pkgver() {
  cd "trenchbroom"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd trenchbroom
	# cmake requires a CmakeLists.txt from this submodule
	# -c submodule."lib/BinaryLibs".active=0
  git -c submodule."lib/freetype/freetype-windows-binaries".active=0 submodule update --init --recursive
  # sed commands deal with cmake-related shenanigans
  sed -i '/strip-msvc-flags\.patch/d' \
    cmake/dependencies/assimp.cmake \
    cmake/dependencies/cpptrace.cmake \
    cmake/dependencies/miniz.cmake
}

_BUILDDIR=build

build() {
	mkdir -p "$_BUILDDIR"
	cd "$_BUILDDIR"
	cmake "$srcdir/trenchbroom" -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="cmake/packages"
	cmake --build . --target TrenchBroom
}

package() {
	install -Dm644 trenchbroom.desktop "${pkgdir}/usr/share/applications/trenchbroom.desktop"
	cd "${srcdir}/$_BUILDDIR"
	DESTDIR="${pkgdir}" cmake --install .
	install -Dm644 "${srcdir}/trenchbroom/app/TrenchBroom/resources/linux/icons/icon_256.png" "${pkgdir}/usr/share/pixmaps/trenchbroom.png"
}
