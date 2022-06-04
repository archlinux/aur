# Maintainer: dreieck

_pkgname="balong-nvtool"
pkgname="${_pkgname}-git"
pkgver=1.0+215.r72.20200731.4f5eb89
pkgrel=1
pkgdesc='A utility to process NVRAM images of devices on the HiSilicon Balong chipset.'
arch=('i686' 'x86_64')
url="https://github.com/forth32/${_pkgname}"
license=('GPL3')
depends=()
makedepends=(
  'git'
  'libmd'
)
optdepends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
  "${_pkgname}::git+https://github.com/forth32/${_pkgname}.git"
  'helpmessages_english.md'::"http://ix.io/3Znw"
)
sha256sums=(
  'SKIP'
  'd58174921af787ea952f659a6e41c651c1719fc9f248e0f1ba633ddd9973b000'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(grep 'Hisilicon Balong, V' balong-nvtool.c  | head -n1 | sed -E 's|.*V([^[:space:]]*)\%i.*|\1|' | sed 's|.$||')"
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

  for _binary in 'balong-nvtool' 'nvdload-combine' 'nvdload-split'; do
    install -D -v -m755 "${_binary}" "${pkgdir}/usr/bin/${_binary}"
  done

  for _docfile in 'README.md' 'install.txt' "${srcdir}/helpmessages_english.md"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  cp -av 'modem-bin' "${pkgdir}/usr/share/doc/${_pkgname}/modem-bin"
}
