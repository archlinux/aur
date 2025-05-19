# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=scopy-git
pkgver=2.0.0.r75.g2b1c2c9
pkgrel=2
pkgdesc="A software oscilloscope and signal analysis toolset"
arch=(x86_64)
url="https://github.com/analogdevicesinc/scopy"
license=(GPL-3.0-or-later)
depends=(qt5-base
         qt5-declarative
         gnuradio
         gnuradio-companion
         gnuradio-m2k-git
         gnuradio-scopy-git
         libsigrokdecode
		 libm2k-git
		 qwt-multiaxes-git
         )
makedepends=(cmake git ninja qt5-tools boost python)
provides=(scopy)
conflicts=(scopy)
source=("git+https://github.com/analogdevicesinc/scopy.git"
		)
sha256sums=('SKIP')

pkgver() {
  cd scopy
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  local _flags=(
	-DQWT_INCLUDE_DIRS:PATH=/opt/qwt-multiaxes/usr/include/qwt
	-DQWT_LIBRARIES:FILEPATH=/opt/qwt-multiaxes/usr/lib/libqwt.so
  )

  cmake -B build -S "scopy" -Wno-dev \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
