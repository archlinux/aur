# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=meshlab-git
pkgver=2020.01.r0.g84dd7577
pkgrel=1
pkgdesc="System for processing and editing of unstructured 3D models arising in 3D scanning (qt5 version)"
arch=('i686' 'x86_64')
url="https://www.meshlab.net"
conflicts=('meshlab')
provides=('meshlab')
license=('GPL2')
depends=('bzip2' 'desktop-file-utils' 'glu' 'openssl-1.0' 'qt5-base' 'qt5-declarative' 'qt5-script' 'qt5-xmlpatterns')
makedepends=('cmake' 'ninja' 'git' 'muparser' 'levmar' 'lib3ds' 'mpir')
optdepends=('u3d: for U3D and IDTF file support'
            'lib3ds: for Autodesk`s 3D-Studio r3 and r4 .3DS file support'
            'levmar: for isoparametrization and mutualcorrs plugins'
            'muparser: for filer_func plugins'
            'mpir: for Constructive Solid Geometry operation filters')
#also create openctm(aur) jhead-lib structuresynth-lib to handle last dep
install="${pkgname}.install"
source=("git+https://github.com/cnr-isti-vclab/meshlab.git"
        "git+https://github.com/cnr-isti-vclab/vcglib.git#branch=devel"
        "meshlab.desktop")
sha256sums=('SKIP'
            'SKIP'
            '030ab1dcafb7d793bed3bc455497208addadf1091a4619576fe7e044aed4231a')

pkgver() {
  cd ${srcdir}/${pkgname%-git}
  git describe --long --tags | sed 's/Meshlab-\([0-9]*-[0-9]*\)-[a-z0-9]*-/\1-/g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir "${srcdir}/build"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -G Ninja -B "${srcdir}/build" "${srcdir}/meshlab/src"
  cd "${srcdir}/build"
  ninja $([ -v MAKEFLAGS ] || echo -j1)
}

package() {
  cd "${srcdir}/build"
  DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:
