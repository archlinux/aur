# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-cpp
_pkgname=cppTango
pkgver=9.4.1
pkgrel=1
groups=('tango-controls')
pkgdesc="TANGO distributed control system - shared library"
arch=('x86_64' 'armv7h')
url="https://www.tango-controls.org/"
license=('GPL3')
depends=('tango-idl' 'omniorb>=4.2.2' 'zeromq' 'libjpeg-turbo')
makedepends=('doxygen' 'cmake')
conflicts=('tango')
source=("https://gitlab.com/tango-controls/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('12f275fb5edc90a397655bec9a059215b5f7904c596c0f86270cbaa593de4f2a')
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
