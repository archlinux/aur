# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-cpp
_pkgname=cppTango
pkgver=9.4.2
pkgrel=1
groups=('tango-controls')
pkgdesc="TANGO distributed control system - shared library"
arch=('x86_64' 'armv7h')
url="https://www.tango-controls.org/"
license=('GPL3')
depends=('tango-idl' 'omniorb>=4.2.2' 'omniorb<4.3.0' 'zeromq' 'cppzmq' 'libjpeg-turbo')
makedepends=('doxygen' 'cmake')
conflicts=('tango')
source=("https://gitlab.com/tango-controls/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a067ab969e5cd7abf01bd989e227904858b7a1c374c4ee115f313a9f9c4f114d')
_dir="${_pkgname}-${pkgver}"


build() {
  # Disable mmx (for jpeg) instruction for arm architecture
  if [[ $CARCH == "armv7h" ]]
  then
    _MMX=-DTANGO_JPEG_MMX=OFF
  fi
  cmake -B build -S "${_pkgname}-${pkgver}" $_MMX -DTANGO_IDL_BASE=/usr -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR=${pkgdir} install
}
