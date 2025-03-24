# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Baal <weiss.sebastian@gmx.net>
pkgname=theforceengine
pkgver=1.22.100
pkgrel=1
pkgdesc='Modern "Jedi Engine" replacement supporting Dark Forces, mods, and in the future Outlaws.'
arch=('x86_64')
url="https://theforceengine.github.io/"
license=('GPL-2.0-only')
depends=('gcc-libs'
         'glew'
         'glibc'
         'hicolor-icon-theme'
         'libgl'
         'rtaudio'
         'rtmidi'
         'sdl2'
         'sdl2_image')
makedepends=("cmake")
optdepends=('kdialog: display file dialogs using QT'
            'zenity: display file dialogs using GTK')
install="theforceengine.install"
source=("TheForceEngine-$pkgver.tar.gz::https://github.com/luciusDXL/TheForceEngine/archive/refs/tags/v$pkgver.tar.gz"
        "theforceengine.install")
sha256sums=('31c4a988efeb5606c1cae45fb7f8d313ea387019f5b3ef423cace000d75de0bf'
            '5e1c92324e453a21b44d7252b44d8d0a2e057f75050f0387f6fc5b9edee4c023')

prepare() {
	cd "TheForceEngine-$pkgver"
	sed -i 's/-DBUILD_FORCE_SCRIPT/-DBUILD_FORCE_SCRIPT -Wno-error=format-security/' CMakeLists.txt
	#The makepkg.conf default will cause the build to fail.
}

build() {
	cmake -B build \
		-S "TheForceEngine-$pkgver" \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev \
		-G "Unix Makefiles" \
		-DENABLE_EDITOR=ON
	cmake --build build
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
