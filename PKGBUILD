# Maintainer: robertfoster
pkgname=kuna-bin
_pkgname="${pkgname%-bin}"
pkgver=1.1006 # renovate: datasource=github-releases depName=Noelo-Lab/kuna
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
sha256sums=('49b8053d6e8eba8d7f16521b1232f2342056db62944f41575dbbf70454c90cc3')
sha256sums_x86_64=('581870a0de985d28d1b724c589f721b834bcc68147f302aab3e20c35eb44a0b9')
sha256sums_aarch64=('bb58c0e8ed82c21ed5d8fa6728b7e29a21a89a4daf2d8123ee614b9d59f33e4b')

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
