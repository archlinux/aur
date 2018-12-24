# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Krzysztof Wloch <wloszekk@gmail.com>
# Contributor: demonicmaniac <stormtrooperofdeath@gmx.net>

set -u
pkgname='ckmame'
pkgver='1.0'
pkgrel='1'
pkgdesc='check ROM sets for MAME'
arch=('i686' 'x86_64')
url='https://www.nih.at/ckmame/'
license=('custom')
depends=('zlib' 'libxml2' 'libzip' 'sqlite3')
makedepends=('cmake')
checkdepends=('perl')
#_verwatch=("${url}" '.*Current version: \([0-9\.]\+\).*' 'f')
_verwatch=("${url}" "${pkgname}-\([0-9\.]\+\)\.tar\.xz" 'l')
_srcdir="${pkgname}-${pkgver}/build"
source=("https://nih.at/ckmame/${pkgname}-${pkgver}.tar.xz")
sha256sums=('efb294ec9276791c74345187d7e180fc214dbab84694ea26530179e7d4686e55')

build() {
  set -u
  if [ ! -d "${_srcdir}" ]; then
    mkdir -p "${_srcdir}"
    cd "${_srcdir}"
    cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DDOCUMENTATION_FORMAT='man'
    cd "${srcdir}"
  fi
  cd "${_srcdir}"
  make VERBOSE=1
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  make test
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  make DESTDIR="${pkgdir}" install
  cd ..

  # Install a license file
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  set +u
}

set +u
