# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Krzysztof Wloch <wloszekk@gmail.com>
# Contributor: demonicmaniac <stormtrooperofdeath@gmx.net>

set -u
pkgname='ckmame'
pkgver='0.12'
pkgrel='1'
pkgdesc='check ROM sets for MAME'
arch=('i686' 'x86_64')
url='http://www.nih.at/ckmame/'
license=('custom')
depends=('zlib' 'libxml2' 'libzip' 'sqlite3')
#_verwatch=("${url}" '.*Current version: \([0-9\.]\+\).*' 'f')
_verwatch=("${url}" "${pkgname}-\([0-9\.]\+\)\.tar\.xz" 'l')
source=("http://nih.at/ckmame/${pkgname}-${pkgver}.tar.xz")
sha256sums=('b9d7b131b20c5bc745f358be610c9aacf456e59767b05f88ddbe453f23b5a512')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install a license file
  sed -n '3,31p' 'src/ckmame.c' > 'COPYING'
  install -Dm644 'COPYING' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  set +u
}
set +u
