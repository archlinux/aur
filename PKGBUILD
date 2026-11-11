# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Margret Riegert <margret at eowyn net>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=openfpgaloader-git
pkgver=1.2.0.r40.g936221f
pkgrel=1
pkgdesc="Universal utility for programming FPGA"
arch=($CARCH)
url="https://github.com/trabucayre/openFPGALoader"
license=('Apache-2.0')
depends=(
  libftdi
  hidapi libhidapi-libusb.so
  systemd-libs libudev.so
  libusb
  zlib
  glibc
  libgcc libgcc_s.so
  libstdc++ libstdc++.so
)
makedepends=(
  'cmake'
  'systemd'
  'git'
  'ninja'
  'pkgconf'
  # build doc
  python-sphinx
  python-yaml
  python-tabulate
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
}

build() {
  cd "${srcdir}/${pkgname}"

  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  export LDFLAGS+=" ${LDFLAGS}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DENABLE_UDEV=True \
    -DENABLE_CMSISDAP=True \
    -DENABLE_LIBGPIOD=True \
    -DENABLE_REMOTEBITBANG=True \
    -Wno-author \
    -Bbuild \
    -GNinja

  ninja -C build

  cd doc
  make html
  rm -rf build/html/.*
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
  install -vDm0644 "${srcdir}/${pkgname}"/70-openfpgaloader.rules -t "$pkgdir"/usr/lib/udev/rules.d/
  install -vdm0755 ${pkgdir}/usr/share/doc/${pkgname}
  cp -r "${srcdir}"/${pkgbase}/doc/_build/html "${pkgdir}/usr/share/doc/${pkgname}/"

  chown root:root "${pkgdir}/usr/share/doc/${pkgname}/"
  find "${pkgdir}/usr/share/doc/${pkgname}/" -type f -exec chmod 644 "{}" \;
  find "${pkgdir}/usr/share/doc/${pkgname}/" -type d -exec chmod 755 "{}" \;
}
