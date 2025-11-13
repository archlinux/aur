# Maintainer:  dreieck

_pkgname=nmeap
pkgname="${_pkgname}-git"
pkgver=0.3.r5.20090814.890153d
pkgrel=1
pkgdesc="Extensible NMEA-0183 parser written in standard C"
arch=(
  'i686'
  'x86_64'
  'aarch64'
  'armv7h'
)
url="https://nmeap.sourceforge.net/"
license=('BSD-3-Clause')
groups=()
depends=(
  'glibc'
)
makedepends=(
  'git'
  'doxygen'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
options+=('staticlibs')
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "${_pkgname}::git+git://git.code.sf.net/p/nmeap/code"
  "buildfiles.2025.patch"
)
noextract=()
sha256sums=(
  'SKIP'
  '2f531286c4e228b76ad03deca6e1be90bff937773561ef9c4a218f5eee9e06d2' # '8a9c00b575838d254b1d43bac1ae592f153128727b222fe499ebf5e0bb091a32'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  local _patch
  for _patch in "${srcdir}"/buildfiles.2025.patch; do
    printf '%s\n' "  > Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="0.3"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
  make doc
}

check() {
  cd "${srcdir}/${_pkgname}"
  cd tst

  local _test
  for i in 1 2 3; do
    _test=test"${i}"
    printf '%s\n' "  > Running '${_test}' ..."
    ./"${_test}"
  done
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dvm755 -t "${pkgdir}/usr/lib"      lib/*.so
  install -Dvm644 -t "${pkgdir}/usr/lib"      lib/*.a
  install -Dvm644 -t "${pkgdir}/usr/include"  inc/*.h

  install -D -v -m644 -t "${pkgdir}/usr/share/doc/${_pkgname}"     git.log README
  install -D -v -m644 -t "${pkgdir}/usr/share/doc/${_pkgname}/doc" doc/*
  install -D -v -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
