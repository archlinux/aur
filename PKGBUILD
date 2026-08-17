# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=lib32-cdparanoia
pkgver=10.2
pkgrel=5
pkgdesc='Compact Disc Digital Audio extraction tool'
arch=(x86_64)
url='https://www.xiph.org/paranoia/'
license=(GPL)
depends=(
  'cdparanoia'
  'lib32-gcc-libs'
  'lib32-glibc'
)
source=(
  "https://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-${pkgver}.src.tgz"
  "${pkgname}-gcc.patch"
)
b2sums=('295065388e45371329ea7b04bac03c90fd854478d34eb46fa95db03054a1a21effe7863e5065a9148e558796c352d5087b6ef1c3c4c20342e66abd7d2c9eef85'
        '6ef27a8a1f0faa257196e96d006780c4894236ee3300bf5e6a2863c6fc50023cb82f586a31c2873744bf04b15fd98eb4f8cd87a428a7c2cd0a99d652f42d5740')

prepare() {
  cd cdparanoia-III-${pkgver}
  patch -Np0 -i "../${pkgname}-gcc.patch"
}

build() {
  cd cdparanoia-III-${pkgver}
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export CFLAGS+=' -Wno-format-security'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'
  autoreconf -fiv
  ./configure \
    --prefix="${pkgdir}"/usr \
    --libdir="${pkgdir}"/usr/lib32
  make -j1
}

package() {
  cd cdparanoia-III-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
