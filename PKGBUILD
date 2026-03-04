# original PKGBUILD: https://aur.archlinux.org/packages/libsigrok-git
# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: aisuneko icecat <iceneko@protonmail.ch>

# Forked from https://aur.archlinux.org/packages/libsigrok-sipeed-slogic-git. Tracks upstream to github.com/sipeed/libsigrok

_gitname="libsigrok"
pkgname="libsigrok-sipeed-slogic-git"
pkgver=r6146.43f554d
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, core library with Sipeed Slogic Analyzer support patches (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://www.sigrok.org/wiki/Libsigrok"
license=('GPL3')
depends=('libzip' 'libftdi' 'alsa-lib' 'libserialport-git' 'glibmm' 'libieee1284')
makedepends=('git' 'autoconf-archive' 'doxygen')
conflicts=("${_gitname}-git")
provides=("${_gitname}-git")
source=("git+https://github.com/sipeed/${_gitname}/#branch=slogic-dev")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
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
