# Maintainer:  dreieck

_pkgname=nmeap
pkgname="${_pkgname}-git"
_pkgmainver=0.3
pkgver=0.3.r5.20090814.890153d
pkgrel=4
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
  'binutils'
  'doxygen'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "lib${_pkgname}=${pkgver}"
  "lib${_pkgname}.so"
  "lib${_pkgname}.a"
)
conflicts=(
  "${_pkgname}"
  "lib${_pkgname}"
  "lib${_pkgname}.so"
  "lib${_pkgname}.a"
)
options+=('staticlibs')
replaces=()
backup=()
source=(
  "${_pkgname}::git+git://git.code.sf.net/p/nmeap/code"
  "buildfiles.2025.patch"
)
sha256sums=(
  'SKIP'
  '3ca34f79ededb5d2216e062b1cfdb656c75f56b76082e563deafb50532b5d4c1'
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

  _ver="${_pkgmainver}"
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

  local _sonamever
  _sonamever="$(objdump -p lib/libnmeap.so | grep -E '^[[:space:]]*SONAME[[:space:]]+' | awk '{print $2}' | sed 's|^libnmeap\.so\.||')"
  install -Dvm755 lib/libnmeap.so  "${pkgdir}/usr/lib/libnmeap.so.${_sonamever}"
  ln -svr "${pkgdir}/usr/lib/libnmeap.so.${_sonamever}" "${pkgdir}/usr/lib/libnmeap.so"
  install -Dvm644 -t "${pkgdir}/usr/lib"      lib/libnmeap.a
  install -Dvm644 -t "${pkgdir}/usr/include"  inc/*.h

  install -D -v -m644 -t "${pkgdir}/usr/share/doc/${_pkgname}"     git.log README
  install -D -v -m644 -t "${pkgdir}/usr/share/doc/${_pkgname}/doc" doc/*
  install -D -v -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
