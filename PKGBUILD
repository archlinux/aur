# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# sudo lsusb -v 2>/dev/null | grep -e '^Bus\|Per-port power switching' | grep -B1 'Per-port power switching'

set -u
pkgname='uhubctl'
pkgver='2.4.0'
pkgrel='1'
pkgdesc='control USB per-port power switching on PPPS smart USB hubs'
arch=('x86_64' 'armv7h' 'aarch64')
_github='mvp'
url="https://github.com/${_github}/${pkgname}"
license=('GPL')
depends=('libusb>=1.0.12' 'libudev.so')
_verwatch=("https://github.com/${_github}/${pkgname}/releases.atom" "\s\+<title>${pkgname}\sv*\([0-9\.]\+\)</title>.*" 'f')
_srcdir="${pkgname}-${pkgver}"
source=("${pkgname}-${pkgver}.tgz::https://github.com/${_github}/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('9bdf73940881df02574a94703ad8b582')
sha256sums=('391f24fd1f89cacce801df38ecc289b34c3627bc08ee69eec515af7e1a283d97')

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
