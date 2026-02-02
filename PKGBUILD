# Maintainer:  Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergey Balabanov <sergey dot balabanov at gmail dot com>

_pkgname="aqua"
pkgname="${_pkgname}-bin"
pkgver=2.56.6
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
        "${_pkgsrc}-checksums.txt.pem::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_checksums.txt.pem"
        "${_pkgsrc}-checksums.txt.cosig::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_checksums.txt.sig" # rename to not confuse OpenPGP
        "${_pkgsrc}-multiple.intoto.jsonl::${_url}/releases/download/v${pkgver}/multiple.intoto.jsonl")
source_x86_64=("${_pkgsrc}-${arch[0]}.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgsrc}-${arch[1]}.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_${_barch[1]}.tar.gz")
sha256sums=('9eb12318805ffb7b3bf338cfdf9a424e3049e623bef6662afd263c9e18789bab'
            '30d643737ed1bfab7d899c2fe3789dccc27bed76311a2f9c5b5d067584b4c837'
            '1e01347e23038c60b503171f9fc9eea623ad1d484bbbff8fd52b2c38a6e480cb'
            '2d2c2c9a524ed6f57895f4cbe43fd00dff9bd9ffd8292a6c3e58245907f43b67')
sha256sums_x86_64=('f6ffd22e02e6d454ab2699a03b70b7f9b8ae5aaa0d84405592db3c6a3c48c19a')
sha256sums_aarch64=('47e098b62d1794956026ba4bd56be3fa0772074576747463b03ccea4825952d6')

verify() {
  export COSIGN_EXPERIMENTAL=true
  
  cosign verify-blob \
    --certificate "${_pkgsrc}-checksums.txt.pem" \
    --signature "${_pkgsrc}-checksums.txt.cosig" \
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
