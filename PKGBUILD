# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# sudo lsusb -v 2>/dev/null | grep -e '^Bus\|Per-port power switching' | grep -B1 'Per-port power switching'

set -u
pkgname='uhubctl'
pkgver='2.5.0'
pkgrel='1'
pkgdesc='control USB per-port power switching on PPPS smart USB hubs'
arch=('x86_64')
arch+=('armv7h' 'aarch64') # benalexau 2020-09-07 04:54 (UTC)
url="https://github.com/mvp/${pkgname}"
license=('GPL')
depends=('libusb>=1.0.12' 'libudev.so')
_verwatch=("${url}/releases.atom" "\s\+<title>${pkgname}\sv*\([0-9\.]\+\)</title>.*" 'f')
_srcdir="${pkgname}-${pkgver}"
source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('e4e66d445ba8fda181ce4aa4abcd4247')
sha256sums=('d4452252f7862f7a45dd9c62f2ea7cd3a57ab5f5ab0e54a857d4c695699bbba3')

prepare() {
  set -u
  cd "${_srcdir}"
  sed -e 's/^GIT_VERSION :=/#&/g' -i 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  CFLAGS+=' -Wformat-overflow=2'
  make -s -j1 GIT_VERSION="${pkgver}"
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
