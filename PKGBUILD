# Maintainer: Felix Schindler <aur at felixschindler dot net>

pkgname=netgen-git
pkgver=r1081.5f29387
pkgrel=1
pkgdesc="An automatic 3d tetrahedral mesh generator."
url=https://sourceforge.net/projects/netgen-mesher/
license=('LGPL2.1')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake')
depends=('python' 'boost' 'tk' 'libxmu' 'opencascade' 'ffmpeg' 'openmpi' 'metis')
options=('!buildflags')
provides=('netgen')
conflicts=('netgen-nogui')
source=("${pkgname%-git}::git+http://git.code.sf.net/p/netgen-mesher/git#branch=master"
        "netgen.PATH")
md5sums=('SKIP'
         'ae799b81edf32652c31d2f6061f1f966')

pkgver() {
  cd "${srcdir}"/${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/${pkgname%-git}
  mkdir build && cd build
  cmake -DINSTALL_DIR="${pkgdir}/opt/netgen" -DCMAKE_BUILD_TYPE=RELEASE -DUSE_JPEG=ON -DUSE_MPEG=ON -DUSE_MPI=ON -DUSE_OCC=ON ..
  make
}

package() {
  cd "${srcdir}"/${pkgname%-git}/build
  make install
  install -m644 "${srcdir}/netgen.PATH" "${pkgdir}/opt/netgen.PATH"
}

