# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=libuhd3
pkgver=3.15.0.0
pkgrel=5
pkgdesc="Universal Software Radio Peripheral (USRP) userspace driver"
arch=('x86_64')
url="https://files.ettus.com/manual/"
license=('GPL')
depends=('boost-libs' 'orc' 'libusb')
optdepends=('python: usrp utils' 'libuhd-firmware3')
makedepends=('cmake' 'boost' 'python-mako')
# gpsd?  dpdk?
provides=('libuhd=3.15.0.0')
conflicts=('libuhd>3.15.0.0' 'libuhd-firmware>3.15.0.0')

source=("libuhd-$pkgver.tar.gz::https://github.com/EttusResearch/uhd/archive/v$pkgver.tar.gz"
        "boost-1.73.patch"
        "gcc-11.1.patch"
        "boost-1.76.patch"
        "printw-args.patch")
sha256sums=('eed4a77d75faafff56be78985950039f8d9d1eb9fcbd58b8862e481dd49825cd'
            '10c2f221dee97418f92d10606f9b9fea1436e3bd0d7120e7b24fc90a95a07fc1'
            'ccac8a77ffe3c9421076aa3c94ffc1aa92bb4f60de4eec3aec6431446e01db9e'
            '84365baed4645a7cd0be1f97b896e3e0274eb1cbcfece1afbe9e41555fa1881c'
            '4ba9064f359268a434f53de489693d6430d62938542a9f145dd16588f85b5a48')

prepare() {
  cd "$srcdir/uhd-$pkgver"

  # https://github.com/EttusResearch/uhd/issues/347
  patch --forward --strip=1 --input "$srcdir/boost-1.73.patch"

  # Add missing "#include <thread>" due to
  # header dependency changes since GCC 11.1
  # See https://gcc.gnu.org/gcc-11/porting_to.html
  patch --forward --strip=1 --input "$srcdir/gcc-11.1.patch"
  
  # Fix missing/misplaced include for boost::math::sign
  # as emerge since Boost 1.76
  patch --forward --strip=1 --input "$srcdir/boost-1.76.patch"
  
  # Fix printw function arguments
  # This is necessary when compiling with -Werror=format-security as Debian
  # package builds do.
  patch --forward --strip=1 --input "$srcdir/printw-args.patch"

  cd "$srcdir/uhd-$pkgver/host"
  mkdir build
}

build() {
  cd "$srcdir/uhd-$pkgver/host"
  cmake -B "build" \
           -DCMAKE_INSTALL_PREFIX=/usr/ \
           -DPYTHON_EXECUTABLE=/usr/bin/python3 \
           -DENABLE_EXAMPLES=OFF \
           -DENABLE_UTILS=ON \
           -DENABLE_TESTS=OFF \
           -DENABLE_E100=ON \
           -DENABLE_E300=ON
  make -C "build"
}

check() {
  cd "$srcdir/uhd-$pkgver/host"
  make -C "build" test
}

package() {
  cd "$srcdir/uhd-$pkgver/host"
  make -C "build" DESTDIR="$pkgdir" install
  install -Dm644 "utils/uhd-usrp.rules" "$pkgdir/usr/lib/udev/rules.d/10-uhd-usrp.rules"
} 
