# original PKGBUILD: https://aur.archlinux.org/packages/libsigrok-git
# Maintainer: yjun <jerrysteve1101 at gmail dot com>

# Sipeed Slogic Analyzer support:
1. mainline pull request: [sipeed slogic new hardware support #212](https://github.com/sigrokproject/libsigrok/pull/212)
2. MartinHerren\'s branch: https://github.com/MartinHerren/libsigrok/commits/slogiclite8/

pkgname="libsigrok-sipeed-slogic-git"
_gitname="libsigrok"
pkgver=0.2.1.r4311.gda175133
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, core library with Sipeed Slogic Analyzer support patches (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://www.sigrok.org/wiki/Libsigrok"
license=('GPL3')
depends=('libzip' 'libftdi' 'alsa-lib' 'libserialport-git' 'glibmm' 'libieee1284')
makedepends=('git' 'autoconf-archive' 'doxygen')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("git://sigrok.org/${_gitname}"
	0001-add-sipeed-slogic-analyzer-support.patch
)
sha512sums=('SKIP'
            'dd05758731b34ed7dac1b7cafa635427759dcb84e0b850b34e64c3e9bd4e4bb4d9bd9b0b6d90d3efbd5b62e001e392770289858c3cbb160c972f1cbd58c4a2c9')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --exclude 'libsigrok-unreleased' --long | sed 's/^libsigrok-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -p 1 < ${srcdir}/0001-add-sipeed-slogic-analyzer-support.patch
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
