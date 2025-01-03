# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libguess"
pkgname="lib32-${_name}"
_commit_rel="13c43adc7e6bfcf021057fd99feb661e8fa80a2d" # 1.2
_commit="b44a240c57ddce98f772ae7d9f2cf11a5972d8c2" # r13
pkgver="1.2+r13+g${_commit::7}"
pkgrel=1
pkgdesc="High-speed character set detection library (32-bit)"
arch=('x86_64')
url="https://github.com/kaniini/${_name}"
license=('BSD-3-Clause')
depends=('lib32-glibc' "${_name}")
provides=("${_name}.so")
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "${_name}_autoconf271_ac_prog_cpp.patch::https://sources.debian.org/data/main/${_name::4}/${_name}/${pkgver%%+*}-5/debian/patches/autoconf2.71.patch")
sha256sums=('ae110f2fe4f93837720f04232348498d8c84af32db352d01a02e50609c643e22'
            'ab16213c64bc6b4107b36993b55f2650e360bfa066fa6a3482c00e7e4a8de4f1')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_autoconf271_ac_prog_cpp.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "include"
}
