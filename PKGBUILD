# Maintainer: Tobias Markus < tobias AT miglix DOT eu >
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

_basename=wsjtx
pkgname="${_basename}-system-hamlib"
pkgver=2.5.4
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - no superbuild (uses system hamlib and boost)"
arch=('i686' 'x86_64')
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=('GPL3')
provides=('wsjtx')
conflicts=('wsjtx')
makedepends=(cmake asciidoc asciidoctor gcc-fortran boost)
depends=(
    qt5-base qt5-multimedia qt5-serialport qt5-tools
    hamlib libusb libusb-compat libpulse libpng fftw
    boost-libs
    )
source=("${_basename}-${pkgver}.tar.gz::http://physics.princeton.edu/pulsar/K1JT/${_basename}-${pkgver}.tgz"
        cmakelists.patch
        )
sha1sums=('ccc5c187dd5c8608f49e44eec70c1da4fee1c09f'
          'SKIP')

prepare() {
    cd "$srcdir"

    bsdtar -xf "${_basename}-${pkgver}/src/wsjtx.tgz"

    patch -u -p1 -i cmakelists.patch

    cd "$srcdir/$_basename"
    rm -rf boost
}

build() {
    cd "$srcdir"

    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake -B build \
        -S "$_basename" \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -Dhamlib_STATIC=false
    make -C build
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}

