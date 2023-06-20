# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>

_pkg="mpfr"
pkgname="lib32-${_pkg}"
_pkgver=4.2.0
_patchver=9
pkgrel=1
pkgver="${_pkgver}.p${_patchver}"
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url="https://www.${_pkg}.org"
license=(LGPL)
depends=('lib32-gmp'
	 "mpfr=${pkgver}")
makedepends=('autoconf-archive' 'gcc-multilib')
source=(
    "${url}/${_pkg}-${_pkgver}/${_pkg}-${_pkgver}.tar.xz"
    patches.diff) # wget https://www.mpfr.org/mpfr-4.2.0/allpatches -O patches.diff
sha256sums=(
    '06a378df13501248c1b2db5aa977a2c8126ae849a9d9b7be2546fb4a9c26d993'
    '06da0b2a56e365f7e74ac241926f61d2574a0754548ff8116e9ddee0dabacda0')

prepare() {
  cd "${srcdir}/${_pkg}-${_pkgver}"

  patch -p1 < "$srcdir"/patches.diff
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkg}-${_pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
  
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-gmp-include=/usr/lib32/gmp \
    --with-gmp-lib=/usr/lib32 \
    --enable-thread-safe --enable-shared
  make
}

package() {
  cd "${srcdir}/${_pkg}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  rm -f "${pkgdir}/usr/lib32/"*.py
}
