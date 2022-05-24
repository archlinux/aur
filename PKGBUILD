# Maintainer: dreieck
# Contributor: maz-1

_pkgname=deadbeef-qt5
pkgname=${_pkgname}-git
epoch=1
pkgver=r76.20210729.04b1404
pkgrel=2
pkgdesc="Qt based user interface plugin for DeaDBeeF music player."
arch=(
  'i686'
  'x86_64'
)
url='https://github.com/maz-1/deadbeef-qt'
license=('GPL2')
depends=(
  'qt5-base'
  'deadbeef'
)
makedepends=(
  'cmake'
  'git'
  'qt5-tools'
)
provides=(
  "${_pkgname}"
  "deadbeef-qt"
  "deadbeef-qt-git"
)
conflicts=(
  "${_pkgname}"
  'deadbeef-qt'
  'deadbeef-qt-git'
)
install='deadbeef-qt5-git.install'
source=(
  "${_pkgname}::git+https://github.com/maz-1/${_pkgname}.git"
  "${install}"
)
sha256sums=(
  'SKIP'
  '5aeda9c427f33182f7fb172a2707eae2b0a32d71efef04879622686a05e9e377'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  cmake \
    -DARTWORK_ENABLED=YES \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DHOTKEYS_ENABLED=YES \
    "../${_pkgname}"

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  for _srcdocfile in README.md; do
    install -D -v -m644 "${srcdir}/${_pkgname}/${_srcdocfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_srcdocfile}"
  done
}


