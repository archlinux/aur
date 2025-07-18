# First maintainer: Hal Clark
# Now maintained by: Paolo Zaffino (p.zaffino@unicz.it)
# Plastimatch PI: Greg Sharp

pkgname=plastimatch
pkgver=master
pkgrel=3
pkgdesc='Tools for medical image reconstruction and registration.'
arch=('i686' 'x86_64')
url='http://plastimatch.org/'
license=('BSD-style')
conflicts=('plastimatch-static')
replaces=('plastimatch-static')
depends=('insight-toolkit-git' 'dcmtk' 'libpng' 'zlib' 'libtiff' 'libjpeg-turbo' 'fftw' 'bash-completion')
makedepends=('cmake')
optdepends=('cuda')

source=("https://gitlab.com/plastimatch/plastimatch/-/archive/master/plastimatch-master.tar.gz")
md5sums=('SKIP')
sha1sums=('SKIP')

build() {
    cd "${srcdir}"
    rm -rf build
    mkdir build
    cd build

    cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DBUILD_TESTING:BOOL=OFF \
      -DBUILD_SHARED_LIBS:BOOL=OFF \
      -DPLM_CONFIG_ENABLE_CUDA=OFF \
      ../plastimatch-${pkgver}/

    make
}

package() {
    cd "${srcdir}"/build/
    make DESTDIR="${pkgdir}" install

    # Install bash completion
    install -Dm644 ${srcdir}/plastimatch-${pkgver}/extra/bash_completion/plastimatch \
        "$pkgdir/etc/bash_completion.d/plastimatch"
}

