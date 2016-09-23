# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jay Little <jaylittle@jaylittle.com>

set -u
pkgname='pixeluvo'
pkgver='1.6.0'
declare -A _pkgrel=([x86_64]='1' [i686]='1')
pkgrel="${_pkgrel[${CARCH:-x86_64}]}"
pkgdesc='photo editor with crop, vignette, text, captions, resize, color correction, raw file, filter, warp, layers, mask, and more.'
arch=('i686' 'x86_64')
url='http://www.pixeluvo.com'
license=('custom')
depends=('qt4' 'openssl' 'libpng' 'zlib')
install="${pkgname}.install"
source=('dummyfile')
source_x86_64=("http://www.pixeluvo.com/downloads/pixeluvo-${pkgver}-${_pkgrel[x86_64]}.x86_64.rpm")
source_i686=("http://www.pixeluvo.com/downloads/pixeluvo-${pkgver}-${_pkgrel[i686]}.i686.rpm")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
sha256sums_i686=('c305332c1ec4004f85873edd7e1d0e4400419ec213728e216ab8bf00e0b5b52f')
sha256sums_x86_64=('a9c288e1977d91080e13c6773f70bfcb9fba3ed95e1a173af4e442c148387b88')

_vercheck() {
  curl -s 'http://www.pixeluvo.com/download/' | grep -F 'Latest Version' | sed -n -e 's:^.*; Pixeluvo \([0-9\.]\+\)<.*$:\1:p'
}

prepare() {
  set -u
  # We installed all the required libraries so we can get rid of their lib and their runner
  cd "${srcdir}/opt/pixeluvo"/lib*/
  local _rmdir="$(basename "`pwd`")"
  cd ..
  rm -rf "${_rmdir}"
  cd "${srcdir}"
  # The binary has no hard coded references to /opt so get rid of it
  mv 'opt/pixeluvo/bin'/Pixeluvo* "${srcdir}/usr/bin/pixeluvo"
  rm -rf 'opt/pixeluvo/bin'
  mv 'opt/pixeluvo' 'usr/share'
  rmdir 'opt'
  sed -i -e 's:^\(Icon\)=.*$:\1=/usr/share/pixeluvo/pixeluvo.png:g' 'usr/share/applications/pixeluvo.desktop'
  set +u
}

package() {
  set -u
  cd "${srcdir}"
  cp -pr 'usr' "${pkgdir}"
  set +u
}
set +u
