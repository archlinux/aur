# Maintainer: Margret Riegert <margret at eowyn net>
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=openfpgaloader-git
pkgver=0.13.1.r28.gb839792
pkgrel=1
pkgdesc="Universal utility for programming FPGA"
arch=($CARCH)
url="https://github.com/trabucayre/openFPGALoader"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'libftdi'
  'libhidapi-libusb.so'
  'libudev.so'
  'libusb'
  'zlib'
)
makedepends=(
  'cmake'
  'systemd'
  'git'
  'ninja'
  'pkgconf'
)
provides=('openfpgaloader')
conflicts=('openfpgaloader')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --exclude=nightly --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  sed -i 's|MODE="664", GROUP="plugdev"|MODE="666, GROUP="uucp"|g' "${srcdir}/${pkgname}"/99-openfpgaloader.rules
}

build() {
  cd "${srcdir}/${pkgname}"

  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DENABLE_UDEV=True \
    -DENABLE_CMSISDAP=True \
    -Wno-dev \
    -Bbuild \
    -GNinja

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
  install -Dm 0644 "${srcdir}/${pkgname}"/99-openfpgaloader.rules "$pkgdir"/usr/lib/udev/rules.d/99-openfpgaloader.rules
}
