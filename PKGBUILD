# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from {actual_model_used_for_push}.

pkgname=zxc-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Asymmetric lossless compression CLI — ultra-fast decode, 40%+ faster than LZ4 on ARM64 (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/hellobertrand/zxc"
license=('BSD-3-Clause')
provides=('zxc')
conflicts=('zxc')
options=('!debug' '!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/hellobertrand/zxc/releases/download/v${pkgver}/zxc-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/hellobertrand/zxc/releases/download/v${pkgver}/zxc-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('c46239c933dab799e649527ed23f05a7acc4103d9e261e627d46ba9bb4f7227e')
sha256sums_aarch64=('f02f776482179c6464ba4fd4605d48efce5a8e541be367559a5c0f4253421bf9')

package() {
  local _arch="${CARCH}"
  [[ "${_arch}" == "aarch64" ]] && _arch="arm64"
  local _dir="${srcdir}/zxc-${pkgver}-linux-${_arch}"

  # Since 1.0.0 the upstream tarball ships zxc plus unzxc/zxccat symlinks,
  # the zxcgrep and zxcless frontends, man pages and the static library.
  install -Dm755 "${_dir}/bin/zxc" "${pkgdir}/usr/bin/zxc"
 
  ln -s zxc "${pkgdir}/usr/bin/unzxc"
  ln -s zxc "${pkgdir}/usr/bin/zxccat"
  install -Dm755 "${_dir}/bin/zxcgrep" "${pkgdir}/usr/bin/zxcgrep"
  install -Dm755 "${_dir}/bin/zxcless" "${pkgdir}/usr/bin/zxcless"

  install -Dm644 "${_dir}/share/man/man1/zxc.1" "${pkgdir}/usr/share/man/man1/zxc.1"
  for _alias in unzxc zxccat zxcgrep zxcless; do
    ln -s zxc.1 "${pkgdir}/usr/share/man/man1/${_alias}.1"
  done

  install -Dm644 "${_dir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_dir}/THIRD_PARTY_NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"
}
