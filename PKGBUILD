# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Muflone https://www.muflone.com/contacts/english/

_product="gt-s650"
pkgname="iscan-plugin-${_product}"
pkgver=2.30.4+1.1.1_1
_bundlever="${pkgver%+*}"
_pluginver="${pkgver##*+}"
_scanver="6.7.65.0"
_scanpluginver="1.0.0.6_1"
pkgrel=2
pkgdesc="EPSON Image Scan! plugin for Epson scanners (DS, EP, ES, ET, EW, L, LX, PX, WF, XP Series, FF-640, GT-S650, Perfection V19, Perfection V39)"
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
  'iscan-data'
  'libgcc'
  'libstdc++'
)
makedepends=(
  'gzip'
)
install="${pkgname}.install"
source_i686=(
  "https://download2.ebz.epson.net/iscan/plugin/${_product}/deb/x86/iscan-${_product}-bundle-${_bundlever}.x86.deb.tar.gz"
  "https://download3.ebz.epson.net/dsc/f/03/00/15/87/27/a2f4b9c48258de4e0c8082509a94060aa0ce7c61/epsonscan2-bundle-${_scanver}.i686.deb.tar.gz"
)
source_x86_64=(
  "https://download2.ebz.epson.net/iscan/plugin/${_product}/deb/x64/iscan-${_product}-bundle-${_bundlever}.x64.deb.tar.gz"
  "https://download3.ebz.epson.net/dsc/f/03/00/15/87/26/2525daf2881161ddb0957e22601734bfedab5152/epsonscan2-bundle-${_scanver}.x86_64.deb.tar.gz"
)
sha256sums_i686=('657cd8d8e0e5dfcb305dde65c99d5fc085ad3eb5a889b048ef81bf99afa27d05'
                 '626baea9833265bc7c8e60ee08f94372ea81cb2b627239a4712a0411068241e2')
sha256sums_x86_64=('553eb55fef42ebcae562f3b8442d43093a16d8b53893da3b0d25396e81377949'
                   '66fe6bd9189dc67cd3d61c852eacc01ecaa1de59cc029d948d2199b38dca932d')
# DLAGENTS=(
#   "https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u"
# )

prepare() {
  local source_array_0="source_${CARCH}[0]"
  local source_array_1="source_${CARCH}[1]"
  local source_url_0="${!source_array_0}"
  local source_url_1="${!source_array_1}"
  local source_artifact_0="${source_url_0##*/}"
  local source_artifact_1="${source_url_1##*/}"

  cd "${srcdir}/${source_artifact_1%.tar*}"
  local source_plugin_1="$(ls plugins/*${_scanpluginver//_/-}*.deb | head -n1)"
  mkdir -p "${source_plugin_1%.deb}"
  bsdtar -xf "${source_plugin_1}" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${source_plugin_1%.deb}"
  rm -f data.tar.*

  cd "${srcdir}/${source_artifact_0%.tar*}"
  local source_plugin_0="$(ls plugins/*${_pluginver//_/-}*.deb | head -n1)"
  mkdir -p "${source_plugin_0%.deb}"
  bsdtar -xf "${source_plugin_0}" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${source_plugin_0%.deb}"
  rm -f data.tar.*

  cd "${source_plugin_0%.deb}"
  find . -type f -name '*.gz' -exec \
    gzip -fd "{}" \;

  cd "usr/share"
  rm -f "doc/${pkgname}/"{copyright,*Debian}

  mkdir -p "licenses/${pkgname}"
  mv -f "doc/${pkgname}/COPYING"* "licenses/${pkgname}"

  cd "iscan"
  find . -type f -name '*.bin' -exec \
    cp -vf "${srcdir}/${source_artifact_1%.tar*}/${source_plugin_1%.deb}/usr/share/epsonscan2/{}" . \;
}

package() {
  local source_array_0="source_${CARCH}[0]"
  local source_url_0="${!source_array_0}"
  local source_artifact_0="${source_url_0##*/}"

  cd "${srcdir}/${source_artifact_0%.tar*}"
  local source_plugin_0="$(ls plugins/*${_pluginver//_/-}*.deb | head -n1)"
  cp -vaT --no-preserve=ownership "${source_plugin_0%.deb}" "${pkgdir}"
}
