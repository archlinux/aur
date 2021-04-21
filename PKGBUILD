# Maintainer: evorster <evorster@gmail.com>
# Contributor: bartus
# Contributor: ZKenJ <zkenjm@gmail.com>
# Contributor: Cilyan
# Contributor: Dan Serban
# Contributor: sjewo
# Contributor: Theo Nicolau
# shellcheck disable=SC2034,SC2154


pkgname=slowmovideo-git
pkgver=0.6.r8.g279026a
pkgrel=1
pkgdesc="Video slow motion effect via interpolation"
arch=('i686' 'x86_64')
url="http://slowmovideo.granjow.net/index.html"
license=('GPL')
depends=('opencv' 'qt5-script')
optdepends=('v3d-flow-builder')
makedepends=('cmake' 'git')
provides=('slowmovideo')
conflicts=('slowmovideo')
source=('git+https://github.com/slowmoVideo/slowmoVideo.git'
	'git+https://github.com/slowmoVideo/libsvflow.git'
	'OpenCV4_compile.patch')
md5sums=('SKIP'
         'SKIP'
         'bb8ca1d30cdeb5922c783d27c057ae1b')
#install=$pkgname.install

prepare(){
  git -C slowmoVideo config submodule.src/lib/libsvflow.url "${srcdir}"/libsvflow
  git -C slowmoVideo submodule update --init --recursive --remote
#  git -C slowmoVideo apply "${srcdir}"/OpenCV4_compile.patch
  cd "${srcdir}"
  mkdir -p build
}

pkgver() {
  git -C slowmoVideo describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/build
  export LDFLAGS="-lX11 ${LDFLAGS}"
  cmake ../slowmoVideo -DUSE_QTKIT=FALSE -DENABLE_TESTS=FALSE -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make 
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
