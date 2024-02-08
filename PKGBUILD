# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Krzysztof Wloch <wloszekk@gmail.com>
# Contributor: demonicmaniac <stormtrooperofdeath@gmx.net>

set -u
pkgname='ckmame'
#pkgname+='-git'
pkgver=2.0
pkgrel=1
pkgdesc='check ROM sets for MAME'
arch=('i686' 'x86_64')
url='https://www.nih.at/ckmame/'
license=('custom')
depends=('zlib' 'libxml2' 'libzip' 'sqlite3')
makedepends=('cmake')
checkdepends=('perl')
#_verwatch=("${url}" '.*Current version: \([0-9\.]\+\).*' 'f')
_giturl='https://github.com/nih-at/ckmame'
_verwatch=("${url}" "${pkgname}-\([0-9\.]\+\)\.tar\.xz" 'l')
_srcdir="${pkgname}-${pkgver}"
source=(
  "${url}${pkgname}-${pkgver}.tar.xz"
  "0000-DatDb.h-optional.patch::${_giturl}/commit/932308538325e7036b8223631a201909064fc036.patch"
  "0001-Command.cc-compat-getprogname.patch::${_giturl}/commit/a8fe3862c921e9648342361ccbdfe8eaa785a83b.patch"
)
md5sums=('8f1a6b57dd93949ba8516737474bdffe'
         '05d2a7aff493450618f7336668da8374'
         '92533a4d2ca61abae08e8494c863569e')
sha256sums=('40dc193c5a3d8163ec9936cc5193d992445f5fe08c854541d864bee53c09816d'
            '035330a5c297e7c5eb5d9ff4d95440843e43bde003ec819e7642e4db7b79635f'
            '9bac9cddc9a30973ffe19d4b51df8d938f924f52af0a726549fa1639713b2016')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  source[0]="git+${_giturl}.git"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  _srcdir="${pkgname%-git}"
  provides=("${_srcdir}=${pkgver%.r*}")
  conflcts=("${_srcdir}")
pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --tags --abbrev=7 | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}
fi

prepare() {
  set -u
  cd "${_srcdir}"
  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt%%::*}"
    _pt="${_pt##*/}"
    if [[ "${_pt}" = *.patch ]]; then
      set +u; msg2 "Patch ${_pt}"; set -u
      patch -Nup1 -i "${srcdir}/${_pt}"
    fi
  done
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  # diff -pNaru5 'a' 'b' > 'new.patch'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -d 'build.Arch' ]; then
    mkdir -p 'build.Arch'
    pushd 'build.Arch' > /dev/null
    local _conf=(
      -DCMAKE_INSTALL_PREFIX='/usr'
      -DDOCUMENTATION_FORMAT='man'
    )
    cmake .. "${_conf[@]}"
    popd > /dev/null
  fi
  make -C 'build.Arch' VERBOSE=1
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  make -C 'build.Arch' test
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  make -C 'build.Arch' DESTDIR="${pkgdir}" install

  # Install a license file
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  set +u
}

set +u
