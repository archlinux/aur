# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
# Contributor: Retro Gamer <https://github.com/eGax>

pkgname=trenchbroom-git
pkgver=main_branch
pkgrel=1
pkgdesc="TrenchBroom is a modern cross-platform level editor for Quake-engine based games."
arch=("i686" "x86_64")
url="https://trenchbroom.github.io/"
license=("GPLv3")

makedepends=("git" "pandoc" "qt5-base" "cmake" "ninja" "qt5-svg" "libxcb" "zip")
depends=("freeimage" "freetype2" "mesa" "libgl" "freeglut" "libxxf86vm" "glew" "glm")
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
	install -Dm644 trenchbroom.desktop "${pkgdir}/usr/share/applications/trenchbroom.desktop"
	cd "${srcdir}/$_BUILDDIR"
	make DESTDIR="${pkgdir}" install
	install -Dm644 "${srcdir}/trenchbroom/app/resources/linux/icons/icon_256.png" "${pkgdir}/usr/share/pixmaps/trenchbroom.png"
}
