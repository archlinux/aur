# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="fga"
pkgname="${_pkgname}-bin"
pkgver=0.8.2
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
sha256sums=('8270d7dcb94dc97eb7b6ef589bd9e23fc4987642564fd872a63594e7455cb0b4'
            'c68516fec76ef22d888c3ad78719d938aca8ecf574a8a3202d9070055bdbc3d4'
            'f1c116f436f4d0c3415ce72da150ac349c4c0c4d1f61f08ace03478bfe00337d'
            '706ab40639a1055c268f1a648b87ea2db1c05eb3aa9f408e02056d6d6b94ddea')
sha256sums_aarch64=('53466aa8fa3bcdf00aa118aabb90c81aedc178501169f53df167aac4e4638e3a')
sha256sums_i686=('c0dbfec84aa79264acdd1bf004a7e63457b947950a38df12a366d03c09cd9201')
sha256sums_x86_64=('e48c4a73cf68031fe9fc0827f1462a9b2d6981e3d2e9b82f1e1c2e120c293443')

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
