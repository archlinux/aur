# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gc"
pkgname="lib32-${_name}"
pkgver=8.2.10
pkgrel=2
pkgdesc="A garbage collector for C and C++ (32-bit)"
arch=('x86_64')
url="https://www.hboehm.info/gc"
license=('LicenseRef-GC' 'MIT')
depends=("${_name}>=${pkgver}" 'lib32-gcc-libs' 'lib32-glibc')
makedepends=(git)
source=(git+https://github.com/bdwgc/bdwgc.git#tag=v${pkgver})
sha512sums=('f174b630dd205fa9cc3c9a965a14da661131c17ed87c52f2bc1479f26e5cf12d80ebfa98876611f9e4a288d2fb9eec64ccc4596cdb778aee6fe5dfb4ac26470b')

prepare() {
  cd bdwgc

  git revert -n 2cd0f5e56
  git revert -n 74fc05d12

  ./autogen.sh
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd bdwgc
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --enable-cplusplus \
    --disable-static \
    --disable-docs
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' 'libtool' # Fix overlinking
  make
}

check() {
  cd bdwgc
  make check
}

package() {
  cd bdwgc
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
