# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Rafael Vega <contacto rafaelvega co>

_product="gt-x770"
pkgname="iscan-plugin-${_product}"
pkgver=2.30.6+2.1.3_1
_bundlever="${pkgver%+*}"
_pluginver="${pkgver##*+}"
pkgrel=1
pkgdesc="EPSON Image Scan! plugin for Epson scanners (GT-X770)"
arch=(
  'i686'
  'x86_64'
)
url="https://download-center.epson.com/search"
license=(
  'custom:EPSON END USER SOFTWARE LICENSE AGREEMENT'
)
depends=(
  'glibc'
  'iscan'
  # 'iscan-data'
  'libgcc'
  'libstdc++'
)
makedepends=(
  'gzip'
)
install="${pkgname}.install"
source_i686=(
  # 2.30.6 is unavailable for x86 but technically they are identical
  # "https://download-center.epson.com/f/module/455132ee-c39d-4e96-bd25-1d49254fe738/iscan-${_product}-bundle-${_bundlever}.x86.deb.tar.gz"
  "https://download-center.epson.com/f/module/455132ee-c39d-4e96-bd25-1d49254fe738/iscan-${_product}-bundle-2.30.4.x86.deb.tar.gz"
)
source_x86_64=(
  "https://download-center.epson.com/f/module/6d6a11d5-fc42-4389-84d6-b94ba107ec5c/iscan-${_product}-bundle-${_bundlever}.x64.deb.tar.gz"
)
sha256sums_i686=('248bb3bd08cb0f20e74988c1ec9b5a54a49e5b4980a72e40810517a05e0aad40')
sha256sums_x86_64=('10189b7ff298a1a5d6afff890a56914334b7432ec4dd6d96367d1aab2a09caad')
DLAGENTS=(
  "https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u"
)

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  chmod -R u+rwX .

  cd "${source_artifact%.tar*}"
  local source_plugin="$(ls plugins/*${_pluginver//_/-}*.deb | head -n1)"
  mkdir -p "${source_plugin%.deb}"
  bsdtar -xf "${source_plugin}" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${source_plugin%.deb}"
  rm -f data.tar.*

  cd "${source_plugin%.deb}"
  find . -type f -name '*.gz' -exec \
    gzip -fd "{}" \;

  cd "usr/share"
  mkdir -p "licenses/${pkgname}"
  mv -f "doc/${pkgname}/COPYING"* "licenses/${pkgname}"

  rm -rf "doc"
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}/${source_artifact%.tar*}"
  local source_plugin="$(ls plugins/*${_pluginver//_/-}*.deb | head -n1)"
  cp -vaT --no-preserve=ownership "${source_plugin%.deb}" "${pkgdir}"
}
