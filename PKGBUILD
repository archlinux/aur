#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154 # to allow unused/uninitialized variables.

function download_git-lfs {
  local url dir
  url=${1#git-lfs+}
  download_git "$url"
  dir="$SRCDEST/$(get_filename "$url")"
  git -C "$dir" lfs install
  git -C "$dir" lfs fetch
}

function extract_git-lfs {
  url=${1/git-lfs/https}
  extract_git "$url"
}

pkgname=oidn-git
pkgver=1.2.3.r0.ga9e9160
#_fragment="#tag=v${pkgver}"
pkgrel=1
pkgdesc="Intel(R) Open Image Denoise library"
arch=('x86_64')
url="http://www.openimagedenoise.org/"
license=('Apache')
depends=(intel-tbb python)
provides=(openimagedenoise=${pkgver%.r*})
conflicts=(openimagedenoise)
makedepends=(git git-lfs cmake 'ispc>=1.14' ninja)
source=("${pkgname%-git}::git+https://github.com/OpenImageDenoise/oidn.git${_fragment}"
        "git+https://github.com/OpenImageDenoise/mkl-dnn.git"
        "git-lfs+https://github.com/OpenImageDenoise/oidn-weights.git"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  git -C "${srcdir}"/${pkgname%-git} config submodule.mkl-dnn.url "${srcdir}"/mkl-dnn
  git -C "${srcdir}"/${pkgname%-git} config submodule.weights.url "${srcdir}"/oidn-weights
  git -C "${srcdir}"/${pkgname%-git} submodule update --init --recursive # --remote
}

pkgver() {
  git -C "${srcdir}"/${pkgname%-git} describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_PREFIX=/usr/ \
        -G Ninja -B "build" -S "${srcdir}"/${pkgname%-git}
# shellcheck disable=SC2086 # to allow multiple flags in MAKEFLAGS variable.
  ninja -C "build" ${MAKEFLAGS:--j1} 
}

package() {
  DESTDIR=${pkgdir} ninja -C "build" install
}

# vim:set ts=2 sw=2 et:
