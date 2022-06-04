# Maintainer: dreieck

_pkgname=balong-usbdload
pkgname="${_pkgname}-git"
_pkgver=latest
pkgver=2.20.r89.20191227.c0ebd14
pkgrel=1
pkgdesc='Low level USB Flashing/ downloader utility for Huawei E3372 and other modems baesd on Balong v7. Includes temporary usb loader "firmware" for some devices.'
arch=('i686' 'x86_64')
url="http://github.com/forth32/balong-usbdload"
license=('GPL3')
depends=('glibc')
optdepends=("balongflash: For flashing firmware after downloading temporary USB downloader code with ${_pkgname}.")
makedepends=('git')
provides=(
  "${_pkgname}=${pkgver}"
  "balong-usbdload-data=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  'balong-usbdload-data'
)

source=(
  "${_pkgname}::git+https://github.com/forth32/balong-usbdload.git"
  "helpmessages_english.txt"
  "README.english.md"
)

sha256sums=(
  'SKIP'
  '96346a31d173909514a29dca5e2a7eb0540b635ae42220b179f2654a35e9d2ab'
  'b418646e48436a8b55733bf270e3050cbf6ecaa1ec31862f06754333dd691594'
)

pkgver() {
  cd "${_pkgname}"

  _ver="$(grep -E 'варийный USB-загрузчик Balong-чипсета, версия' balong-usbdload.c | head -n1 | sed -E 's|.*версия ([^[:space:]]*).*|\1|' | tr -d ',')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -v -d -m755 "${pkgdir}/usr/bin/"
  install -v -m755 balong-usbdload loader-patch ptable-injector "${pkgdir}/usr/bin"
  install -v -d -m755 "${pkgdir}/usr/share/${_pkgname}/data"
  install -v -m644 *.bin "${pkgdir}/usr/share/${_pkgname}/data"

  install -v -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -v -D -m644 "${srcdir}/README.english.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.english.md"
  install -v -D -m644 "${srcdir}/helpmessages_english.txt" "${pkgdir}/usr/share/doc/${_pkgname}/helpmessages_english.txt"
}
