# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="phylum"
pkgname="${_pkgname}-bin"
pkgver=7.5.0
pkgrel=3
pkgdesc="Command line interface for the Phylum API"
arch=(
  'aarch64'
  'x86_64'
)
url="https://phylum.io"
_url="https://github.com/phylum-dev/cli"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'zlib'
)
makedepends=(
  'openssl'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
  "${_pkgsrc}.openssl.pub::${_url}/raw/refs/tags/v${pkgver}/scripts/signing-key.pub"
)
source_aarch64=(
  "${_pkgsrc}-aarch64-unknown-linux-gnu.zip::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.zip"
  "${_pkgsrc}-aarch64-unknown-linux-gnu.zip.signature::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.zip.signature"
)
source_x86_64=(
  "${_pkgsrc}-x86_64-unknown-linux-gnu.zip::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.zip"
  "${_pkgsrc}-x86_64-unknown-linux-gnu.zip.signature::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.zip.signature"
)
sha256sums=('510e1e77b3a63ffba39c1f5c4c7fc5c95a5a6b202dd1a03f3986ccb009cd2619'
            'd733d415524b70b6e2b3016b2d0e279a12dcfc77dc78d6fb7b852a324455d0e8'
            'bf7bed83defddbaf30ff7c1a7d24a803170064ed729aed1e9686095e8f1f5ca7'
            '0d5d00a0b9fc2451e745468a6d8c57370de7484140b5932d95db0bc4e377090e')
sha256sums_aarch64=('e93af53417ed3c770261cf921de1830b6d38419e0f98a7adb70ba21556e364cf'
                    'SKIP')
sha256sums_x86_64=('678a1f4d58f00d07ea7b1c0465e501748db77b23a097ed43326b6744166ae0e8'
                   'SKIP')

verify() {
  openssl dgst -sha256 \
    -verify "${_pkgsrc}.openssl.pub" \
    -signature "${_pkgsrc}-${CARCH}-unknown-linux-gnu.zip.signature" \
    "${_pkgsrc}-${CARCH}-unknown-linux-gnu.zip"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgname}-${CARCH}-unknown-linux-gnu"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "_${_pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
