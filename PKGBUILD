# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Maximilian Stein <maxarchpkgbuild@hmamail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>

_pkgbase=libnl
pkgname=lib32-${_pkgbase}
pkgver=3.11.0
pkgrel=1
pkgdesc="Library for applications dealing with netlink sockets (32 bit)"
arch=('x86_64')
url='https://github.com/thom311/libnl/'
license=('GPL')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('git' 'gcc-multilib')
validpgpkeys=('49EA7C670E0850E7419514F629C2366E4DFC5728') # Thomas Haller <thaller@redhat.com>
source=("git+https://github.com/thom311/libnl.git#tag=libnl${pkgver//./_}?signed")
sha256sums=('edef8939fe40a0c2985c944063f674c1205e36d047bb0d224d99fddf9072b34d')

prepare() {
  cd "${_pkgbase}"
  ./autogen.sh
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${_pkgbase}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-static \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}
