# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Kringel

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-eigen
pkgver=3.4.0
pkgrel=1
arch=('any')
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra (Android ${_android_arch})"
url='https://eigen.tuxfamily.org'
license=('MPL-2.0'
         'Apache-2.0'
         'BSD-3-Clause'
         'Minpack'
         'LGPL-2.1-only OR LGPL-2.1-or-later')
depends=('android-ndk')
makedepends=('android-cmake'
             "android-${_android_arch}-fftw"
             "android-${_android_arch}-boost")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.com/libeigen/eigen/-/archive/$pkgver/eigen-$pkgver.tar.gz"
        'eigen-vectorized-reduction-half.patch')
sha256sums=('8586084f71f9bde545ee7fa6d00288b264a2b7ac3607b974e54d13e7162c1c72'
            'SKIP')

prepare() {
    cd "${srcdir}/eigen-$pkgver"

    # Eigen installs all files in source dir, including the backup files of patch.
    # With the first flag we disable the use of backup files.
    patch --no-backup-if-mismatch -Np1 -i ../eigen-vectorized-reduction-half.patch
}

build() {
    cd "${srcdir}/eigen-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_TESTING=OFF \
        -DEIGEN_BUILD_DOC=OFF
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/eigen-$pkgver"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
}
