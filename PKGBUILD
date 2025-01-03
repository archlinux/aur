# Maintainer: taotieren <admin@taotieren.com>

pkgname="sigrok-slogic-git"
pkgver=r5829.0cc6bef
pkgrel=1
pkgdesc="sigrok_slogic"
arch=($CARCH)
url="https://wiki.sipeed.com/hardware/zh/logic_analyzer/combo8/index.html"
license=('GPL-3.0-or-later')
depends=(
  glib2
  glibc
  bluez-libs
  hicolor-icon-theme
  hidapi
  libftdi
  libieee1284
  libserialport
  libtirpc
  libusb
  libzip
  nettle
  zlib
  #   glibmm
  #   libsigc++
  #   swig
  #   python
)
makedepends=(
  check
  git
  doxygen
  #   python-gobject
  #   python-numpy
  #   python-setuptools
)
conflicts=("${pkgname%-git}" libsigrok libsigrok-git)
provides=("${pkgname%-git}" libsigrok libsigrok-git)
source=("${pkgname}::git+https://github.com/sipeed/sigrok_slogic.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${pkgname}"
  chmod +x autogen.sh
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --disable-java \
    --disable-ruby
  #     --disable-python

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
  install -Dvm644 'contrib/60-libsigrok.rules' "${pkgdir}/usr/lib/udev/rules.d/60-libsigrok.rules"
  install -Dvm644 'contrib/61-libsigrok-uaccess.rules' "${pkgdir}/usr/lib/udev/rules.d/61-libsigrok-uaccess.rules"
}
