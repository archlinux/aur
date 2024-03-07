#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154 # to allow unused/uninitialized variables.

pkgname=openimagedenoise-git
pkgver=2.2.1.r0.g5960a13
#_fragment="#tag=v${pkgver}"
pkgrel=1
pkgdesc="Intel(R) Open Image Denoise library"
arch=('x86_64')
url="https://www.openimagedenoise.org/"
license=('Apache')
depends=(intel-tbb python)
provides=("openimagedenoise=${pkgver%.r*}")
conflicts=(openimagedenoise)
makedepends=(git makepkg-git-lfs-proto cmake 'ispc>=1.14' ninja)
source=("${pkgname%-git}::git+https://github.com/OpenImageDenoise/oidn.git${_fragment}"
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  prepare_submodule
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

# Generated with git_submodule_PKGBUILD_conf.sh ( https://gist.github.com/bartoszek/41a3bfb707f1b258de061f75b109042b )
# Call prepare_submodule in prepare() function

prepare_submodule() {
  git -C "$srcdir/openimagedenoise" config submodule.mkl-dnn.url "$srcdir/mkl-dnn"
  git -C "$srcdir/openimagedenoise" config submodule.weights.url "$srcdir/oidn-weights"
  git -C "$srcdir/openimagedenoise" config submodule.cutlass.url "$srcdir/cutlass"
  git -C "$srcdir/openimagedenoise" config submodule.external/composable_kernel.url "$srcdir/composable_kernel"
  git -C "$srcdir/openimagedenoise" -c protocol.file.allow=always submodule update --init --recursive
}
source+=(
  "mkl-dnn::git+https://github.com/OpenImageDenoise/mkl-dnn.git"
  "oidn-weights::git-lfs+https://github.com/OpenImageDenoise/oidn-weights.git"
  "cutlass::git+https://github.com/NVIDIA/cutlass"
  "composable_kernel::git+https://github.com/ROCmSoftwarePlatform/composable_kernel"
)

# vim:set ts=2 sw=2 et:
