# Maintainer: EndlessEden <eden [at] rose.place>
# Contributor: deadite66 <lee295012@gmail.com>
# Previous-Maintainer: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: Yunhui Fu <yhfudev@gmail.com>
# Contributor: 0xfc <sfc_0@yahoo.com.cn>
# Modified from gr-osmosdr-git PKGBUILD

pkgname=gr-osmosdr-nonfree-git
pkgver=0.2.1.19.ga100eb0
pkgrel=1
pkgdesc="GNU Radio source block for OsmoSDR with nonfree components, such as sdrplay, enabled."
arch=('i686' 'x86_64')
url="http://sdr.osmocom.org/trac/"
license=('custom')
depends=(
    'gnuradio'
    'swig'
    'rtl-sdr'
    'libuhd'
    'libmirisdr-git'
    'libosmosdr-git'
    'airspy'
    )
makedepends=(
    'git'
    'cmake'
    'boost'
    'python-cheetah3'
    )
optdepends=(
    'gnuradio-iqbal: Osmocom IQ imbalance correction support'
    'soapysdr-git: SoapySDR support'
    'libsdrplay: SDRplay RSP support'
    'gnuradio-fcdproplus: FUNcube Dongle Pro+ support'
    'hackrf: HackRF and rad1o Badge support'
#    'bladerf: nuand bladeRF support'   ## This fails to build when installed
    'doxygen: documentation'
    )

provides=('gr-osmosdr-git' 'gr-osmosdr' 'gnuradio-osmosdr')
conflicts=('gr-osmosdr-git')

install=${pkgname}.install

source=('git://git.osmocom.org/gr-osmosdr')
md5sums=('SKIP')

_gitname="gr-osmosdr"

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g; s|^.||'
  #echo "0"
}

prepare() {
  cd "${srcdir}"/$_gitname

  # The binaries no longer follow GPL terms and cannot be
  # distributed due to nonfree components.
  sed -i '1s/^/NONFREE components have been enabled. The resulting\nbinaries cannot be distributed under GPL terms.\n\n/' COPYING
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build
  cd build
  cmake -DPYTHON_EXECUTABLE=$(which python) \
        -DPYTHON_INCLUDE_DIR=$(echo /usr/include/python*) \
        -DPYTHON_LIBRARY=$(echo /usr/lib/libpython.*.so) \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_NONFREE=TRUE ../
  make
}

package() {
  cd "$srcdir/$_gitname/build/"
  make DESTDIR=${pkgdir} install
  install -Dm644 $srcdir/$_gitname/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
