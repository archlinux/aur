# Maintainer: robertfoster
pkgname=kuna-bin
_pkgname="${pkgname%-bin}"
pkgver=1.996 # renovate: datasource=github-releases depName=Noelo-Lab/kuna
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
sha256sums=('12ff4163100e0d2f979bf0c882b0de4cc1966e57ca2d1f5d9803edb3079a5142')
sha256sums_x86_64=('3e612d42676d282e206f9adee8c74aff81c19832e766b8f85001919bdd5985b9')
sha256sums_aarch64=('e020e7986b6a07bdb13d038d7ac0cf6b7117e67614a94fd6998ebaa60f471b35')

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
