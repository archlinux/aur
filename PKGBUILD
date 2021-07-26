#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=meshlab
pkgver=2021.07
_pkgver_vcg=${pkgver}
pkgrel=1
pkgdesc="System for processing and editing of unstructured 3D models arising in 3D scanning (qt5 version)"
arch=('i686' 'x86_64')
url="https://www.meshlab.net"
license=('GPL2')
depends=('bzip2' 'glew' 'glu' 'openssl-1.0' 'qt5-base' 'qt5-declarative' 'qt5-script' 'qt5-xmlpatterns' 'xerces-c')
makedepends=('cmake' 'eigen' 'ninja' 'git' 'muparser' 'levmar' 'lib3ds' 'mpir')
optdepends=('u3d: for U3D and IDTF file support'
            'lib3ds: for Autodesk`s 3D-Studio r3 and r4 .3DS file support'
            'levmar: for isoparametrization and mutualcorrs plugins'
            'muparser: for filer_func plugins'
            'mpir: for Constructive Solid Geometry operation filters')
#also create openctm(aur) jhead-lib structuresynth-lib to handle last dep
source=("$pkgname::git+https://github.com/cnr-isti-vclab/meshlab.git#tag=Meshlab-${pkgver}"
        "vcglib::git+https://github.com/cnr-isti-vclab/vcglib.git#tag=${_pkgver_vcg}"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  prepare_submodule
}


build() {
  local cmake_flags=( '-DALLOW_SYSTEM_QHULL=OFF'
                      '-DCMAKE_INSTALL_PREFIX=/usr'
                      '-DCMAKE_BUILD_TYPE=Release'
                    )
  cmake "${cmake_flags[@]}" -G Ninja -B "${srcdir}/build" -S "${srcdir}/meshlab/src"
# shellcheck disable=SC2046 # allow MAKEFLAGS to split when passing multiple flags.
 ninja $(grep -oP -- '-+[A-z]+ ?[0-9]*'<<<"${MAKEFLAGS:--j1}") -C "${srcdir}/build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "${srcdir}/build" install
}

# Generated with git_submodule_PKGBUILD_conf.sh ( https://gist.github.com/bartoszek/41a3bfb707f1b258de061f75b109042b )
# Call prepare_submodule in prepare() function

prepare_submodule() {
  git -C "$srcdir/meshlab" config submodule.src/vcglib.url "$srcdir/vcglib"
  git -C "$srcdir/meshlab" config submodule.src/external/nexus.url "$srcdir/nexus"
  git -C "$srcdir/meshlab" submodule update --init
  git -C "$srcdir/meshlab/src/external/nexus" config submodule.src/corto.url "$srcdir/corto"
  git -C "$srcdir/meshlab/src/external/nexus" submodule update --init
}
source+=(
# "vcglib::git+https://github.com/cnr-isti-vclab/vcglib.git"
  "nexus::git+https://github.com/cnr-isti-vclab/nexus.git"
  "corto::git+https://github.com/cnr-isti-vclab/corto.git"
)

# vim:set ts=2 sw=2 et:
