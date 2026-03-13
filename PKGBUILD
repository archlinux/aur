# Maintainer: Card38753 <cccc38753@gmail.com>
pkgname=just-ask-bin
_pkgname=just-ask
pkgver=0.1.0
pkgrel=1
pkgdesc="Just Ask desktop shell rebuilt from lazy-llm architecture"
arch=('x86_64')
url="https://github.com/2725244134/just-ask"
license=('custom')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libdrm'
  'libnotify'
  'mesa'
  'nss'
  'xdg-utils'
)
optdepends=(
  'kde-cli-tools: file deletion support via KIO'
  'trash-cli: file deletion support via trash-put'
  'gvfs: file deletion support via GVFS'
)
provides=('just-ask')
conflicts=('just-ask')
options=('!strip')
source_x86_64=(
  "${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums_x86_64=(
  '8b431cd1f7329fcdf0bc9edbc8d0a764e51245a074734d23d389390061c0ea45'
)

package() {
  local deb_file="${srcdir}/${_pkgname}_${pkgver}_amd64.deb"
  local extract_dir="${srcdir}/deb-extract"

  rm -rf "${extract_dir}"
  install -d "${extract_dir}"
  bsdtar -xf "${deb_file}" -C "${extract_dir}"

  local data_tar
  data_tar="$(find "${extract_dir}" -maxdepth 1 -type f -name 'data.tar.*' | head -n1)"
  if [[ -z "${data_tar}" ]]; then
    echo "data.tar archive not found in ${deb_file}" >&2
    return 1
  fi

  bsdtar -xf "${data_tar}" -C "${pkgdir}"

  if [[ -f "${pkgdir}/opt/just-ask/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/just-ask/chrome-sandbox"
  fi

  if [[ -f "${pkgdir}/opt/just-ask/LICENSE" ]]; then
    install -Dm644 \
      "${pkgdir}/opt/just-ask/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
