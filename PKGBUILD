# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: ???
# Contributor: Flemming Madsen (arch at themadsens dot dk)

# TODO: Can we remove the included agrep and use tre?

set -u
pkgname='glimpse'
pkgver='4.18.6'
pkgrel=1
pkgdesc='Fast full text search and indexing with approximate matching'
arch=('i686' 'x86_64')
url='http://webglimpse.net'
# https://github.com/gvelez17/glimpse
license=('custom:BSD Style')
depends=('glibc')
conflicts=('tre') # agrep
_verwatch=("${url}/download.php" '.*Downloads .* Glimpse \([^,]\+\),.*' 'f')
source=(
  #'ftp://ftp.cs.tu-berlin.de/pub/linux/Mirrors/sunsite.unc.edu/utils/text/glimpse-3.6.src.tgz'
  #'ftp://ftp.vim.org/vol/2/metalab/utils/text/glimpse-3.6.src.tgz'
  #'http://webglimpse.net/trial/glimpse-latest.tar.gz'
  "http://webglimpse.net/trial/glimpse-${pkgver}.tar.gz"
  'compile.patch'
)
sha256sums=('3045296877bc7a3714ae10872056030175c2f10de83544aa7f08811f24d38077'
            '27e995d061d9434e4e8309d1dc9574ecef8cd6737ae76f12125107d1499bb607')

_disabled_pkgver() {
  cd "${pkgname}"-*/
  local _ver="$(pwd)"
  _ver="${_ver##*/}"
  _ver="${_ver#${pkgname}-}"
  _ver="${_ver%.src}"
  echo "${_ver}"
}

prepare() {
  set -u
  cd "${pkgname}"-*/
  if [ "${pkgver}" = '3.6' ]; then
    patch --backup -p0 < "${srcdir}/compile.patch"
  fi
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${pkgname}"-*/
  make -s -j1 # Not compatible with parallel make
  set +u
}

package() {
  set -u
  cd "${pkgname}"-*/
  make prefix="${pkgdir}/usr" install
  set +u
}
set +u
