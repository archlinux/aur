# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=scopy-git
pkgver=v1.3.0.rc2.r59.g3460cd84
pkgrel=1
epoch=0
pkgdesc='A software oscilloscope and signal analysis toolset'
arch=('x86_64')
url='https://github.com/analogdevicesinc/scopy'
license=('GPL3')
depends=(
qt5-base
gnuradio38
gnuradio38-companion
gnuradio-iio-patched-3.8
gnuradio-scopy-git
gnuradio-m2k-git
libsigrokdecode
libtinyiiod-git
qwt61-multiaxes-svn
)
makedepends=(
cmake
git
ninja
)
provides=(scopy)
conflicts=(scopy)

source=("git+https://github.com/analogdevicesinc/scopy.git"
	"git+https://github.com/analogdevicesinc/iio-emu.git")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd scopy
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd scopy
  git submodule init
  git config submodule.iio-emu.url "${srcdir}"/iio-emu
  git submodule update
}

build() {
  cd scopy

  cmake -W no-dev -G Ninja -B build_dir -S . \
    -D CMAKE_BUILD_TYPE='None' \
    -D CMAKE_INSTALL_PREFIX='/usr' \
    -D gnuradio-iio_DIR='/usr/lib/cmake/iio' \
    -D gnuradio-scopy_DIR='/usr/lib/cmake/scopy' \
    -D gnuradio-m2k_DIR='/usr/lib/cmake/m2k'

  cmake --build build_dir
}

check() {
  cd scopy
  cd build_dir
  true
}

package() {
  cd scopy
  DESTDIR="${pkgdir}" cmake --install build_dir

  install -Dt "${pkgdir}${_destdir}/share/licenses/${pkgname}" -m644 LICENSE
}
