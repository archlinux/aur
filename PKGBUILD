# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgname=lib32-jack
pkgver=0.125.0
pkgrel=4
pkgdesc="A low-latency audio server (32-bit)"
arch=('x86_64')
url="http://jackaudio.org/"
license=('GPL' 'LGPL')
depends=('jack' 'lib32-db' 'lib32-glibc')
makedepends=('gcc-multilib' 'git' 'lib32-libsamplerate' 'lib32-readline')
conflicts=('lib32-jack2')
provides=('lib32-jack2' 'libjack.so')
replaces=('lib32-jack2')
source=("${pkgname}-${pkgver}::git+https://github.com/jackaudio/${pkgname#lib32-}1.git#tag=${pkgver}"
        "git+https://github.com/jackaudio/example-clients"
        "git+https://github.com/jackaudio/headers"
        "git+https://github.com/jackaudio/tools")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  git submodule init
  git config submodule.example-clients.url "${srcdir}/example-clients"
  git config submodule.jack.url "${srcdir}/headers"
  git config submodule.tools.url "${srcdir}/tools"
  git submodule update
  autoreconf -vfi
}

build() {
  cd "${pkgname}-${pkgver}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make -C libjack
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install-pkgconfigDATA
  make -C libjack DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
