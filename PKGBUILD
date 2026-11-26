# Maintainer: robertfoster
pkgname=kuna-bin
_pkgname="${pkgname%-bin}"
pkgver=1.1007 # renovate: datasource=github-releases depName=Noelo-Lab/kuna
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
sha256sums=('3c2c3ef4962310f3f898243c46fdeee31c995eabdcaccb5135dd34ecfe5a2ce2')
sha256sums_x86_64=('45d99f4c2f7289c739cf14654d1266d9ce775bd109425531a3b418a1526fc0b0')
sha256sums_aarch64=('e6a321a61105284bda8b1118307a9d6b301ce42b5bedf3d986aa73ea1c27e878')

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
