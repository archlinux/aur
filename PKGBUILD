# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango9-cpp
_pkgname=cppTango
_pkgver="9.5.0"
pkgver="9.5.0"
pkgrel=1
groups=('tango9-controls')
pkgdesc="TANGO distributed control system - shared library (Legacy version)"
arch=('x86_64' 'armv7h')
url="https://gitlab.com/tango-controls/${_pkgname}"
license=('GPL3')
depends=('tango-idl' 'omniorb>=4.3.0' 'zeromq' 'cppzmq' 'libjpeg-turbo')
makedepends=('doxygen' 'cmake')
conflicts=('tango' 'tango-cpp')
source=("https://gitlab.com/tango-controls/${_pkgname}/-/archive/${_pkgver}/${_pkgname}-${_pkgver}.tar.gz")
sha256sums=('8f8cd49d5287f66f84088a1cf2fa427c98a4a567fb81cce8479e1b14c4307b16')


_dir="${_pkgname}-${_pkgver}"


build() {
  # Disable mmx (for jpeg) instruction for arm architecture
  if [[ $CARCH == "armv7h" ]]
  then
    _MMX=-DTANGO_JPEG_MMX=OFF
  fi
  cmake -B build -S "${_pkgname}-${_pkgver}" $_MMX -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR=${pkgdir} install
}
