# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Neal Buchanan <neal.buchanan@gmx.com>

set -u
_gitauth='mdbooth'
_pkgname='ldmtool'
_gitname='libldm'
pkgname="${_pkgname}"
pkgver=0.2.5
pkgrel=1
pkgdesc='tool for managing Microsoft Windows dynamic disks'
arch=('i686' 'x86_64')
url="https://github.com/${_gitauth}/${_gitname}"
license=('GPL')
makedepends=('gtk-doc' 'json-glib' 'device-mapper')
provides=("${_gitname}")
conflicts=("${_gitname}")
_verwatch=("${url}/releases.atom" "\s\+<title>${_gitname}-\([0-9\.]\+\)</title>.*" 'f') # RSS
_srcdir="${_gitname}-${_gitname}-${pkgver}"
source=(
  "${url}/archive/${_gitname}-${pkgver}.tar.gz"
  'sysmacros.patch'
)
md5sums=('ab38c1a47275eebb9c9cbcaf16220636'
         'b4585e50359818c9d89e541c37d98cc3')
sha256sums=('61bb2f2367b1df59f818cb96794d1770a0def956bd2c343dccf1425dae3021b5'
            '503052d3fb15869f5ed3b3425299dce64b20e40d1df58eeb9d863ec97d0e7ce9')

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
  _configure
  set +u
}

_configure() {
  set -u
  cd "${srcdir}/${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    # prevent build error in yaourt
    BUILDDIR= \
    bash -u -e ./autogen.sh --prefix='/usr'
    #./configure --prefix='/usr'
    sed -e 's:-Werror::g' -i 'src/Makefile' 'test/Makefile'
  fi
  cd "${srcdir}"
  set +u
}

build() {
  _configure
  set -u
  cd "${_srcdir}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

package() {
  set -u
  depends=('gtk-doc' 'json-glib')
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
