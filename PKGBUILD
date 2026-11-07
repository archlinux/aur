# Maintainer: robertfoster
pkgname=ghidra-extension-kuna-bin
_pkgname=kuna
pkgver=1.993 # renovate: datasource=github-releases depName=Noelo-Lab/kuna
# Ghidra release the extension zip is built against; it is part of the asset name
_ghidraver=12.1.2
pkgrel=1
pkgdesc="Ghidra extension running kuna as the native decompiler core behind the stock Ghidra GUI"
arch=('x86_64' 'aarch64')
url="https://github.com/Noelo-Lab/kuna"
license=('Apache-2.0')
depends=('ghidra' 'glibc' 'libgcc')
provides=("ghidra-extension-${_pkgname}")
conflicts=("ghidra-extension-${_pkgname}")
options=('!strip')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-KunaDecompiler-ghidra_${_ghidraver}.zip"
  "${_pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE"
  "${_pkgname}-${pkgver}-NOTICE::${url}/raw/v${pkgver}/NOTICE")
sha256sums=('4a31a8f253345d89e9e81c7f1610b35194aa8425bc49aedd813981fafe42126b'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '19c1091563a3d968453cf4b3276da9fed3cad583af6a9b53ba38d9545656fb87')

package() {
  local _os="linux_${CARCH/aarch64/arm_64}"
  local _ext="${pkgdir}/opt/ghidra/Ghidra/Extensions/KunaDecompiler"

  # Ghidra loads modules in its installation Extensions/ dir for every user
  install -d "${_ext%/*}"
  cp -r "${srcdir}/KunaDecompiler" "${_ext%/*}/"

  # keep only this platform's kuna_ghidra backend; build.sh and the os/ README
  # are from-source helpers
  find "${_ext}/os" -mindepth 1 -maxdepth 1 ! -name "${_os}" -exec rm -r {} +
  rm -f "${_ext}/build.sh" "${_ext}/os/${_os}/README.md"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-NOTICE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
