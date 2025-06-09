# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Krzysztof Wloch <wloszekk@gmail.com>
# Contributor: demonicmaniac <stormtrooperofdeath@gmx.net>

# Release versions are often broken. We can pull patches from future commits
# or just use a working commit
_commit=''
#_commit='#commit=b17fffe099ebe26759100fc722b66b8b218b287b'

set -u
pkgname='ckmame'
#pkgname+='-git'
pkgver=3.0
pkgrel=1
pkgdesc='check ROM sets for MAME'
arch=('i686' 'x86_64')
url='https://www.nih.at/ckmame/'
#url='
license=('MIT')
#license+=('BSD-3-Clause') # not mentioned since 2007
depends=('glibc' 'gcc-libs' 'zlib>=1.1.2' 'libxml2' 'libzip>=1.8.0' 'sqlite3')
depends+=('libarchive') # optional, but always available in Arch
makedepends=('cmake')
checkdepends=('perl')
#_verwatch=("${url}" '.*Current version: \([0-9\.]\+\).*' 'f')
_giturl='https://github.com/nih-at/ckmame'
_verwatch=("${url}" "${pkgname}-\([0-9\.]\+\)\.tar\.xz" 'l')
_srcdir="${pkgname}-${pkgver}"
source=(
  "${url}${pkgname}-${pkgver}.tar.xz"
  #"0000-DatDb.h-optional.patch::${_giturl}/commit/932308538325e7036b8223631a201909064fc036.patch"
  #"0001-Command.cc-compat-getprogname.patch::${_giturl}/commit/a8fe3862c921e9648342361ccbdfe8eaa785a83b.patch"
)
md5sums=('3dae8ce2d2327784bdfbb56a60a415d8')
sha256sums=('9a0a2b364fec534aade6adb4afdcd50b6ee0a9e12312846edac446e0091d5ec3')

if [ "${pkgname%-git}" != "${pkgname}" ] || [ ! -z "${_commit}" ]; then
  source[0]="git+${_giturl}.git${_commit}"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  _srcdir="${pkgname%-git}"
  makedepends+=('git')
  provides=("${_srcdir}=${pkgver%.r*}")
  conflicts=("${_srcdir}")
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
