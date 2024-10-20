# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# sudo lsusb -v 2>/dev/null | grep -e '^Bus\|Per-port power switching' | grep -B1 'Per-port power switching'

set -u
pkgname='uhubctl'
pkgver='2.6.0'
pkgrel='1'
pkgdesc='control USB per-port power switching on PPPS smart USB hubs'
arch=('x86_64')
arch+=('armv7h' 'aarch64') # benalexau 2020-09-07 04:54 (UTC)
url="https://github.com/mvp/${pkgname}"
license=('GPL-2.0-only')
depends=('glibc' 'libusb>=1.0.16')
_verwatch=("${url}/releases.atom" "\s\+<title>${pkgname}\sv*\([0-9\.]\+\)</title>.*" 'f')
_srcdir="${pkgname}-${pkgver}"
source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('61d0aaec37d9c121b59f824782e26f04')
sha256sums=('56ca15ddf96d39ab0bf8ee12d3daca13cea45af01bcd5a9732ffcc01664fdfa2')

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
