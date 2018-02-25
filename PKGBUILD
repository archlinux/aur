# $Id$
# Maintainer: Marc Aldorasi <m101010a at gmail dot com>

_pkgbasename=swh-plugins
pkgname=lib32-$_pkgbasename
pkgver=0.4.17
pkgrel=1
pkgdesc="Steve Harris' LADSPA plug-ins suite"
arch=('x86_64')
url="http://plugin.org.uk/"
license=('GPL2')
install=lib32-swh-plugins.install
depends=('lib32-fftw' 'lib32-ladspa' 'lib32-gsm')
makedepends=('lib32-libxml2' 'perl-xml-parser')
source=("${_pkgbasename}-${pkgver}.tar.gz::https://github.com/swh/ladspa/archive/v${pkgver}.tar.gz"
        'use_system_gsm.patch')
sha512sums=('6b566030b43c3929ce8938648abd458efa0fea0b4916410a34b4f4fa788c45e4a6ec3f46ca435f8546179ff0c4674303db22314e1c1f1d09e5f2b71e6c5aecc7'
            '7080a115442d682bdad17b2bfa2694ba5f6ef53efcd214748fe26133dda6a79726f57e34819e2324d1bf0a999baf5c895cba488658cc9695d4903755dce5774f')

prepare() {
  mv -v "${srcdir}/ladspa-${pkgver}" "${srcdir}/${_pkgbasename}-${pkgver}"
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  patch -Np1 -i "${srcdir}/use_system_gsm.patch"
  autoreconf -fvi
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CFLAGS"
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  make DESTDIR="$pkgdir/" install

  cd "$pkgdir"
  rm -rf usr/share
  mv usr/lib usr/lib32
}

# vim:set ts=2 sw=2 et:
