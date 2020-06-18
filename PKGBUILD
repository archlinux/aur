#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=vegastrike-py2-engine-git
pkgver=rev.13926
pkgrel=1
pkgdesc="A spaceflight simulator in massive universe, python2 version"
arch=('i686' 'x86_64')
url="www.vega-strike.org"
license=('GPL')
depends=('boost-libs' 'python' 'freeglut' 'gtk2' 'libvorbis' 'openal' 'sdl' 'glu')
makedepends=('git' 'cmake')
provides=('vegastrike-engine')
conflicts=('vegastrike-engine')
#install=$pkgname.install
#options=(!makeflags debug !strip)

source=('git+https://github.com/vegastrike/Vega-Strike-Engine-Source')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"/Vega-Strike-Engine-Source
  echo "rev.$(git rev-list --count HEAD)"
}

prepare(){
mkdir -p build
patch -Np1 -i ../python2_compile.patch
patch -Np1 -i ../vegastrike_install.patch
patch -Np1 -i ../vegasettings_install.patch
patch -Np1 -i ../mesh_tool_install.patch
#patch -Np1 -i ../vector_double.patch
}

build(){
	cd build
	cmake ../Vega-Strike-Engine-Source/engine/ \
	-DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
	-DENABLE_PIE=ON \
	-DUSE_PYTHON_3=OFF
	make
}

package() {
#mkdir -p "${pkgdir}"/usr/bin
#  cd build
#  cp -vp {vegastrike,setup/vegasettings,objconv/mesh_tool} "${pkgdir}"/usr/bin
make -C build DESTDIR="${pkgdir}" install
}
