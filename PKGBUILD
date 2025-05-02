# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=scopy-git
pkgver=2.0.0.r47.g67ca340
pkgrel=1
pkgdesc="A software oscilloscope and signal analysis toolset"
arch=(x86_64)
url="https://github.com/analogdevicesinc/scopy"
license=(GPL-3.0-or-later)
depends=(qt5-base
         gnuradio
         gnuradio-companion
         gnuradio-m2k-git
         #libsigrokdecode
         #libtinyiiod-git
         #qwt61-multiaxes-svn
         )
makedepends=(cmake git ninja qt5-tools boost python)
provides=(scopy)
conflicts=(scopy)
source=("git+https://github.com/analogdevicesinc/scopy.git"
        "git+https://github.com/analogdevicesinc/iio-emu.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd scopy
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd scopy
  git submodule init
  git config submodule.iio-emu.url "${srcdir}"/iio-emu
  git config submodule.ci/flatpak/shared-modules.update none
  git submodule update
}

build() {
  cmake -B build -S "scopy" -Wno-dev \
    -G Ninja
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
