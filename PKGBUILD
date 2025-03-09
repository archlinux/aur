# Maintainer: taotieren <admin@taotieren.com>

pkgbase=sigrok-slogic-git
pkgname=(sigrok-slogic-git)
pkgver=0.2.1.r4403.g40ce2154
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
  libtirpc
  libusb
  libzip
  nettle
  zlib
  glibmm
  libsigc++
  swig
  python
  #AUR
  libserialport-git
)
makedepends=(
  check
  git
  doxygen
  python-gobject
  python-numpy
  python-setuptools
)
conflicts=("${pkgname%-git}" libsigrok libsigrok-git)
provides=("${pkgname%-git}" libsigrok libsigrok-git)
# source=("${pkgbase}::git+https://github.com/sipeed/sigrok_slogic.git")
source=("${pkgbase}::git+https://github.com/sigrokproject/libsigrok.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase}"
  (
    set -o pipefail
    git describe --exclude 'libsigrok-unreleased' --long | sed 's/^libsigrok-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgbase}" clean -dfx
  cd "${srcdir}/${pkgbase}"
  git config --global user.email "admin@taotieren.com"
  git config --global user.name "taotieren"
  git remote add sigrok_slogic https://github.com/sipeed/sigrok_slogic.git
  git fetch --all
  git merge sigrok_slogic/hardware-sipeed-slogic-analyzer-support
  #   hardware-sipeed-slogic-analyzer-support
}

build() {
  cd "${srcdir}/${pkgbase}"
  chmod +x autogen.sh
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --enable-cxx \
    --enable-shared \
    --disable-static \
    --disable-java \
    --disable-ruby
  #     --disable-python

  make
}

package() {
  cd "${srcdir}/${pkgbase}"

  make DESTDIR="${pkgdir}" install
  install -Dvm644 'contrib/60-libsigrok.rules' "${pkgdir}/usr/lib/udev/rules.d/60-libsigrok.rules"
  install -Dvm644 'contrib/61-libsigrok-uaccess.rules' "${pkgdir}/usr/lib/udev/rules.d/61-libsigrok-uaccess.rules"
}
