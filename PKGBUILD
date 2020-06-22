#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_name=openmvs
_tag=v1.1
_fragment="#tag=${_tag}"
pkgname=${_name}
pkgver=${_tag#v}
pkgrel=1
pkgdesc="Open Multi-View Stereo reconstruction library with simple and automatic set of tools"
arch=(i686 x86_64)
url="http://cdcseacave.github.io/openMVS"
license=(GPL)
depends=(glew glfw suitesparse blas google-glog opencv boost-libs qt5-base)
makedepends=(git cmake ninja cuda boost gflags eigen ceres-solver cgal nvidia-utils)
optdepends=('nvidia-utils: GPU optimized mesh reconstruction code')
options=()
source=("${pkgname}::git+https://github.com/cdcseacave/openMVS.git${_fragment}"
        "vcglib::git+https://github.com/cdcseacave/VCG.git"
        )
sha256sums=('SKIP'
            'SKIP'
           )

pkgver() {
  # cutting off 'v' prefix that presents in the git tag
  git -C "$srcdir"/$pkgname describe --tag | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
  CMAKE_FALGS+=(
                -DCMAKE_BUILD_TYPE=Release
                -DCMAKE_INSTALL_PREFIX=/usr
                -DINSTALL_BIN_DIR=/usr/bin
                -DVCG_ROOT="${srcdir}/vcglib"
               )
  cmake "${CMAKE_FALGS[@]}" -S "$srcdir"/$pkgname -B build -G Ninja
# shellcheck disable=SC2046 # allow MAKEFLAGS to split when passing multiple flags.
  ninja -C "$srcdir"/build $(grep -oP -- '-+[A-z]+ ?[0-9]*'<<<"${MAKEFLAGS:--j1}")
}

package() {
  DESTDIR="$pkgdir/" ninja -C "$srcdir"/build install
}

# vim:set ts=2 sw=2 et:
