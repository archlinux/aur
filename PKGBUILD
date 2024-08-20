# Maintainer: Szymon Januszek <szymon_j at tutanota dot com>

# Thx to: Kyle Keen <keenerd@gmail.com>, Dominik Heidler <dheidler@gmail.com> for original uhdlib

pkgname=libuhd-antsdr-git
pkgver=4.1.0
pkgrel=1
pkgdesc="Universal Software Radio Peripheral (USRP) userspace driver with support for AntSDR E200, E310v2 and U220"
arch=('x86_64')
url="https://github.com/MicroPhase/antsdr_uhd"
license=('GPL')
depends=('boost-libs' 'orc' 'libusb')
optdepends=('python: usrp utils'
            'python-numpy: python api')
makedepends=('cmake' 'boost' 'python-setuptools' 'python-mako' 'python-numpy')
options=(!lto)
# gpsd?  dpdk?
conflicts=('libuhd')
provides=('libuhd')

source=("git+https://github.com/btashton/antsdr_uhd#commit=5a17be3d46bfaec43cead178e86ae5ce1a84dc72")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/antsdr_uhd/host"
  mkdir build
}

build() {
  cd "$srcdir/antsdr_uhd/host/build"

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr/ \
           -DPYTHON_EXECUTABLE=/usr/bin/python3 \
           -DCMAKE_CXX_FLAGS="-Wno-error=format-security"

  make
}

package() {
  cd "$srcdir/antsdr_uhd/host/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "../utils/uhd-usrp.rules" "$pkgdir/usr/lib/udev/rules.d/10-uhd-usrp.rules"
} 
