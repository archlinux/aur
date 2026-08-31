# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=scopy-git
pkgver=2.2.1.r56.g0b64b6a
pkgrel=1
pkgdesc="A software oscilloscope and signal analysis toolset"
arch=(x86_64)
url="https://github.com/analogdevicesinc/scopy"
license=(GPL-3.0-or-later)
depends=(
    genalyzer
    gnuradio
    gnuradio-companion
    gnuradio-m2k-git
    gnuradio-scopy-git
    karchive
    libm2k-git
    libmatio
    libsigrokdecode
    qt6-3d
    qt6-base
    qt6-declarative
    qt6-svg
    qwt-multiaxes-git
    )
makedepends=(
    boost
    cmake
    extra-cmake-modules
    git
    ninja
    python
    qt6-tools
    vulkan-headers
    )
provides=(scopy)
conflicts=(scopy)
source=("git+https://github.com/analogdevicesinc/scopy.git")
sha256sums=('SKIP')

pkgver() {
  cd scopy
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


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
