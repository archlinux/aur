# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Maximilian Stein <maxarchpkgbuild@hmamail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>

_pkgbase=libnl
pkgname=lib32-${_pkgbase}-git
pkgver=3.12.0.r8.g655a638
pkgrel=2
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Library for applications dealing with netlink sockets (32 bit)"
arch=('x86_64')
url='https://github.com/thom311/libnl/'
license=('LGPL-2.1-only')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('git' 'gcc-multilib' 'lib32-gcc-libs')
source=("git+https://github.com/thom311/libnl.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  git describe --long --tags --match 'libnl*' --abbrev=7 | \
    sed 's/^libnl//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

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
