# Maintainer: Alex Reinking alex_reinking@berkeley.edu
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kyle Keen <keenerd@gmail.com>
_base=halide
pkgname=${_base}-bin
pkgver=17.0.0
pkgrel=1
_noise="3577f88cc38e4def98a00dd8abaaf1bd6c2d4efa"
pkgdesc="A language for fast and portable data-parallel computation"
url="https://github.com/${_base}/${_base/h/H}"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=(MIT)
conflicts=("${pkgname/-bin/}")
provides=("${pkgname/-bin/}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-x86-64-linux-${_noise}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-x86-32-linux-${_noise}.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-arm-32-linux-${_noise}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-arm-64-linux-${_noise}.tar.gz")

sha512sums_x86_64=('17f3d44d547764d7be1e8914b0a820d8018a5a16c9da9c3968608fdfc7cb0b9dc5ee9bbd9d7c2c5a2244f2695891ad27b91d4812b29970d6d6e9766ff4aae349')
sha512sums_i686=('e55f1ddfd3ddec9a5e8358d904e586c413338b20fb090180ec9ad22a75af87b92e683315d0fe696f2efb30863973fb40bcd914af6cf95bafc99ccec96dcd5055')
sha512sums_armv7h=('12cf249f2c0204e70bdda61d2327720b7b7b370f64b98605db6f8ef752c3f0a43f80dbbf1dd0b38530413975dc34e8204dd87a560718f6dfcf33b9f29bcab1d7')
sha512sums_aarch64=('d106b32c549dc2574373a97584359d849297fa61c9e32faa06bf6f20e4e95fe01d3992fefbbdb5d55f870005562059764b7c4cc4af76856e64144dc5a795f580')

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
