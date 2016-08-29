# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Neal Buchanan <neal.buchanan@gmx.com>

set -u
_gitauth='mdbooth'
_pkgname='ldmtool'
_gitname='libldm'
pkgname="${_pkgname}"
pkgver=0.2.3
pkgrel=1
pkgdesc="tool for managing Microsoft Windows dynamic disks"
arch=('i686' 'x86_64')
url="https://github.com/${_gitauth}/${_gitname}"
license=('GPL')
makedepends=('gtk-doc' 'json-glib' 'device-mapper')
provides=("${_gitname}")
conflicts=("${_gitname}")
_verwatch=("${url}/releases" "${url#*github.com}/archive/${_gitname}-\(.*\)\.tar\.gz" 'l')
_srcdir="${_gitname}-${_gitname}-${pkgver}"
source=("${url}/archive/${_gitname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.patch")
sha256sums=('bc2d930f46f070d446e587f65f66b2fca4af5017439f6f821ae45bff7cb944ad'
            '7e4699a1544046a9ccc14e4ec7b36cb901123783f5d456795632d2ffa28ab886')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  unset _verwatch
  makedepends+=('git')
  provides+=("${_pkgname}=${pkgver%%.r*}")
  conflicts+=("${_pkgname}")
  _srcdir="${_pkgname}"
  source[0]="${url//https:/git:}.git"
  :;sha256sums[0]='SKIP'
pkgver() {
  set -u
  cd "${_srcdir}"
  #printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's|-|.|g'
  git describe --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}
fi

prepare() {
  set -u
  cd "${_srcdir}"
  patch -p0 -i "${srcdir}/${pkgname}-${pkgver}.patch"
  ./autogen.sh --prefix='/usr'
  #./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  depends=('gtk-doc' 'json-glib')
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
