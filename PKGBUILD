# Maintainer: evorster <evorster@gmail.com>
# Contributor: bartus
# Contributor: ZKenJ <zkenjm@gmail.com>
# Contributor: Cilyan
# Contributor: Dan Serban
# Contributor: sjewo
# Contributor: Theo Nicolau
# shellcheck disable=SC2034,SC2154


pkgname=slowmovideo-git
pkgver=0.6.1.r0.g6491047
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
	'git+https://github.com/slowmoVideo/libsvflow.git')
md5sums=('SKIP'
         'SKIP')

prepare(){
  git -C slowmoVideo config submodule.src/lib/libsvflow.url "${srcdir}"/libsvflow
  git -C slowmoVideo -c protocol.file.allow=always submodule update --init --recursive --remote
}

pkgver() {
  git -C slowmoVideo describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export LDFLAGS="-lX11 ${LDFLAGS}"
  cmake -S slowmoVideo -B build -DUSE_QTKIT=FALSE -DENABLE_TESTS=FALSE -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
