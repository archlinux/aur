#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=vegastrike-engine-release-git
pkgver=rev.14562
pkgrel=1
pkgdesc="A spaceflight simulator in massive universe"
arch=('i686' 'x86_64')
url="www.vega-strike.org"
license=('GPL')
depends=('boost-libs' 'python' 'freeglut' 'gtk3' 'openal' 'sdl' 'glu')
#optdepends=('vegastrike-data: original dataset')
makedepends=('git' 'cmake')
provides=('vegastrike-engine')
conflicts=('vegastrike-engine')
#install=$pkgname.install
#options=(!makeflags debug !strip)

source=('git+https://github.com/vegastrike/Vega-Strike-Engine-Source#branch=0.8.x')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"/Vega-Strike-Engine-Source
  echo "rev.$(git rev-list --count HEAD)"
}

prepare(){
#PR patches here.
cd "${srcdir}"/Vega-Strike-Engine-Source
#patch -Np1 -i ../../install.patch

cd ..
#personal patches
mkdir -p build
#for now, these two patches modify the same line in CMakelists.txt
#patch -Np1 -i ../py2.patch
}

build(){
	cd build
	cmake ../Vega-Strike-Engine-Source/engine/ \
	-DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
	-DENABLE_PIE=ON \
	-DUSE_SYSTEM_BOOST=ON \
	-DUSE_PYTHON_3=ON 
	make
}

package() {
#mkdir -p "${pkgdir}"/usr/bin
#  cd build
#  mv -vf setup/vssetup setup/vegasettings
#  cp -vp {vegastrike,setup/vegasettings,objconv/mesh_tool} "${pkgdir}"/usr/bin
make -C build DESTDIR="${pkgdir}" install
}
