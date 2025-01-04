# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="mimetic"
pkgname="lib32-${_name}"
_commit_rel="44b94873f8e6c4d1e1ea9b6c4ef8e1e50dbf3ff4" # 0.9.8
_commit="2be9506c9e00180b662461cc064305c82c220bf0" # r47
pkgver="0.9.8+r47+g${_commit::7}"
pkgrel=1
pkgdesc="A free, MIT licensed, Email library (MIME) written in C++ (32-bit)"
arch=('x86_64')
url="https://www.codesink.org/mimetic_mime_library.html"
_url="https://github.com/tat/${_name}"
license=('MIT')
depends=('lib32-gcc-libs' 'lib32-glibc' "${_name}")
provides=("lib${_name}.so")
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('dfab37789af34180fb1f7fffd24cedb20f14e6672bd5e89d31b00a2ccb6cc52a')

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
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
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
