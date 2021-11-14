# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=openfpgaloader-git
pkgver=nightly.r.0.g7ed432c
pkgrel=1
pkgdesc="Universal utility for programming FPGA"
arch=('i686' 'x86_64')
url="https://github.com/trabucayre/openFPGALoader"
license=('APACHE')
depends=('libftdi' 'libftdi-compat' 'libhidapi-libusb.so' 'libudev.so')
makedepends=('cmake' 'libusb' 'systemd' 'git')
provides=('openfpgaloader')
conflicts=('openfpgaloader')
source=("$pkgname-$pkgver::git+https://github.com/trabucayre/openFPGALoader")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname-$pkgver"
  git describe --long --tags | sed -r 's/\.//;s/([^-]*-g)/r\.\1/;s/-/./g'
}

prepare() {
  sed -i 's|MODE="664", GROUP="plugdev"|MODE="666"|g' "$pkgname-$pkgver"/99-openfpgaloader.rules
}

build() {
  mkdir -p "$pkgname-$pkgver"/build
  cd "$pkgname-$pkgver"/build

  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DENABLE_UDEV=True \
    -DENABLE_CMSISDAP=True

  make
}

package() {
  cd "$pkgname-$pkgver"/build

  make DESTDIR="$pkgdir" install

  install -Dm 644 ../99-openfpgaloader.rules "$pkgdir"/usr/lib/udev/rules.d/99-openfpgaloader.rules
}
