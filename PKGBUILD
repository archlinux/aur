# Maintainer: evorster <evorster@gmail.com>
# Contributor: ZKenJ <zkenjm@gmail.com>
# Contributor: Cilyan
# Contributor: Dan Serban
# Contributor: sjewo
# Contributor: Theo Nicolau


pkgname=slowmovideo-git
pkgver=0.5.r136.g6ed913b
pkgrel=1
pkgdesc="Video slow motion effect via interpolation"
arch=('i686' 'x86_64')
url="http://slowmovideo.granjow.net/index.html"
license=('GPL')
depends=('glew' 'opencv' 'qt5-script' 'xdg-utils' 'desktop-file-utils')
makedepends=('cmake' 'git')
provides=('slowmovideo')
conflicts=('slowmovideo')
source=('git+https://github.com/slowmoVideo/slowmoVideo.git'
	'OpenCV4_compile.patch')
md5sums=('SKIP'
         '13b3623678018758691f69520cf361af')
install=$pkgname.install

prepare(){
cd ${srcdir}/slowmoVideo
patch -Np1 -i ${srcdir}/OpenCV4_compile.patch
}

pkgver() {
  cd "${srcdir}"/slowmoVideo
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/slowmoVideo"
  mkdir -p build && cd build
#export PKG_CONFIG_PATH=/usr/lib/opencv2/pkgconfig"
  export LDFLAGS="-lX11 ${LDFLAGS}"
  cmake -DUSE_QTKIT=FALSE -DENABLE_TESTS=FALSE -DCMAKE_INSTALL_PREFIX=/usr ../src
  make
}

package() {
  cd "${srcdir}/slowmoVideo/build"
  make DESTDIR="${pkgdir}" install
}
