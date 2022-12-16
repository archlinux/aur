# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Maxim Fomin <maxim at fomin one>

# Add yourself to the disk group to edit disks

set -u
pkgname='wxhexeditor'
pkgname+='-git'
pkgver=0.25.r98.gc22ce20
pkgrel=1
pkgdesc='A free hex editor / disk editor for Linux, Windows and MacOSX'
arch=('i686' 'x86_64')
url='http://www.wxhexeditor.org'
license=('GPL2')
depends=('wxgtk3')
depends+=('webkit2gtk' 'gcc-libs')
makedepends=('python')
makedepends+=('git')
optdepends=('gksu: For root access support'
            'polkit: For root access support')
provides=("wxhexeditor=${pkgver%%.r*}")
conflicts=('wxhexeditor')
_srcdir="${pkgname%-git}"
source=("${_srcdir}::git+https://github.com/EUA/wxHexEditor.git")
md5sums=('SKIP')
sha256sums=('SKIP')

prepare() {
  cd "${_srcdir}"
}

pkgver() {
  set -u
  cd "${_srcdir}"

  ## stolen from the wiki ##
  #printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  local _v1="$(sed -E -n -e 's:^\s*#define _VERSION_ "(.+)"$:\1:p' 'src/HexEditorApp.h')" # '
  local _v2="$(git describe --long | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^v::g')"
  _v2="r${_v2##*.r}"
  printf '%s.%s' "${_v1}" "${_v2}"
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  test -x '/usr/bin/wx-config' || echo "${}"
  make -s WXCONFIG='/usr/bin/wx-config'
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 -s install DESTDIR="${pkgdir}" PREFIX='/usr'
  set +u
}
set +u
