# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="omm"
pkgname="${_pkgname}-bin"
pkgver=0.7.0
pkgrel=1
pkgdesc="A keyboard-driven task manager for the command line"
arch=(
  'aarch64'
  'x86_64'
)
url="https://tools.dhruvs.space/${_pkgname}"
_url="https://github.com/dhth/${_pkgname}"
license=(
  'MIT'
)
makedepends=(
  'cosign'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-checksums.txt::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_checksums.txt"
  "${_pkgsrc}-checksums.txt.pem::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_checksums.txt.pem"
  "${_pkgsrc}-checksums.txt.cosig::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_checksums.txt.sig" # rename to not confuse gpg
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz"
)
sha256sums=('c92d405d4c65603026eedd0a3d9ecb8e164fc9bc1f9ae060d43498ccc56cb608'
            '6d02b0a4678e1aa9392cca40e8f6ae00e015d962b01af5bce595961ba423d599'
            'af26158bcfd6df6c6e6bd10b9499d5cb4002d84d80b5bbb37ac482e06276df06')
sha256sums_aarch64=('377296286d6cb771fb402dfff9295ed28bf9b1d5b945881e40564f68ab133e9a')
sha256sums_x86_64=('95f6e51ecff1bddc69e7813f5117e441b3921b8ed051922a8de020da8b4d35f0')

verify() {
  export COSIGN_EXPERIMENTAL=true
  
  cosign verify-blob \
    --certificate "${_pkgsrc}-checksums.txt.pem" \
    --signature "${_pkgsrc}-checksums.txt.cosig" \
    --certificate-identity-regexp "${_url}/.github/workflows/release.yml@refs/tags/v${pkgver}" \
    --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
    "${_pkgsrc}-checksums.txt"

  sha256sum -c --ignore-missing "${_pkgsrc}-checksums.txt"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
