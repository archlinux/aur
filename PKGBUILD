# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>

_name="libspiro"
pkgname="lib32-${_name}"
pkgver=20240903
pkgrel=1
pkgdesc="Library that simplifies the drawing of beautiful curves (32-bit)"
arch=('x86_64')
url="https://github.com/fontforge/${_name}"
license=('GPL-3.0-or-later')
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('lib32-gcc-libs') # unused
provides=("${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cf0251eb5f3545cce365b727a4a56a2f1292f1ef29245c2045c83e28f8a1df42')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --program-suffix='-32' \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make check
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "include" "share"
}

