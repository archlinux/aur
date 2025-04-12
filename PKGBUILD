# original PKGBUILD: https://aur.archlinux.org/packages/libsigrok-git
# Maintainer: yjun <jerrysteve1101 at gmail dot com>

# Sipeed Slogic Analyzer support:
# 1. mainline pull request: [sipeed-slogic-analyzer: Add Support for Sipeed SLogic Series, including SLogic16U3 5Gbps #262](https://github.com/sigrokproject/libsigrok/pull/262)

_gitname="libsigrok"
pkgname="libsigrok-sipeed-slogic-git"
pkgver=0.2.1.r4392.gf06f7881
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, core library with Sipeed Slogic Analyzer support patches (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://www.sigrok.org/wiki/Libsigrok"
license=('GPL3')
depends=('libzip' 'libftdi' 'alsa-lib' 'libserialport-git' 'glibmm' 'libieee1284')
makedepends=('git' 'autoconf-archive' 'doxygen')
conflicts=("${_gitname}-git")
provides=("${_gitname}-git")
source=("git+https://github.com/sigrokproject/${_gitname}/"
	"0001-sipeed-slogic-analyzer-Add-Support-for-Sipeed-SLogic-Series-including-SLogic16U3-5Gbps.patch")
sha512sums=('SKIP'
            'a89276812366ce60ce6972f702c5c997711844d1cfd4d3618f946cf224451f026f35f581aba08f74ad2e88670fcccd38ebcb1c38c8256ff164973dea7e09793c')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --exclude 'libsigrok-unreleased' --long | sed 's/^libsigrok-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -p 1 < ${srcdir}/0001-sipeed-slogic-analyzer-Add-Support-for-Sipeed-SLogic-Series-including-SLogic16U3-5Gbps.patch
}


build() {
  rm -rf "${srcdir}/build"
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/${_gitname}"
  ./autogen.sh

  cd "${srcdir}/build"
  echo "CONFIGURE"
  ../${_gitname}/configure --prefix=/usr --disable-java --disable-ruby

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" PREFIX=/usr install

  cd ../"${_gitname}"
  install -Dm 644 'contrib/60-libsigrok.rules' "${pkgdir}/usr/lib/udev/rules.d/60-libsigrok.rules"
  install -Dm 644 'contrib/61-libsigrok-uaccess.rules' "${pkgdir}/usr/lib/udev/rules.d/61-libsigrok-uaccess.rules"
}
