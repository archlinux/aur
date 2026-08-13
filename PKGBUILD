# Maintainer:  Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergey Balabanov <sergey dot balabanov at gmail dot com>

_pkgname="aqua"
pkgname="${_pkgname}-bin"
pkgver=2.62.3
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
sha256sums=('ac7541381bc674f71c91f2bc3017521e4f76ed894ac388abed57f80516faca36'
            '211a152c2aa88ef7e3e95f3277146ea4666193efbf98f923942df9655ee92219'
            '627ef4ee2b78112ec888d25f8a0983ba452547f2c17ca3b5ae83a008dd110777')
sha256sums_x86_64=('89cb081adb19e425b1dca6b16d912c349a43535ce88d8713050738c9263618d0')
sha256sums_aarch64=('a6b485fc465cd9317a2d8421bd145d4364606690fa49840347eca9ec84223fa9')

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
