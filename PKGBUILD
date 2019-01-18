# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Chebotarev Sergey <sachebotarev@gmail.com>
# Contributor: Aurélien Desbrières <ice.cube@gmx.com>
# Contributor: Stefan Husmann <Stefan-Husmann@t-online.de>

set -u
pkgname='fontmatrix-git'
pkgver=0.6.0.r174.g8108e6e
pkgrel=1
pkgdesc='Font manager for Linux'
arch=('i686' 'x86_64')
#url='http://oep-h.com/fontmatrix/'
url="https://github.com/${pkgname}/${pkgname}"
license=('GPL')
depends=('qtwebkit')
makedepends=('cmake' 'git' 'mesa')
provides=("fontmatrix=${pkgver%%.r*}")
conflicts=('fontmatrix')
_srcdir="${pkgname%-*}"
#source=('git+https://github.com/popolon/fontmatrix.git')
source=('git+https://github.com/fontmatrix/fontmatrix.git')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  local _ver="$(git describe --long | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
  _ver="${_ver#v}"
  printf '%s' "${_ver}"
  set +u
}

build() {
  set -u
  cd "${_srcdir}"

  rm -rf 'build'
  mkdir -p 'build'
  cd 'build'

  declare -A _bits=([i686]='32' [x86_64]='64')
  QTDIR='/usr' \
  QMAKESPEC="/usr/share/qt/mkspecs/linux-g++-${_bits[${CARCH}]}" \
  cmake .. -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
  make
  set +u
}

package() {
  set -u
  cd "${_srcdir}/build"

  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
