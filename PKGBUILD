# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Peter Mattern <pmattern at arcor dot de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=libfilezilla
pkgname=${_pkgname}-svn
pkgver=0.22.0.r9818
pkgrel=1
pkgdesc='Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs'
arch=('x86_64' 'i686')
url="https://lib.filezilla-project.org"
license=("GPL")
depends=('gnutls')
makedepends=('clang' 'subversion' 'doxygen')
checkdepends=('cppunit')
provides=("${_pkgname}")
source=("${_pkgname}::svn+https://svn.filezilla-project.org/svn/libfilezilla/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo "$(grep -Pm1 '[\d.]+' NEWS | cut -d' ' -f1).r$(svnversion)"
}

build() {
  cd ${_pkgname}
  export CXX=clang++
  export CC=clang
  autoreconf --install
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

check() {
  # LANG needed to fix string_test::test_conversion2
  LANG=en_US.UTF-8 make -C "${_pkgname}" check
}

package() {
  make DESTDIR="${pkgdir}" -C "${_pkgname}" install
}

# vim: ts=2 sw=2 et: