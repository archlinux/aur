# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=scopy
pkgver=2.2.1
pkgrel=1
pkgdesc="A software oscilloscope and signal analysis toolset"
arch=(x86_64)
url="https://github.com/analogdevicesinc/scopy"
license=(GPL-3.0-or-later)
depends=(
    fmt
    genalyzer
    glib2
    glibc
    gnuradio
    gnuradio-companion
    gnuradio-m2k-git
    gnuradio-scopy-git
    hicolor-icon-theme
    karchive5
    libad9361
    libgcc
    libiio
    libm2k-git
    libmatio
    libserialport
    libsigrokdecode
    libstdc++
    libvolk
    python
    qt5-3d
    qt5-base
    qt5-declarative
    qt5-svg
    qwt-multiaxes-git
    spdlog
    )
makedepends=(
    boost
    cmake
    extra-cmake-modules
    git
    ninja
    python
    qt5-tools
    )
source=("git+https://github.com/analogdevicesinc/scopy.git#tag=v${pkgver}")
sha256sums=('e71668ff64d2fc9dfdb68746a9386c9760b98d3d0c1057758d4e662c40cb0358')

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

  local _flags=(
	-DQWT_INCLUDE_DIRS:PATH=/opt/qwt-multiaxes/usr/include/qwt
	-DQWT_LIBRARIES:FILEPATH=/opt/qwt-multiaxes/usr/lib/libqwt.so
  )

  cmake -B build -S "scopy" -Wno-author \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
