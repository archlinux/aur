# Maintainer:  Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergey Balabanov <sergey dot balabanov at gmail dot com>

_pkgname="aqua"
pkgname="${_pkgname}-bin"
pkgver=2.64.0
pkgrel=1
pkgdesc="Declarative CLI version manager"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://aquaproj.github.io"
_url="https://github.com/aquaproj/${_pkgname}"
license=('MIT')
makedepends=(
  'cosign'
  'slsa-verifier'
  'help2man'
)
depends=(
  'bash'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
install="${_pkgname}.install"

_pkgsrc="${_pkgname}-${pkgver}"

source=("${_pkgsrc}-checksums.txt::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_checksums.txt"
        "${_pkgsrc}-checksums.bundle::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_checksums.txt.sigstore.json"
        "${_pkgsrc}-multiple.intoto.jsonl::${_url}/releases/download/v${pkgver}/multiple.intoto.jsonl")
source_x86_64=("${_pkgsrc}-${arch[0]}.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgsrc}-${arch[1]}.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_${_barch[1]}.tar.gz")
sha256sums=('651d4378614e8506c5814d3bed0c5643eea74b957e491601427ad8ebf241fa02'
            '6c30c5a7966213dae70517763b2a7e06f2c038ca604c4cdffe67bcb1f010ae14'
            '3fec944a73abe7ab1b8440e30eee7c33130402713d32b5429b1e9e5de1fe9d40')
sha256sums_x86_64=('b276e927ee2f4dc214831708c0843a91007bafa06f2f9fcd6ee1fd73fd165598')
sha256sums_aarch64=('7cc2b859333f40ef52eb62a1be3bfaa34dcbc27ef1c8bdc5bfaea7787597bc18')

verify() {
  export COSIGN_EXPERIMENTAL=true
  
  cosign verify-blob \
    --bundle "${_pkgsrc}-checksums.bundle" \
    --certificate-identity-regexp "https://github.com/suzuki-shunsuke/go-release-workflow/.github/workflows/release.yaml@.*" \
    --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
    "${_pkgsrc}-checksums.txt"

  cp "${_pkgsrc}-checksums.txt" "checksums.txt"
  sed -e "s/${_pkgname}_linux_${_barch[0]}/${_pkgsrc}-${arch[0]}/g" \
      -e "s/${_pkgname}_linux_${_barch[1]}/${_pkgsrc}-${arch[1]}/g" \
      -i "checksums.txt"

  sha256sum -c --ignore-missing "checksums.txt"

  slsa-verifier verify-artifact "${_pkgsrc}-${CARCH}.tar.gz" \
    --provenance-path "${_pkgsrc}-multiple.intoto.jsonl" \
    --source-uri "${_url#https://}" \
    --source-tag "v${pkgver}"
}

prepare() {
  cd "${srcdir}"

  mkdir -p "completions" "man"
  chmod +x ./"${_pkgname}"
}

build() {
  cd "${srcdir}"

  for _sh in bash fish pwsh zsh; do
    ./"${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done

  help2man "./${_pkgname}" --output "man/${_pkgname}.1" --no-info
}

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  install -vDm644 "completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "completions/${_pkgname}.pwsh" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -vDm644 "completions/${_pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
