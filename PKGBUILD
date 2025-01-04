# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: KafCoppelia <k740677208@gmail.com>

_pkgname=qstlink2
pkgname=${_pkgname}-git
pkgver=1.3.0.r263.b0d2fb8
pkgrel=1
pkgdesc="Cross-platform STLink v2 GUI"
arch=("any")
url="https://github.com/fpoussin/QStlink2"
license=("unknown")
depends=("qt5-base" "hidapi" "libusb" "gcc-libs" "glibc")
makedepends=("git")
optdepends=('stlink: udev rules')
source=("${_pkgname}::git+https://github.com/fpoussin/QStlink2.git"
        "qtusb::git+https://github.com/fpoussin/QtUsb.git")
options=("!strip")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${_pkgname}
  local ver="$(sed -e $'s/\r//' QStlink2.pro | grep ^VERSION | awk '{print $3}')"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  git submodule init
  git config submodule.QtUsb.url ${srcdir}/qtusb
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_pkgname}
  qmake-qt5
  make
}

package() {
  cd ${_pkgname}
  make INSTALL_ROOT=${pkgdir} install
  rm -rf ${pkgdir}/etc/udev
  rmdir ${pkgdir}/etc
}
