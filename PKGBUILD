# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="openfga"
pkgname="${_pkgname}-bin"
pkgver=1.17.1
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
            'a5e381b4a754fd6d091eca196a257a7187e0abb98bd52e967237748656d3fbba'
            'e4b2a2d7490763fb338989151aa4a53feed799bfff63b739fcdd77a372075fdf'
            '1c46d7b2bed94d457d745f28cabeb31f8d6c81dd9035bc5d24039989ee1e1bff'
            '1c377771db956e310c8109ed70dfa1d19d6c8213b80cdc4f3ff40234e6d393fc'
            '08e4cff7e2aaf271d66d45082eeb69b99c24702e700e5b90d95aff7f0931618f'
            '7bc15e645ca4ae7eca0bc3eb9edd9fb31dcd7054db004307e5cd16ed1dce48e8'
            '85149ba1358f647fd2c777c6f2237c36c5318e6468df7d9f78bec11543842700')
sha256sums_aarch64=('af42a422631ec6f4f21a7a71758bd514ed363fb4629606d7096b6f6dde35afe8')
sha256sums_i686=('efcac747665f000c9e232e8d14a74d1bed39be72b0a752360222014612e049ed')
sha256sums_x86_64=('54fa82228ada006e72d0566bf12a4831045561c0a367f92fc7352a7063b0b786')

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
