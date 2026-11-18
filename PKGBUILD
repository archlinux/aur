# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=duxlabs-dev
_repo=dux-edit
_binname=dux-edit
_alias=dedit
_appid=dev.duxlabs.edit

pkgname=dux-edit-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Text and document editor for Wayland from Dux Labs (prebuilt binary)"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_repo}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_repo}/v${pkgver}"
_urlrel="${url}/releases/download/v${pkgver}"
license=('MIT')
depends=('libdux-qt-base.so' 'qt6-declarative')
optdepends=('hunspell: spellcheck'
            'hunspell-en_us: English spellcheck dictionary'
            'polkit: save root-owned files')
provides=("${_repo}=${pkgver}" "${_alias}")
conflicts=("${_repo}" "${_alias}" 'dux-edit-git')

source=(
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "${_appid}-${pkgver}.desktop::${_urlraw}/assets/${_appid}.desktop"
  "${_appid}-${pkgver}.metainfo.xml::${_urlraw}/assets/${_appid}.metainfo.xml"
  "${_appid}-${pkgver}.policy::${_urlraw}/assets/${_appid}.policy"
  "${_appid}-${pkgver}.svg::${_urlrel}/${_appid}.svg"
  "${_binname}-completions-${pkgver}.tar.gz::${_urlrel}/${_binname}-completions-${pkgver}.tar.gz"
)
source_x86_64=("${_binname}-${arch[0]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[0]}.gz")
source_aarch64=("${_binname}-${arch[1]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[1]}.gz")

# Filled by updpkgsums once v0.1.0 is released
sha256sums=('0c4c01a73eb7d2d1286a7e60e580dd53b605636dc46a57c9c3318e8e23efc676'
            'dc33ca9c83133aa2e42d93ea74b431c57c96faa1a621ee37bdcdd20c6e95625c'
            'b3b7356614170ef3d7bb182ae0d7b6b3e6c18ca02f1f2178b4f2b8d2023eca87'
            '1e7d46d61794f28370aea68f8349388cb2797362db378b178530ad2ce0c0736c'
            '4784c4ed156953f5ec108af110f20391c3ad39e5e46d566bb27de8dcac615e4c'
            '2cb48c2f21602c80280420d9a47b3b86167b5fd4613f92ec0e4cc98dd2b80685'
            '5cf019e7616a8fc8a525bb20444849a7140fc3c9e9005889a64a14d7cba513e6')
sha256sums_x86_64=('10adca3869797d8c0342af8c9a4a5413792867c4e3cc519265630620badeb3bb')
sha256sums_aarch64=('ec76930a51155f5ec24deb8bfb52061a0a75f33b7e7ec84cc18cf7cf37b06f52')

# makepkg's mime sniffing does not reliably detect a gzipped ELF, so decompress it ourselves
noextract=("${_binname}-${arch[0]}-${pkgver}.gz" "${_binname}-${arch[1]}-${pkgver}.gz")

prepare() {
  cd "${srcdir}" || exit 1

  gzip -dcf "${_binname}-${CARCH}-${pkgver}.gz" > "${_binname}-${CARCH}-${pkgver}"
}

package() {
  cd "${srcdir}" || exit 1

  install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"
  ln -s "${_binname}" "${pkgdir}/usr/bin/${_alias}"

  install -Dm644 "${_binname}"      "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "_${_binname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"

  install -Dm644 "${_appid}-${pkgver}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"
  install -Dm644 "${_appid}-${pkgver}.desktop" \
    "${pkgdir}/usr/share/applications/${_appid}.desktop"
  install -Dm644 "${_appid}-${pkgver}.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/${_appid}.metainfo.xml"
  install -Dm644 "${_appid}-${pkgver}.policy" \
    "${pkgdir}/usr/share/polkit-1/actions/${_appid}.policy"

  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
