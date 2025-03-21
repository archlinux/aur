# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="shine"
pkgname="lib32-${_name}"
_commit_rel="97f188efc3dc90315b79a2af1f477c0c18d85e82" # 3.1.1
_commit="ab5e3526b64af1a2eaa43aa6f441a7312e013519" # r59
pkgver="3.1.1+r59+g${_commit::7}"
pkgrel=2
pkgdesc="Super fast fixed-point MP3 encoder (32-bit)"
arch=('x86_64')
url="https://github.com/savonet/${_name}"
license=('LGPL-2.0-only')
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('lib32-gcc-libs')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('2c2f7e41c7c0f67079eb3882233cdc97e3d583e1985b558d4e847bd46285fbde')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e 's/-O2//g' \
      -e '/^bin_PROGRAMS/d' \
      -e '/^shineenc_/d' \
      -e '/_HEADERS/d' \
      -i 'Makefile.am'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  # ./bootstrap
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --program-suffix='-32' \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  make all
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}

