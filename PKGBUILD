# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=belle-sip-git
_pkgname=belle-sip
pkgver=1.6.3.r218.g5dc5f6a
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL')
depends=('avahi' 'bctoolbox-git' 'gcc-libs' 'zlib')
provides=("belle-sip=$pkgver")
conflicts=('belle-sip')
options=('!emptydirs')
source=("git+https://github.com/BelledonneCommunications/belle-sip.git"
    "gcc9.patch")
sha256sums=('SKIP'
            '407d60e93f672f871ab3eab62fbaf33521733202b8e7c763a5fb85539fb06d1b')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
    cd ${srcdir}
    patch -p0 < gcc9.patch
}

build() {
  cd $_pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DENABLE_STATIC=NO \
        -DENABLE_MDNS=YES \
        -DENABLE_STRICT=YES .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
