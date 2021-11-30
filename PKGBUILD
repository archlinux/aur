# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Mufeed Ali <lastweakness@tuta.io>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: Geert Custers <geert.aj.custers@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=glportal
pkgver=0.0.7.2
pkgrel=2
pkgdesc='OpenGL puzzle game inspired by Portal'
arch=('i686' 'x86_64')
url='https://glportal.de/'
license=('custom')
depends=('sdl2_mixer' 'freeimage' 'mesa' 'qt5-base' 'assimp' 'tinyxml2' 'bullet' 'libepoxy')
makedepends=('git' 'cmake')
conflicts=('glportal-git')
source=("${pkgname}::git+https://github.com/GlPortal/glPortal.git#commit=50298e61f22503b8f74d4e44cdebc08d7532a4c4")
md5sums=('SKIP')

prepare() {
	cd "${pkgname}"
	git submodule update --init --recursive
	sed -i '3i #include <stdexcept>' external/RadixEngine/source/data/screen/XmlScreenLoader.cpp
}

build() {
	cmake -Wno-dev -Wno-deprecated \
	      -B "${pkgname}/build" \
	      -S "${pkgname}" \
	      -G "Unix Makefiles" \
	      -DOpenGL_GL_PREFERENCE=GLVND \
	      -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DCMAKE_SKIP_RPATH=YES \
	      -DCMAKE_SKIP_INSTALL_RPATH=YES
	make -C "${pkgname}/build"
}

package() {
	make DESTDIR="${pkgdir}" -C "${pkgname}/build" install
	rm "${pkgdir}/usr/LICENSE.APACHE" && rm "${pkgdir}/usr/LICENSE.MIT"
	install -Dm644 "${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
