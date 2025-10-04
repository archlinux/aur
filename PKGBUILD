# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="fga"
pkgname="${_pkgname}-bin"
pkgver=0.7.4
pkgrel=1
pkgdesc="Cross-platform CLI to interact with an OpenFGA server"
arch=('aarch64' 'i686' 'x86_64')
url="https://openfga.dev"
_url="https://github.com/openfga/cli"
license=('Apache-2.0')
makedepends=(
  'cosign'
  'slsa-verifier'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgsrc}-checksums.txt::${_url}/releases/download/v${pkgver}/checksums.txt"
        "${_pkgsrc}-checksums.txt.pem::${_url}/releases/download/v${pkgver}/checksums.txt.pem"
        "${_pkgsrc}-checksums.txt.cosig::${_url}/releases/download/v${pkgver}/checksums.txt.sig" # rename to not confuse OpenPGP
        "${_pkgsrc}.intoto.jsonl::${_url}/releases/download/v${pkgver}/${_pkgname}.intoto.jsonl")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums=('a8c7e4ffb2a0cce4012322c0c75d81c0c4c2a1fc81ccfdd2b4dff8b3098b7bd9'
            'fd8ddca8212fff945721992c643b3248ded306d442c7b8cb092c983a98339c4e'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '9da67bb7d93be919a540f88056cf3108ae1b86159442e71f643df4805e765b53'
            'a8ce4aca9613885ec3828fa88834e1e46a19167ecc6d08b4b77c638437b33a86'
            'b9ad90781b06f217b7abda01e7a643541eda57895d29aa3cfa188414f182fae6'
            'b1d7106edff3c5a65daa613769864c64bce1e5ba633952dc4737688423c9483a')
sha256sums_aarch64=('a181c7290b1876174b1f63251c7dd8e3ec9a0a95292189498ec56517bb9b9003')
sha256sums_i686=('f32df5a70e62b1da87e277d23676f6f7cba057c3e87993a828a293d35a75eacc')
sha256sums_x86_64=('05e95247c99e5361fcb837dd6c41cfad2c4e9582d2ba90e571088ef20c87a70e')

verify() {
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_tarball="${source_arch##*/}"

  COSIGN_EXPERIMENTAL=1 cosign verify-blob \
    --certificate "${_pkgsrc}-checksums.txt.pem" \
    --signature "${_pkgsrc}-checksums.txt.cosig" \
    --certificate-identity "${_url}/.github/workflows/main.yaml@refs/tags/v${pkgver}" \
    --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
    "${_pkgsrc}-checksums.txt"
  sha256sum -c --ignore-missing "${_pkgsrc}-checksums.txt"

  slsa-verifier verify-artifact "${source_tarball}" \
    --provenance-path "${_pkgsrc}.intoto.jsonl" \
    --source-uri "${_url#https://}" \
    --source-tag "v${pkgver}"
}

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
  chmod +x ./"${_pkgname}"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish powershell zsh; do
    ./"${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}
