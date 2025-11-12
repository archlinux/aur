# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="openfga"
pkgname="${_pkgname}-bin"
pkgver=1.11.0
pkgrel=1
pkgdesc="High performance and flexible authorization/permission engine built for developers and inspired by Google Zanzibar"
arch=('aarch64' 'i686' 'x86_64')
url="https://openfga.dev"
_url="https://github.com/${_pkgname}/${_pkgname}"
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
backup=(
  "etc/${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgname}."{service,sysusers,tmpfiles,yaml}
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgsrc}-checksums.txt::${_url}/releases/download/v${pkgver}/checksums.txt"
        "${_pkgsrc}-checksums.txt.pem::${_url}/releases/download/v${pkgver}/checksums.txt.pem"
        "${_pkgsrc}-checksums.txt.cosig::${_url}/releases/download/v${pkgver}/checksums.txt.sig" # rename to not confuse OpenPGP
        "${_pkgsrc}.intoto.jsonl::${_url}/releases/download/v${pkgver}/${_pkgname}.intoto.jsonl")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums=('6f5b8d7257f4158b3800346d9fa0679e1041c92987b0303f04439a54e3488580'
            '0236b9c80bc4a6ca17c0cc5cae1091a0225cdc29163667661353d42927ecb1e7'
            'ac8e4f66ab7fd0540f58d3de61940f0dea1494fa05b4b984796c1db41a053ea1'
            '1929be63a6466a045939235754e2d2cfd4ca430c304698a6089614c6b8eec6d1'
            'd805fc7020dce2918bcb4b084a680c46c068fb3f42877f624b3d9e98c2f6af24'
            'd88a93a36f4b5fedc007d260917758cf0bad580a941ca7b98d9c483fea4ccdfc'
            '1c46d7b2bed94d457d745f28cabeb31f8d6c81dd9035bc5d24039989ee1e1bff'
            '3425051e54071eff4a910b6d0f964bfe6f72c2c5b8aacaaa53c72689e8de2241'
            '62e0a3d27e403048df319e52a5e774d20abc8bf36b14347489a7e1d31d0d2558'
            'b4f597c5fe3538994dc9245470ecec6a6cf8cbe4c195c9d45a3ad787edcb84c3'
            '96eab19a1ef35cc66cc18895f1f36d325478629439e791d40b16b6a887efac75')
sha256sums_aarch64=('f878bde55f0d30bbeef3f17055a1723085ebf1b0102e81b6325606cb6ebdbaa0')
sha256sums_i686=('7483ce63f29b561cb8ff150f0ca48cac596e0a8e9f4a538b14c096ca3d88e86b')
sha256sums_x86_64=('63c21486495db14b7f1749ee1954e1052df1e0bcecb9def82fcebb1e8cb41b61')

verify() {
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_tarball="${source_arch##*/}"

  COSIGN_EXPERIMENTAL=1 cosign verify-blob \
    --certificate "${_pkgsrc}-checksums.txt.pem" \
    --signature "${_pkgsrc}-checksums.txt.cosig" \
    --certificate-identity "${_url}/.github/workflows/release.yaml@refs/tags/v${pkgver}" \
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

  install -vDm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -vDm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -vDm664 "${_pkgname}.yaml"     "${pkgdir}/etc/${_pkgname}"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}
