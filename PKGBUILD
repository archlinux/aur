# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# sudo lsusb -v | grep switching

set -u
pkgname='uhubctl'
pkgver='2.0.0'
pkgrel='1'
pkgdesc='control USB per-port power switching on smart USB hubs'
arch=('x86_64')
_github='mvp'
url="https://github.com/${_github}/${pkgname}"
license=('GPL')
depends=('libusb>=1.0.12')
_verwatch=("https://github.com/${_github}/${pkgname}/releases.atom" "\s\+<title>${pkgname}\sv*\([0-9\.]\+\)</title>.*" 'f')
_srcdir="${pkgname}-${pkgver}"
source=("${pkgname}-${pkgver}.tgz::https://github.com/${_github}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e')

prepare() {
  set -u
  cd "${_srcdir}"
  #cp Makefile{,.orig}
  sed -e '#s/^GIT_VERSION :=/#&/g' \
      -e 's:\(PROGRAM_VERSION=\)\(.*\):\1"\2":g' \
    -i 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  CFLAGS="${CFLAGS} -Wformat-overflow=2" \
  make -j1 GIT_VERSION="${pkgver} (release)"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 install DESTDIR="${pkgdir}" sbindir='/usr/bin'
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  set +u
}
set +u
