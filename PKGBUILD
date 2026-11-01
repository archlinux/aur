# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="openfga"
pkgname="${_pkgname}-bin"
pkgver=1.22.1
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
            '8c2be4d0f70af7bc6a41c452c9332c1f36f9ef663b3120a11aa827f5d9c7791f'
            '1c46d7b2bed94d457d745f28cabeb31f8d6c81dd9035bc5d24039989ee1e1bff'
            '9b21848b9ee58b507dee378ac6640e23f8ef099db7527c87ee705ee26fc57e63'
            '8f1cce829f09fdc30887638fec2df2ad4ba81375e15254dd43a5440de3183a2c'
            '8e9e0019fcd3a2005162ddec3af02a36e3dc75824595423453fc981937f287ce'
            '1b358c377b58f44e47df9b6613f41d4af503326651ddb662f2ddf03ef5ae1d1e')
sha256sums_aarch64=('57678dc8697a224cc867081993d3a3676e005ce19d787463c913c73aed75cf5c')
sha256sums_i686=('852b7ba264191ecad7fc7a5e06ec44a53c1cc01b10f735255b4826b7d29173f8')
sha256sums_x86_64=('80d2d4b582762c02dc86b1246f7f6f54d6854259727b36e5b5c43ba90792814a')

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
