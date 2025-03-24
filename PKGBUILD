#Maintainer: Evert Vorster <evorster@gmail.com>
pkgname=vegastrike-engine-git
pkgver=0.9.0.alpha1.r273.g38befe948
pkgrel=1
pkgdesc="A spaceflight simulator in massive universe"
arch=('i686' 'x86_64')
url="https://www.vega-strike.org"
license=('GPL-3.0-only')
depends=('boost-libs' 'python' 'freeglut' 'gtk3' 'libvorbis' 'openal' 'sdl2' 'glu')
#optdepends=('vegastrike-data: original dataset')
makedepends=('git' 'cmake' 'boost')
provides=('vegastrike-engine')
conflicts=('vegastrike-engine')
#install=$pkgname.install
#Options to make debugging easier
#options=(!makeflags debug !strip)

source=('git+https://github.com/vegastrike/Vega-Strike-Engine-Source'
)
sha1sums=('SKIP'
)

pkgver() {
  cd "${srcdir}"/Vega-Strike-Engine-Source
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#  echo "rev.$(git rev-list --count HEAD)"
}

prepare(){
echo "Prepare section"
  cd "${srcdir}"/Vega-Strike-Engine-Source
### Git operations for testing various branches
##git checkout -b stephengtuggy-refac/boost_program_options_0.10.x master
##git pull https://github.com/stephengtuggy/Vega-Strike-Engine-Source.git refac/boost_program_options_0.10.x
#git pull origin master
#git checkout master
#git merge origin/task_armor_2
#git push origin master
##
#    git pull origin master
#    git checkout master
#    git merge origin/task_fix_969	
  cd ..
  mkdir -p build
}

build(){
#        export CC=gcc-12 CXX=g++-12
	cd build
	cmake ../Vega-Strike-Engine-Source/ \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_GTEST=OFF \
        -DUSE_GTEST=OFF   \
	-DENABLE_PIE=ON 
	make
}

package() {
make -C build DESTDIR="${pkgdir}" install
rm -rf ${pkgdir}/usr/include
rm -rf ${pkgdir}/usr/lib
}
