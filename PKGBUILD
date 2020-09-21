# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=openimagedenoise-develop
pkgver=1.2.3
_fragment="#tag=v${pkgver}"
pkgrel=1
pkgdesc="Intel(R) Open Image Denoise library"
arch=('x86_64')
url="https://www.openimagedenoise.org/"
license=('Apache')
depends=(intel-tbb python)
provides=("openimagedenoise=${pkgver%.r*}")
makedepends=(git makepkg-git-lfs-proto cmake 'ispc>=1.14' ninja)
source=("${pkgname}::git+https://github.com/OpenImageDenoise/oidn.git${_fragment}"
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

#pkgver() {
#  cd ${srcdir}/${pkgname}
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

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
