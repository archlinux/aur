# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jay Little <jaylittle@jaylittle.com>

set -u
pkgname='pixeluvo'
declare -A _pkgrel=([x86_64]='2' [i686]='1')
pkgver="1.6.0_${_pkgrel[x86_64]}"
if [ "${_pkgrel[i686]}" -gt "${_pkgrel[x86_64]}" ]; then
  pkgver="1.6.0_${_pkgrel[i686]}"
fi
pkgrel='1'
pkgdesc='photo editor with crop, vignette, text, captions, resize, color correction, raw file, filter, warp, layers, mask, and more.'
arch=('i686' 'x86_64')
url='http://www.pixeluvo.com'
license=('custom')
depends=('qt4' 'openssl' 'libpng' 'zlib')
install="${pkgname}.install"
source=('dummyfile')
source_x86_64=("http://www.pixeluvo.com/downloads/pixeluvo-${pkgver%%_*}-${_pkgrel[x86_64]}.x86_64.rpm")
source_i686=("http://www.pixeluvo.com/downloads/pixeluvo-${pkgver%%_*}-${_pkgrel[i686]}.i686.rpm")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
sha256sums_i686=('c305332c1ec4004f85873edd7e1d0e4400419ec213728e216ab8bf00e0b5b52f')
sha256sums_x86_64=('7e38a5439f4d0b5b787f31078c77f544e04906c995dd41f2afb5e181096f2704')

_vercheck() {
  curl -s 'http://www.pixeluvo.com/download/' | grep -Fe '.rpm' | sed -n -e 's:^.*downloads/pixeluvo-\([-0-9\.]\+\)\.[xi].*$:\1:p' | sed -e 's:-:_:g'
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
