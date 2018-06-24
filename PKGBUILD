# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-shishi-git
pkgver=r3586.5d0b4802
pkgrel=1
pkgdesc="a GNU implementation of the Kerberos 5 network security system (mingw-w64)"
arch=('any')
url="https://www.gnu.org/software/shishi/"
license=('GPL')
makedepends=('mingw-w64-configure' 'mingw-w64-wine' 'wget' 'git' 'gengetopt')
depends=('mingw-w64-crt' 'mingw-w64-gnutls' 'mingw-w64-libidn' 'mingw-w64-libgcrypt' 'mingw-w64-libgpg-error' 'mingw-w64-libtasn1')
options=('!strip' '!buildflags' 'staticlibs')
source=("shishi"::"git+https://git.savannah.gnu.org/git/shishi.git"
        "003-no-shishid.patch"
        "004-fix-download-po.patch")
sha256sums=('SKIP'
            'a5b17bb2840d95d90d591c170ca430726d2cac0e77523cb6e1b84925e8e1cf76'
            '329258931329937824fe37f09666e0b0fc2bd0140a50429e04e4ea40fbd2c411')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/shishi"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/shishi"
  patch -p1 -i ${srcdir}/003-no-shishid.patch
  patch -p1 -i ${srcdir}/004-fix-download-po.patch

  WANT_AUTOMAKE=latest autoreconf -fi
  make update-po
}


build() {
  cd "${srcdir}/shishi"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/shishi/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/sbin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
