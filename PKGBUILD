# Maintainer: dreieck
# Contributor: petRUShka

_pkgname="balongflash"
pkgname="${_pkgname}-git"
pkgver=3.0+290.r112.20211111.bf43faa
pkgrel=3
pkgdesc='Flashing utility for Huawei E3372 and other modems baesd on Balong v7'
arch=('i686' 'x86_64')
url="https://github.com/forth32/${_pkgname}"
license=('GPL3')
depends=('zlib')
makedepends=('git')
optdepends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
  "${_pkgname}::git+https://github.com/forth32/${_pkgname}.git"
  'helpmessages_english.txt'::"http://ix.io/1RtB"
)
sha256sums=(
  'SKIP'
  'd24d9ad7a03a7482ca675d624e39d6b5b8f1423f7137708cc9707f734d22971e'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(grep -E 'Программа для прошивки устройств на Balong-чипсете, V' balong_flash.c | head -n1 | sed -E 's|.*V([^[:space:]]*)\%i.*|\1|' | sed 's|.$||')"
  _buildno="$(<build)"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}+${_buildno}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -v -m755 'balong_flash' "${pkgdir}/usr/bin/balong_flash"
  ln -svr "${pkgdir}/usr/bin/balong_flash" "${pkgdir}/usr/bin/balongflash"

  install -D -v -m644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 "${srcdir}/helpmessages_english.txt" "${pkgdir}/usr/share/doc/${_pkgname}/helpmessages_english.txt"
}
