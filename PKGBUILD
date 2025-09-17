# Maintainer: Alex Reinking alex_reinking@berkeley.edu
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kyle Keen <keenerd@gmail.com>
_base=halide
pkgname=${_base}-bin
pkgver=21.0.0
pkgrel=1
_noise="b629c80de18f1534ec71fddd8b567aa7027a0876"
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

sha512sums_x86_64=('361918b7f7cb67229dc4436a9db6b41790b274fffa861a31ad17e3c73298bc6bff7fc7524c00af492c2758a6231e8a02e3b42f060e7ac24822e26011e8bd0034')
sha512sums_i686=('547353d5899d4cc5b9847c445c5b9d157c2df1a719c34e1c4ccfdf4f5029e7ad9645173e82fb78070e88a876670f941beb0de662d8409d3634e25c8d45e4fc70')
sha512sums_armv7h=('3557827de0ab06281aeac76eecf4b6492fd8c5c08ff807d72f358bc4a4db37e612040b61405cb2478f6c5a64b4f6507d3b5e35c22dec103bec65ea35cb0b1cc5')
sha512sums_aarch64=('6c5eb62191ce449b6db062cbd70a44951468cb74f34223d96c33bf453ba8cf3e85b572fa2ad619f62797aa6c01f6973f9017e1b313cd9479e7e075eff75e7479')

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
