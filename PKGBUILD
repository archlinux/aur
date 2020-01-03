# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Thomas Kowaliczek-Schmer <thomas.kowaliczek@posteo.de>
pkgname=fife-git
provides=("fife" "fife-svn")
conflicts=("fife" "fife-svn")
pkgdesc="The mission of the FIFE project is to create a cross platform game creation framework"
url="http://www.fifengine.net/"
pkgver=0.4.2.r25.gc29d418a
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
depends=('boost' 'fifechan>=0.1.4' 'glew' 'python' 'python-future'
         'libgl' 'libogg' 'libpng' 'libvorbis'
         'sdl2' 'sdl2_ttf' 'sdl2_image' 'openal' 'tinyxml' 'zlib')
# # # TO BUILD WITH swig<4 SIMPLY REMOVE THE PATCH FROM prepare() # # #
makedepends=('cmake' 'git' 'swig>=4')
source=(git+https://github.com/fifengine/fifengine.git
	"swig4.patch")
md5sums=('SKIP'
         '05b0425ae3a94a36b9227f51c09c23aa')
sha1sums=('SKIP'
          '0302be0b353e6aa69a81a8e8c872239ecbcab1d0')


pkgver() {
  cd "$srcdir/fifengine"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/fifengine"
  patch -p1 -i "${srcdir}/swig4.patch"
}

build() {
  cd "$srcdir/fifengine"
  # [TODO] Due to severe laziness, I have not tested in-source builds yet
  [[ -d "build" ]] && rm -r "build"
  mkdir -p "build" && cd "build"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -Dcegui=OFF ..
  # to build C/C++ version comment this in and the line above out.
  # cmake -Dbuild-library=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib ..
  make
}

package() {
  cd "$srcdir/fifengine"
  cd "build"
  make DESTDIR=$pkgdir install
}
