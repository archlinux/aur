# Maintainer: robertfoster
pkgname=kuna-bin
_pkgname="${pkgname%-bin}"
pkgver=1.992 # renovate: datasource=github-releases depName=Noelo-Lab/kuna
pkgrel=1
pkgdesc="Agent-first decompiler, ported from Ghidra to Rust, designed to be refined by other agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Noelo-Lab/kuna"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
optdepends=("ghidra-extension-${pkgname}: kuna as the decompiler core of the Ghidra GUI")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!strip')
_dl="${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}"
source=("${_dl}-specs.tar.gz")
source_x86_64=("${_dl}-linux-x86_64.tar.gz")
source_aarch64=("${_dl}-linux-arm64.tar.gz")
sha256sums=('b96e67c9f21038f9549b2970bdb70eea77fa7a7dafd49e534eb6e75da3e954a6')
sha256sums_x86_64=('f87d002309220de1f2f20479a7324b80a3779ba30d3624e1071091b51e2c0719')
sha256sums_aarch64=('8a6057cf507d7576fa0839de1b43dc2178ce6d119760a5408819a3d814893420')

package() {
  local _dist="${srcdir}/${_pkgname}-v${pkgver}-linux-${CARCH/aarch64/arm64}"

  # kuna finds specs/ next to its symlink-resolved path
  install -Dm755 -t "${pkgdir}/usr/lib/${_pkgname}" "${_dist}/kuna"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/kuna" "${pkgdir}/usr/bin/kuna"

  # compiled SLEIGH processor specs, vendored from Ghidra
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r --no-preserve=mode "${srcdir}/specs" "${pkgdir}/usr/share/${_pkgname}/"
  ln -s "/usr/share/${_pkgname}/specs" "${pkgdir}/usr/lib/${_pkgname}/specs"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${_dist}"/{LICENSE,NOTICE}
}
