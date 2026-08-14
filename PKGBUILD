# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="fga"
pkgname="${_pkgname}-bin"
pkgver=0.7.20
pkgrel=1
pkgdesc="Cross-platform CLI to interact with an OpenFGA server"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://openfga.dev"
_url="https://github.com/openfga/cli"
license=(
  'Apache-2.0'
)
makedepends=(
  'cosign'
  'gzip'
  'slsa-verifier'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
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
sha256sums=('f8bec3f65abee3a114e40147374ffcf800863a35c9620374d2fc008ca2cd256a'
            '7129b9bc31fce6c2f583f63ac43258087e717621d91a2d853c531a5146725bb6'
            '4fbc115c5eec52212da45e2ee617515645ddc7bc2f9b76f6aa34f302f5a35177'
            '09bfa1d28096a6cb19b57f4e177e780ccd4a4cc42a168d37a7467c2552796740')
sha256sums_aarch64=('6acb3158fd46fa706344664df9a1d9433d9ec6322044bdcbf952126e7e098760')
sha256sums_i686=('91c5fc82e5cf90a2f35f7e9f3500cf04166ab8452f5838065e66933655b05804')
sha256sums_x86_64=('f0136868bdced6f8fded1876d41aa8d594d23588183497f6d876c1a5343529a4')

verify() {
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_tarball="${source_arch##*/}"

  cosign verify-blob \
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

  find "manpages" -type f -name '*.gz' -exec \
    gzip -fd "{}" \;
}

build() {
  cd "${srcdir}"
  ./"${_pkgname}" completion powershell > "completions/${_pkgname}.powershell"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  find "manpages" -type f -name '*.1' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/man/man1/{}" \;

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}
