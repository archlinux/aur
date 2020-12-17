# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>

pkgname=trenchbroom-git
pkgver=v2020.2.r309.gf26c4a298
pkgrel=1
pkgdesc="TrenchBroom is a modern cross-platform level editor for Quake-engine based games."
arch=("i686" "x86_64")
url="http://kristianduske.com/trenchbroom"
license=("GPLv3")

makedepends=("git" "pandoc" "qt5-base" "cmake" "ninja" "qt5-svg" "libxcb")
depends=("freeimage" "freetype2" "mesa" "libgl" "freeglut" "libxxf86vm" "glew" "glm")
conflicts=("trenchbroom")
provides=("trenchbroom")

source=("trenchbroom::git+https://github.com/kduske/TrenchBroom.git#branch=master"
	trenchbroom.desktop)

sha1sums=('SKIP'
          '028252ac86ec7f733e94589062eb316224887bd4')

pkgver() {
  cd "trenchbroom"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd trenchbroom
  git submodule update --init --recursive
}

_BUILDDIR=build

build() {
	mkdir -p "$_BUILDDIR"
	cd "$_BUILDDIR"
	cmake "$srcdir/trenchbroom" -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release
	QT_QPA_PLATFORM=offscreen cmake --build . --target TrenchBroom
}

package() {
	install -Dm644 trenchbroom.desktop "${pkgdir}/usr/share/applications/trenchbroom.desktop"
	cd "${srcdir}/$_BUILDDIR"
	make DESTDIR="${pkgdir}" install
	install -Dm644 "${srcdir}/trenchbroom/app/resources/linux/icons/icon_256.png" "${pkgdir}/usr/share/pixmaps/trenchbroom.png"
}
