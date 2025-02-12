# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="ijs"
pkgname="lib32-${_name}"
pkgver=0.35
pkgrel=1
pkgdesc="A library which implements a protocol for transmission of raster page images (32-bit)"
arch=('x86_64')
url="https://www.openprinting.org/download/ijs"
# _url="https://github.com/ArtifexSoftware/${_name}"
license=('AGPL-3.0-or-later')
depends=("${_name}" 'lib32-glibc')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.bz2::${url}/download/${_pkgsrc}.tar.bz2"
        "${_name}_only_target_library.patch")
sha256sums=('11a5f5084488c480f3ff5a24d64d7147bb64272bf60a0ba51330a56c5b50cab9'
            'd1969ec391d451407d0b30d230b97128e739e7d1ea98058a485e29ac90be8610')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_only_target_library.patch"
  sed -i 's|lib/pkgconfig|lib32/pkgconfig|g' 'Makefile.am'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --program-suffix='-32' \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --disable-static \
    --enable-shared
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
