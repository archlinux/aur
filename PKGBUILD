# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="fga"
pkgname="${_pkgname}-bin"
pkgver=0.7.15
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
sha256sums=('3c1cdb1385d7adf58f27dd72497ff32811e650e93a477bbf5e4a3b7def9b30b7'
            '38884ccaa4355c8690ad8da05bda3f2e3ddfea43db7858a0dd3d5311a6e88ac6'
            '1df83c111cd50cc238b1200dbe8ce998ed66a8e96a694c31b822c79036b860b2'
            '93069b045a3879074d6a3e16355671f430fff2de767a3cc37e62d62afa562b8f')
sha256sums_aarch64=('59803a886c9f6d5504b1faa092b3e5a8429adddee723ecbdf63b168fb560de0e')
sha256sums_i686=('7dece264b4dab85fd82b291ec886c803ad730cc2d2b933219628c32097a090b1')
sha256sums_x86_64=('7e7c08abdb7ecc4c806a357d77157544ca349cf8acb06d2be7b7ee526fd9f4c1')

verify() {
  export COSIGN_EXPERIMENTAL=1
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
