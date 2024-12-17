# Maintainer: Alex Reinking alex_reinking@berkeley.edu
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kyle Keen <keenerd@gmail.com>
_base=halide
pkgname=${_base}-bin
pkgver=19.0.0
pkgrel=1
_noise="5f17d6f8a35e7d374ef2e7e6b2d90061c0530333"
pkgdesc="A language for fast and portable data-parallel computation"
url="https://github.com/${_base}/${_base/h/H}"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=(MIT)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-x86-64-linux-${_noise}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-x86-32-linux-${_noise}.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-arm-32-linux-${_noise}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-arm-64-linux-${_noise}.tar.gz")

sha512sums_x86_64=('4370f770838c3a7a6c20c361fe07cf04d3f01b82fa2334eb25ce68493e3f57e2a5644a816428ad9902db514e58c9a43c7ad8943ab0a7e39a460b282f4f00b55f')
sha512sums_i686=('55c003c17675aafac484ed63151f1ee2a55d3bad7d51c8b3119c015754364c3a24e55601a88279b26d2c8daa4b8c8053b2dd98967e482fc4eaee1283c8e0af2f')
sha512sums_armv7h=('fae1195ba30e68005a501442ce341fede64afe6d77004c8d6dda5cb50228363dde76bd075ec04b690f727aa01c70dbfbd637bfbfc126485dc97c79ceae5d1bb1')
sha512sums_aarch64=('f7377351d5cd620467d6ad4f6c7fd91cdef1cabf0114d6f2040748f2ed5d8efb7e9f2fd0e4ffa933402799c492175ce06918dc1194d70249b262bc48ae6d2696')

if [[ "$CARCH" == "x86_64" ]]; then _tar_arch='x86-64'; fi
if [[ "$CARCH" == "i686" ]]; then _tar_arch='x86-32'; fi
if [[ "$CARCH" == "armv7h" ]]; then _tar_arch='arm-32'; fi
if [[ "$CARCH" == "aarch64" ]]; then _tar_arch='arm-64'; fi

package() {
  cd "${_base/h/H}-${pkgver}-${_tar_arch}-linux"

  # Instal binaries
  for i in bin/*; do
    install -Dvm755 "${i}" -t "${pkgdir}/usr/bin"
  done

  # Install headers
  for i in include/*.h; do
    install -Dvm644 "${i}" -t "${pkgdir}/usr/include"
  done

  for i in lib/lib*; do
    install -Dvm755 "${i}" -t "${pkgdir}/usr/lib"
  done

  # Set read permissions
  chmod 644 "${pkgdir}/usr/lib/libHalide.a"

  # For test later
  # ln -s /usr/lib/libHalide.so ${pkgdir}/usr/lib/libHalide.so.16
  # ln -s /usr/lib/libHalide.so.15 ${pkgdir}/usr/lib/libHalide.so.16.0.0

  # Install cmake functions
  for i in lib/cmake/Halide/*.cmake; do
    install -Dvm644 "${i}" -t "${pkgdir}/usr/lib/cmake/Halide"
  done

  # Install cmake functions
  for i in lib/cmake/HalideHelpers/*.cmake; do
    install -Dvm644 "${i}" -t "${pkgdir}/usr/lib/cmake/HalideHelpers"
  done

  for i in share/Halide/tools/*; do
    install -Dvm644 "${i}" -t "${pkgdir}/usr/share/Halide/tools"
  done

  # Set execution permissions
  chmod 755 "${pkgdir}/usr/share/Halide/tools/adams2019_autotune_loop.sh"

  for i in share/doc/Halide/*.md; do
    install -Dvm644 "${i}" -t "${pkgdir}/usr/share/doc/Halide"
  done
}
