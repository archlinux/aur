# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
#
# Source of truth for https://aur.archlinux.org/packages/long-multiplication-bin
# The `release` workflow (.github/workflows/release.yml) rewrites
# `pkgver`, `pkgrel` and the checksums for every tag, regenerates
# .SRCINFO and pushes both files to the AUR. The values below are the
# ones of the last release this file was tested with.

pkgname=long-multiplication-bin
_name=long-multiplication
pkgver=2.3.2
pkgrel=1
pkgdesc='Long multiplication step by step, as taught in school: carries, column sums and subtotals (pre-built binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/airvzxf/long-multiplication-calculator'
license=('AGPL-3.0-only')
provides=("${_name}")
conflicts=("${_name}")
# Static musl binary, already stripped by the release build.
options=('!strip' '!debug')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_name}-${pkgver}-x86_64.tar.gz::${_release}/${_name}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${_name}-${pkgver}-aarch64.tar.gz::${_release}/${_name}-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('3b3c827476e453d8a3284b404795165b9a68547a58deebf9cc857092d355c316')
sha256sums_aarch64=('a4064b868e5679b060a50998bdff101a776c728f0df0f27840a28fd2c7c22651')

check() {
  cd "${_name}-v${pkgver}-${CARCH}-unknown-linux-musl"
  [[ "$(./${_name} --version)" == "${_name} ${pkgver}" ]]
  # 5 x 7 = 35: the product row of the table.
  ./${_name} 5 7 | grep -q '3 │ 5 ┃ P'
}

package() {
  cd "${_name}-v${pkgver}-${CARCH}-unknown-linux-musl"
  install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
