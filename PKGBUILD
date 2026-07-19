# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: asyync1024 <asyync1024 at proton dot me>

_name="libwslay"
pkgname="lib32-$_name"
pkgver=1.1.1
pkgrel=1
pkgdesc="WebSocket library (32-bit)"
arch=('x86_64')
url="https://github.com/tatsuhiro-t/wslay"
license=('MIT')
depends=("${_name}>=${pkgver}" 'lib32-glibc')
makedepends=('lib32-gcc-libs')
# checkdepends=('lib32-cunit')
provides=('lib32-wslay' "$_name.so")
replaces=('lib32-wslay')
_pkgsrc="${url##*/}-${pkgver}"
source=("${url}/releases/download/release-${pkgver}/${_pkgsrc}.tar.bz2")
b2sums=('e5b5e7435e1e3a82cef4407f2a5fbcf4168f2814546074d8ee5aa70f36acabc648bc58f14aaee53bc6be7ab7e18c39a4f8e16fba507dc85f19ee4f79a827be6e')

prepare() {
  cd "$srcdir/$_pkgsrc"
  sed -e 's/build_examples=yes/build_examples=no/g' \
      -e 's/have_nettle=yes/have_nettle=no/g' \
      -e 's/have_cunit=yes/have_cunit=no/g' \
      -i 'configure.ac'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local configure_options=(
    --prefix='/usr'
    --program-suffix='-32'
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
  )

  cd "$srcdir/$_pkgsrc"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

check() {
  make check -C "$srcdir/$_pkgsrc"
}

package() {
  make DESTDIR="${pkgdir}" install -C "$srcdir/$_pkgsrc"

  cd "$pkgdir/usr"
  rm -rf "bin" "include" "share"
}
