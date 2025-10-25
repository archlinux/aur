# Maintainer:  Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergey Balabanov <sergey dot balabanov at gmail dot com>

_pkgname="aqua"
pkgname="${_pkgname}-bin"
pkgver=2.55.0
pkgrel=3
pkgdesc="Declarative CLI version manager"
arch=('aarch64' 'x86_64')
url="https://aquaproj.github.io"
_url="https://github.com/aquaproj/${_pkgname}"
license=('MIT')
makedepends=(
  'cosign'
  'help2man'
  'slsa-verifier'
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
        "${_pkgsrc}-checksums.txt.pem::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_checksums.txt.pem"
        "${_pkgsrc}-checksums.txt.cosig::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_checksums.txt.sig" # rename to not confuse OpenPGP
        "${_pkgsrc}-multiple.intoto.jsonl::${_url}/releases/download/v${pkgver}/multiple.intoto.jsonl")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
sha256sums=('9e68862a32927a43a81e68cd7639b39470fb43526b1062ffca6931179d58dacc'
            '74c5c1a07a27a569e6e9a37863585e578de3e2098a094391cabd50c2af07ee98'
            '7162f9c48f17c7f2367e9465660668870ce81741e22f86d6d681bbbe8a61cbf1'
            'e3c0c9e35049062018a111bb4b88358ad4e3f718bd49a42b6847634c1dd2b443')
sha256sums_aarch64=('d65369f52c9a74a2b0c24f494bfbe639794f4aab7788274e04272740b2c27a16')
sha256sums_x86_64=('cb7780962ca651c4e025a027b7bfc82c010af25c5c150fe89ad72f4058d46540')

verify() {
  export COSIGN_EXPERIMENTAL=true
  
  cosign verify-blob \
    --certificate "${_pkgsrc}-checksums.txt.pem" \
    --signature "${_pkgsrc}-checksums.txt.cosig" \
    --certificate-identity-regexp "https://github.com/suzuki-shunsuke/go-release-workflow/.github/workflows/release.yaml@.*" \
    --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
    "${_pkgsrc}-checksums.txt"

  cp "${_pkgsrc}-checksums.txt" "checksums.txt"
  sed -e "s/${_pkgname}_linux_arm64/${_pkgsrc}-aarch64/g" \
      -e "s/${_pkgname}_linux_amd64/${_pkgsrc}-x86_64/g" \
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
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.pwsh" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -vDm644 "${_pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
