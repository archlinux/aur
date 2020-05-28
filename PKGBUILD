#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=meshlab
pkgver=2020.05
pkgrel=1
pkgdesc="System for processing and editing of unstructured 3D models arising in 3D scanning (qt5 version)"
arch=('i686' 'x86_64')
url="http://www.meshlab.net"
license=('GPL2')
depends=('bzip2' 'glew' 'glu' 'openssl-1.0' 'qt5-base' 'qt5-declarative' 'qt5-script' 'qt5-xmlpatterns')
makedepends=('cmake' 'eigen3' 'ninja' 'git' 'muparser' 'levmar' 'lib3ds' 'mpir')
optdepends=('u3d: for U3D and IDTF file support'
            'lib3ds: for Autodesk`s 3D-Studio r3 and r4 .3DS file support'
            'levmar: for isoparametrization and mutualcorrs plugins'
            'muparser: for filer_func plugins'
            'mpir: for Constructive Solid Geometry operation filters')
#also create openctm(aur) jhead-lib structuresynth-lib to handle last dep
source=("$pkgname::git+https://github.com/cnr-isti-vclab/meshlab.git"
        "vcglib::git+https://github.com/cnr-isti-vclab/vcglib.git"
        )
sha256sums=('SKIP'
            'SKIP'
            )

prepare() {
  git -C "${srcdir}/${pkgname}" submodule init
  git -C "${srcdir}/${pkgname}" config submodule.vcglib.url "$srcdir"/vcglib
  git -C "${srcdir}/${pkgname}" submodule update
}


build() {
  local cmake_flags=( '-DALLOW_SYSTEM_QHULL=OFF'
                      '-DCMAKE_INSTALL_PREFIX=/usr'
                    )
  cmake "${cmake_flags[@]}" -G Ninja -B "${srcdir}/build" -S "${srcdir}/meshlab/src"
# shellcheck disable=SC2086 # allow MAKEFLAGS to split when passing multiple flags.
  ninja ${MAKEFLAGS:--j1} -C "${srcdir}/build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "${srcdir}/build" install
}

# vim:set ts=2 sw=2 et:
