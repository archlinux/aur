# Maintainer: Alex Reinking alex_reinking@berkeley.edu
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kyle Keen <keenerd@gmail.com>
_base=halide
pkgname=${_base}-bin
pkgver=14.0.0
pkgrel=1
_noise="6b9ed2afd1d6d0badf04986602c943e287d44e46"
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

sha512sums_x86_64=('fa58682bb9f15ce21acc051b3e1763fdc1c16d6516108ba36902d28ed1361730f74316d2e3514ee889c2d8e57446f414c6a9ef733c82f91f9bd0406477795e40')
sha512sums_i686=('a2c0b6ef32efec9429c6e2db6aad15d77bb3dd406366972378d4e27fa770c4c7275479604091e2c521fc7f36eb1857d2b573da5bcd26d73841f445eec3332649')
sha512sums_armv7h=('9bff7c122d5328e8a16ce3031adfc97c87489155edaaa0ef181a78e24f32728e0211f38decc6932efa001977dec459ab058362ec5ee48f76330b181c9ee34ba7')
sha512sums_aarch64=('9294289e925a95f9e949b831db0b4da6dbdbc668ab80f2a59af83974a0a0be3a5fe61172e0276da6437f6c9199f579a4af34fc1f6265c1ac776ffef95515e3da')

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
  chmod 644 "${pkgdir}/usr/lib/libwasm-rt-impl.a"

  # For test later
  # ln -s /usr/lib/libHalide.so ${pkgdir}/usr/lib/libHalide.so.14
  # ln -s /usr/lib/libHalide.so.14 ${pkgdir}/usr/lib/libHalide.so.14.0.0

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
  chmod 755 "${pkgdir}/usr/share/Halide/tools/autotune_loop.sh"

  for i in share/doc/Halide/*.md; do
    install -Dvm644 "${i}" -t "${pkgdir}/usr/share/doc/Halide"
  done
}
