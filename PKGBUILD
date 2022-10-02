# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-cpp
_pkgname=cppTango
pkgver=9.4.0
pkgrel=1
groups=('tango-controls')
pkgdesc="TANGO distributed control system - shared library"
arch=('x86_64' 'armv7h')
url="https://www.tango-controls.org/"
license=('GPL3')
depends=('tango-idl' 'omniorb>=4.2.1' 'zeromq' 'doxygen' 'cmake>=3.7')
conflicts=('tango')
source=("https://gitlab.com/tango-controls/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6a6368564f7762881a0c5b4a2023c9af1a2872aa648d94a679b4e8789283a409')
_dir="${_pkgname}-${pkgver}"

prepare() {
  mkdir -p ${_dir}/build
}

build() {
  cd ${_dir}/build

  if [[ $CARCH == "x86_64" ]]
  then
    cmake -DTANGO_IDL_BASE=/usr/local -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr/ ../
  fi

  # Disable mmmx (for jpeg) instruction for arm architecture
  if [[ $CARCH == "armv7h" ]]
  then
    cmake -DTANGO_JPEG_MMX=0 -DTANGO_IDL_BASE=/usr/local -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr/ ../
  fi
}

package() {
  cd ${_dir}/build
  make DESTDIR=${pkgdir} install
}
