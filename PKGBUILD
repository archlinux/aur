# Maintainer: Tobias Markus < tobias AT miglix DOT eu >
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

_basename=wsjtx
pkgname="${_basename}-system-hamlib"
pkgver=2.2.1
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
sha1sums=('e2dbbc84324b64b0b2de0b6a7aa510a5153e0ed0'
          'bb4c6ce9dae4b5ae211a7fd6b24f6e1a6ed289f8'
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

