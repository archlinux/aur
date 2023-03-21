# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgbasename=zimg
pkgname=("lib32-$_pkgbasename")
pkgver=3.0.4
pkgrel=3
pkgdesc='Scaling, colorspace conversion, and dithering library'
arch=(x86_64)
url=https://github.com/sekrit-twc/zimg
license=(custom:WTFPL)
depends=(
  "${_pkgbasename}>=${pkgver}" 
  "lib32-glibc"
)
makedepends=(
  "git"
  "lib32-gcc-libs"
)
provides=(libzimg.so)
options=(!emptydirs)
_tag=dd4c4dff3ce6a2877bd6ba57c1be99759b9cb2da
source=(git+https://github.com/sekrit-twc/zimg.git#tag=${_tag})
sha256sums=(SKIP)

prepare() {
  cd ${_pkgbasename}

  ./autogen.sh
}

pkgver() {
  cd ${_pkgbasename}

  git describe --tags | sed 's/^release-//'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}
  ./configure \
    --prefix='/usr' \
    --libdir=/usr/lib32 \
    --host=i686-linux-gnu \
    --enable-x86simd \
    --disable-static
  make
}

package(){
  cd ${_pkgbasename}

  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/include
  rm -r "${pkgdir}"/usr/share/doc/zimg/

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/doc/${_pkgbasename}/"README.md "${pkgdir}/usr/share/doc/${pkgname}/"
  ln -s "/usr/share/doc/${_pkgbasename}/COPYING" "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim: ts=2 sw=2 et:
