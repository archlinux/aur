# Maintainer: Tobias Markus < tobias AT miglix DOT eu >
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

_basename=wsjtx
pkgname="${_basename}-system-hamlib"
pkgver=2.4.0
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
        findhamlib.patch)
sha1sums=('17308cf69c80e9159b7b68c88de3b2da6b0d92e9'
          'a82a513bd8e9c83a0ef0292d544bad5b10a62a51'
          'f406cde650b080184bc3e2e9e8d42eceb7da5cd5')

prepare() {
    cd "$srcdir"

    bsdtar -xf "${_basename}-${pkgver}/src/wsjtx.tgz"

    patch -u -p1 -i cmakelists.patch
    patch -u -p1 -i findhamlib.patch

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

