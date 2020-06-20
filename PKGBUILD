#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=vegastrike-engine-stable-git
pkgver=rev.13788
pkgrel=1
pkgdesc="A spaceflight simulator in massive universe"
arch=('i686' 'x86_64')
url="www.vega-strike.org"
license=('GPL')
depends=('boost-libs' 'python2' 'freeglut' 'gtk2' 'libvorbis' 'openal' 'sdl' 'glu')
makedepends=('git' 'cmake')
provides=('vegastrike-engine')
conflicts=('vegastrike-engine')
#options=(!makeflags debug !strip)

source=('git+https://github.com/vegastrike/Vega-Strike-Engine-Source#branch=stable_2020')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"/Vega-Strike-Engine-Source
  echo "rev.$(git rev-list --count HEAD)"
}

prepare(){
mkdir -p build
patch -Np1 -i ../py2_2020.patch
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
mkdir -p "${pkgdir}"/usr/bin
  cd build
  mv -vf setup/vssetup setup/vegasettings
  cp -vp {vegastrike,setup/vegasettings,objconv/mesh_tool} "${pkgdir}"/usr/bin
}
