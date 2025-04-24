# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=gc-large-config
conflicts=('gc')
provides=('gc')
pkgver=8.2.8
pkgrel=2
pkgdesc="A garbage collector for C and C++"
arch=('x86_64')
url="https://www.hboehm.info/gc/"
license=(
  'LicenseRef-GC'
  'MIT'
)
depends=(
  gcc-libs
)
makedepends=(
  git
)
source=(
  git+https://github.com/ivmai/bdwgc.git#tag=v${pkgver}
  https://www.hboehm.info/gc/license.txt
)
sha512sums=('f7bb0debcfeba4ccfb1ec5fd7abdf8615915988718abff9e4498f740e31ce14355d5f2c688ab0b555fbd1e9c8c9901c6e7e61c378cbe8d715869a366201ce2b8'
            '73b381858db41cb757be67fa00778cb177fa147c892ae1e83d7d31b489c576ffe6c7339b688c41550c896aef1b8af5bfa3e58d1bb9902cc9640a8b837498a9b2')

prepare() {
  cd bdwgc

  ./autogen.sh
}

build() {
  cd bdwgc
  ./configure --prefix=/usr --enable-cplusplus --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd bdwgc
  make check
}

package() {
  cd bdwgc
  make DESTDIR="${pkgdir}" install
  sed 's|GC_MALLOC 1L|gc 3|g' doc/gc.man | install -Dm644 /dev/stdin "${pkgdir}/usr/share/man/man3/gc.3"
  install -Dm644 ../license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
