# Maintainer: Sven Klotz <sven.klotz@protonmail.com>

pkgname=sionlib
pkgver=1.7.7
pkgrel=1
pkgdesc='Scalable I/O library for parallel access to task-local files.'
arch=('x86_64')
url="https://www.fz-juelich.de/jsc/${pkgname}"
license=('BSD-3-Clause')

# You could technically build without MPI support
# but that's kinda pointless...
depends=(glibc openmpi sh)
makedepends=(gcc-fortran make)
optdepends=(cuda python)

source=("${pkgname}-${pkgver}.tar.gz::https://apps.fz-juelich.de/jsc/${pkgname}/download.php?version=${pkgver}")

sha256sums=('df98389f973501925d70d2c224bc50e39637bd76d522c25a8abd3d96d1c8adbc')
sha384sums=('00733bbbeeae5b5df5f2c0baa98df521868d6f3964168879647a47a07e08b47a91fcff20602073fae2e2df4d41b09d34')
sha512sums=('bd7bf1882db6ecca8e7c1bfd9f1a1a2cc697d346ffa7e12bda7f89614beec81d27b3af724faf41db5f56331fac1f1239323672f56f68ffcfa0e0b20287d1c848')
b2sums=('719d478920adee77a17e55e34755b18af4469e54dc3061e5174453f54f187c295c75205bd7fb6156556df234a9d94a6898ec2df0c32a8b1ecbf201ad9c1459c7')


prepare() {
    tar xf ${pkgname}-${pkgver}.tar.gz
}

build() {
    local configoptions=('--disable-parutils')
    cd "${pkgname}"
    ./configure --prefix=/usr ${configoptions[@]}

    cd build-*

    # Fix the build options... I don't like this either
    sed -i '/^[[:upper:][:digit:]]*FLAGS[[:blank:]]*=/ s/$(OPTFLAGS)//' Makefile.defs
    sed -i "/^CFLAGS[[:blank:]]*=/ s|$| ${CFLAGS}|" Makefile.defs
    sed -i "/^CXXFLAGS[[:blank:]]*=/ s|$| ${CXXFLAGS}|" Makefile.defs
    sed -i "/^FFLAGS[[:blank:]]*=/ s|$| ${FFLAGS}|" Makefile.defs
    sed -i "/^F90FLAGS[[:blank:]]*=/ s|$| ${FFLAGS}|" Makefile.defs
    sed -i "/^LDFLAGS[[:blank:]]*=/ s|$| ${LDFLAGS}|" Makefile.defs

    make
}

check() {
    make -C ${pkgname}/build-* test
}

package() {
    cd "${pkgname}"
    chown -R root:root .
    make PREFIX="${pkgdir}/usr" -C build-* install

    rm -rf "${pkgdir}/usr/examples"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
