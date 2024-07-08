# Maintainer: Alex Reinking alex_reinking@berkeley.edu
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kyle Keen <keenerd@gmail.com>
_base=halide
pkgname=${_base}-bin
pkgver=17.0.2
pkgrel=1
_noise="b2e6d2aa1f205c0ed5f4e266252c633268de2805"
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

sha512sums_x86_64=('4d90b27161fb5ceaf7a58de8b78fb4e0433b4014ce1d5ff14c4f776182e28d5cb8a60dc18b272e2ca8cf35d1cb5345b76f06b61570d35a6ef56122583068ac98')
sha512sums_i686=('60a06ba6ac1eb93ba572509652b9c6ff15a971503217276bb429e590c69858c367d083df7e157576d9380e294520da760cfb14d78eb4aabb4058128931595304')
sha512sums_armv7h=('d786ecf379d2fd27d20be5a37e0e363a9fe265d19a36b62725e2052a815e1414a36dc6302195fe7988a3f1d392f70551a41a097a4a73b97085096ed96229c5f8')
sha512sums_aarch64=('a6272f6290974d16faf82f1f6b8640c6489e456df6b6dcb0c122cddb36cd9385b770bf8afd4559f9ba92d756c4b82d6f83d4f216aa3c07f3f59542852df00f9b')

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
