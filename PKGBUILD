# Maintainer: dreieck

_pkgname='bdelta'
pkgname="${_pkgname}-git"
epoch=1
_pkgver=latest
pkgver=0.3.1.post2+g4782c58_20160919.fefefilesize
pkgrel=1
pkgdesc="A tool to create diffs of binary files. A sophisticated sequence matching library bundled with a delta creator and patch tool."
url='https://github.com/jjwhitney/BDelta'
arch=('i686' 'x86_64' 'arm')
license=(MPL)

depends=(
)

makedepends=(
  "git"
  "python2"
)

optdepends=(
)

provides=(
  "${_pkgname}=${pkgver}"
)

replaces=(
)

conflicts=(
  "${_pkgname}"
)


_giturl="https://github.com/jjwhitney/BDelta.git"

source=(
  "${_pkgname}::git+${_giturl}"
  "fefefilesize.patch::https://ptrace.fefe.de/bdelta.diff"
)

sha256sums=(
  'SKIP'
  "4e44a523b1c960c0ae428b822d700ca9610fe75a45c26e06679204a9cf19ea9c"
)

pkgver() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  
  _ver="$(python2 version.py | sed 's|^v||')"
  _rev="$(git describe --long | cut -d- -f3)"
  _date="$(git log -n 1 --pretty=format:%ci | cut -d' ' -f1 | tr -d '-')"
  
  _extraver=""
  for _patch in "${srcdir}"/*.patch; do
    _extraver="${_extraver}.$(basename "${_patch}" .patch | tr -d '.-')"
  done
  
  
  if [ -z "${_ver}" ]; then
    echo "$0: Error: Could not determine version." > /dev/stderr
    false
    return 1
  fi
  
  if [ -z "${_rev}" ]; then
    echo "$0: Error: Could not determine revision." > /dev/stderr
    false
    return 1
  fi
  
  echo "${_ver}+${_rev}_${_date}${_extraver}"
}

prepare() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  
  for _patch in "${srcdir}"/*.patch; do
    echo "Applying patch '${_patch}' ..."
    patch -p1 < "${_patch}"
  done
}

build() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  cd src
  
  make
}

package() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  cd src
  
  make DESTDIR="${pkgdir}" install
}
