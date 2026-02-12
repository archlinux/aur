# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="openfga"
pkgname="${_pkgname}-bin"
pkgver=1.11.5
pkgrel=1
pkgdesc="High performance and flexible authorization/permission engine built for developers and inspired by Google Zanzibar"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://openfga.dev"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=(
  'Apache-2.0'
)
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
source=(
  "${_pkgname}."{service,sysusers,tmpfiles,yaml}
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
  "${_pkgsrc}-checksums.txt::${_url}/releases/download/v${pkgver}/checksums.txt"
  "${_pkgsrc}-checksums.txt.pem::${_url}/releases/download/v${pkgver}/checksums.txt.pem"
  "${_pkgsrc}-checksums.txt.cosig::${_url}/releases/download/v${pkgver}/checksums.txt.sig" # rename to not confuse OpenPGP
  "${_pkgsrc}.intoto.jsonl::${_url}/releases/download/v${pkgver}/${_pkgname}.intoto.jsonl"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz"
)
source_i686=(
  "${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz"
)
sha256sums=('6f5b8d7257f4158b3800346d9fa0679e1041c92987b0303f04439a54e3488580'
            '0236b9c80bc4a6ca17c0cc5cae1091a0225cdc29163667661353d42927ecb1e7'
            'ac8e4f66ab7fd0540f58d3de61940f0dea1494fa05b4b984796c1db41a053ea1'
            '1929be63a6466a045939235754e2d2cfd4ca430c304698a6089614c6b8eec6d1'
            'd805fc7020dce2918bcb4b084a680c46c068fb3f42877f624b3d9e98c2f6af24'
            '16dc0486ca3e28ffaa1b06b03fa7cb3d4c61d18a482fe6dbc2e449a49a68d114'
            '1c46d7b2bed94d457d745f28cabeb31f8d6c81dd9035bc5d24039989ee1e1bff'
            '9bad48b4fd7b1b6f75b9db11c07d406be126cb24a384a8934bb2cac0ef208c77'
            'b06aa2fd103e9848364270efd2a550c4754528682ea9ae2fd16ef2b7fc2fb075'
            '0fab16596367d53772b59d8948f873d2eae14943713ffedb73d35f72b4acb6cd'
            '20caf83f4b7d2329ed8b6f54a032ea24c9fcc75376d83563e41690b3e0a130c6')
sha256sums_aarch64=('66d2244f4251c57ff6b6663fb9a3202130856a2feca79ad4c011a422f736f96d')
sha256sums_i686=('b7036b57db920aa6647b35254215dd21c4f360af17b8c61616ba1f80212872a1')
sha256sums_x86_64=('e68db083fcee7a5f7aa5a311cc4bfe7897f51394ea3709693c50f267bd9fd732')

verify() {
  export COSIGN_EXPERIMENTAL=true
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_artifact="${source_arch##*/}"
  
  cosign verify-blob \
    --certificate "${_pkgsrc}-checksums.txt.pem" \
    --signature "${_pkgsrc}-checksums.txt.cosig" \
    --certificate-identity "${_url}/.github/workflows/release.yaml@refs/tags/v${pkgver}" \
    --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
    "${_pkgsrc}-checksums.txt"
  sha256sum -c --ignore-missing "${_pkgsrc}-checksums.txt"

  slsa-verifier verify-artifact "${source_artifact}" \
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
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -vDm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
