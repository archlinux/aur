# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
# Contributor: Retro Gamer <https://github.com/eGax>

pkgname=trenchbroom-bin
pkgver=v2024.2.26.g1877724f3
pkgrel=2
pkgdesc="TrenchBroom is a free (GPLv3+), cross platform level editor supporting Daikatana, D-DayNormandy, Digital Paintball 2, Half-life, Heretic 2, Hexen 2, Kingpin, Neverball, Quake, Quake 2, Quake 3, Quetoo, and Wrath."
arch=("x86_64")
url="https://trenchbroom.github.io/"
license=("GPL3")

makedepends=("git" "pandoc" "qt6-base" "cmake" "ninja" "qt6-svg" "libxcb" "zip" "unzip")
depends=("freeimage" "freetype2" "mesa" "libgl" "freeglut" "libxxf86vm" "glew" "glm" "tinyxml2")
conflicts=("trenchbroom" "trenchbroom-git")
provides=("trenchbroom")

source=("trenchbroom::git+https://github.com/TrenchBroom/TrenchBroom.git#branch=4753-2")

sha1sums=('SKIP')

pkgver() {
  cd "trenchbroom"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd trenchbroom
	# cmake requires a CmakeLists.txt from this submodule
	# -c submodule."lib/BinaryLibs".active=0
  git -c submodule."lib/freetype/freetype-windows-binaries".active=0 submodule update --init --recursive
}

_BUILDDIR=build

build() {
	mkdir -p "$_BUILDDIR"
	cd "$_BUILDDIR"
	cmake "$srcdir/trenchbroom" -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="cmake/packages" -DCMAKE_TOOLCHAIN_FILE="vcpkg/scripts/buildsystems/vcpkg.cmake"
	# we were running into weird xcb errors, which made this necessary to force headless builds
	# might be useful incase you ARE building on a headless system
	#QT_QPA_PLATFORM=offscreen cmake --build . --target TrenchBroom
	cmake --build . --target TrenchBroom
}

package() {
	install -Dm644 "${srcdir}/trenchbroom/app/resources/linux/trenchbroom.desktop" "${pkgdir}/usr/share/applications/trenchbroom.desktop"
	cd "${srcdir}/$_BUILDDIR"
	make DESTDIR="${pkgdir}" install
	install -Dm644 "${srcdir}/trenchbroom/app/resources/linux/icons/icon_256.png" "${pkgdir}/usr/share/pixmaps/trenchbroom.png"
}
