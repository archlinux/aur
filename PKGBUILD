#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=vegastrike-engine-git
pkgver=rev.15042
pkgrel=1
pkgdesc="A spaceflight simulator in massive universe"
arch=('i686' 'x86_64')
url="www.vega-strike.org"
license=('GPL')
depends=('boost' 'python' 'freeglut' 'gtk3' 'libvorbis' 'openal' 'sdl' 'glu')
#optdepends=('vegastrike-data: original dataset')
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
echo "Prepare section"
cd "${srcdir}"/Vega-Strike-Engine-Source
#git revert --no-commit 04f99ab64535fc0146a90ac9e226d71cbbac0095
#git revert -m 2 --no-commit 59deb3002e69a9f443d6d7ba1bb61c31f898fa7f
cd ..
pwd

mkdir -p build
#patch -Np1 -i ../mesh_tool_install.patch
}

build(){
	cd build
	cmake ../Vega-Strike-Engine-Source/engine/ \
	-DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
	-DENABLE_PIE=ON 
	make
}

package() {
#Hopefully we are done horsing around with this now. 

#mkdir -p "${pkgdir}"/usr/bin
#  cd build
#  cp -vp {vegastrike,setup/vegasettings,objconv/mesh_tool} "${pkgdir}"/usr/bin
#
#This should be the only way to install
make -C build DESTDIR="${pkgdir}" install
rm -rf ${pkgdir}/usr/include
rm -rf ${pkgdir}/usr/lib
}
