# Maintainer: Felix Schindler <aur at felixschindler dot net>

pkgname=netgen-git
pkgver=6.2.2008.r82.gf97601bc
pkgrel=2
pkgdesc="An automatic 3d tetrahedral mesh generator."
url=https://sourceforge.net/projects/netgen-mesher/
license=('LGPL2.1')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake')
depends=('python' 'tk' 'libxmu' 'glu'
        'opencascade'     # USE_OCC=ON
        'ffmpeg'          # USE_MPEG=ON
)
options=('!buildflags')
provides=('netgen')
conflicts=('netgen-nogui')
source=("${pkgname%-git}::git+https://github.com/ngsolve/netgen.git#branch=master")
md5sums=('SKIP')

pkgver() {
  # According to https://wiki.archlinux.org/index.php/VCS_package_guidelines,
  # we are aiming for RELEASE.rREVISION (or rather RELEASE.rREVISION.GIT_HASH).
  # Since netgen releases usually look like 6.2.2008, this should look like
  # 6.2.2008.r82.gf97601bc
  cd "${srcdir}"/${pkgname%-git}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/${pkgname%-git}
  git submodule update --init --recursive
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DNG_INSTALL_DIR_LIB=lib/${pkgname%-git} \
    -DNG_INSTALL_DIR_INCLUDE=include/${pkgname%-git} \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DUSE_JPEG=ON \
    -DUSE_MPEG=ON \
    -DMETIS_DIR=/usr \
    -DUSE_OCC=ON \
    ..

  make
}

package() {
  cd "${srcdir}"/${pkgname%-git}/build
  make DESTDIR="$pkgdir/" install

  # remove reference to srcdir
  sed -i "s;${srcdir}/;;g" ${pkgdir}/usr/lib/cmake/netgen/NetgenConfig.cmake
}

