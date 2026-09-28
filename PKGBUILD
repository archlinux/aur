# Maintainer: robertfoster
pkgbase=kuna-bin
pkgname=("${pkgbase}" "ghidra-extension-${pkgbase}")
_pkgname="${pkgbase%-bin}"
pkgver=1.604 # renovate: datasource=github-releases depName=Noelo-Lab/kuna
# Ghidra release the extension zip is built against; it is part of the asset name
_ghidraver=12.1.2
pkgrel=1
pkgdesc="Agent-first decompiler, ported from Ghidra to Rust, designed to be refined by other agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Noelo-Lab/kuna"
license=('Apache-2.0')
options=('!strip')
_dl="${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}"
source=("${_dl}-specs.tar.gz"
  "${_dl}-KunaDecompiler-ghidra_${_ghidraver}.zip")
source_x86_64=("${_dl}-linux-x86_64.tar.gz")
source_aarch64=("${_dl}-linux-arm64.tar.gz")
sha256sums=('6094b9e98493eb421704b8460b90e33bd6179e3c0887130a333d68352e81abba'
            '4933192966bdc387f90f5a88785e724eca3ed47503e8448d092dce89f0dc3230')
sha256sums_x86_64=('8a905f0cad0feba00b7889f6eca567cbd8a0f5905dd086b3e940ebef3a2c6cd5')
sha256sums_aarch64=('6d9973dbfa5c84f5f94abfacebe944751ce5363d01dba58bfd586db37a872da9')

package_kuna-bin() {
  depends=('glibc' 'libgcc')
  optdepends=("ghidra-extension-${pkgbase}: kuna as the decompiler core of the Ghidra GUI")
  provides=("${_pkgname}")
  conflicts=("${_pkgname}" "${_pkgname}-git")

  local _dist="${srcdir}/${_pkgname}-v${pkgver}-linux-${CARCH/aarch64/arm64}"

  # kuna finds decomp_dbg, slacomp and specs/ next to its symlink-resolved path
  install -Dm755 -t "${pkgdir}/usr/lib/${_pkgname}" \
    "${_dist}"/{kuna,decomp_dbg,slacomp}
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/kuna" "${pkgdir}/usr/bin/kuna"

  # compiled SLEIGH processor specs, vendored from Ghidra
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r --no-preserve=mode "${srcdir}/specs" "${pkgdir}/usr/share/${_pkgname}/"
  ln -s "/usr/share/${_pkgname}/specs" "${pkgdir}/usr/lib/${_pkgname}/specs"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgbase}" \
    "${_dist}"/{LICENSE,NOTICE}
}

package_ghidra-extension-kuna-bin() {
  pkgdesc="Ghidra extension running kuna as the native decompiler core behind the stock Ghidra GUI"
  depends=('ghidra' 'glibc' 'libgcc')
  provides=("ghidra-extension-${_pkgname}")
  conflicts=("ghidra-extension-${_pkgname}")

  local _dist="${srcdir}/${_pkgname}-v${pkgver}-linux-${CARCH/aarch64/arm64}"
  local _os="linux_${CARCH/aarch64/arm_64}"
  local _ext="${pkgdir}/opt/ghidra/Ghidra/Extensions/KunaDecompiler"

  # Ghidra loads modules in its installation Extensions/ dir for every user
  install -d "${_ext%/*}"
  cp -r "${srcdir}/KunaDecompiler" "${_ext%/*}/"

  # keep only this platform's kuna_ghidra backend; build.sh and the os/ README
  # are from-source helpers
  find "${_ext}/os" -mindepth 1 -maxdepth 1 ! -name "${_os}" -exec rm -r {} +
  rm -f "${_ext}/build.sh" "${_ext}/os/${_os}/README.md"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/ghidra-extension-${pkgbase}" \
    "${_dist}"/{LICENSE,NOTICE}
}
