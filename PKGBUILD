# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=nouveau-fw-gsp
pkgver=570.124.04
pkgrel=2
pkgdesc="NVIDIA GSP (Turing+) firmware for the latest GSP kernel code"
arch=('any')
url="https://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/README/gsp.html"
license=('MIT' 'LicenseRef-NVIDIA')
makedepends=('git' 'python3')
conflicts=('linux-firmware-nvidia>=20250613.12fe085f-2') # This package version has the R570 GSP
_nvidia="NVIDIA-Linux-x86_64-${pkgver}"
_gsp_output="_out/nvidia"
source=("git+https://github.com/NVIDIA/open-gpu-kernel-modules.git#tag=${pkgver}?signed"
        "https://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_nvidia}.run")
sha256sums=('7d3c6bf3f0ced936fa536ef10cc0e317e7a4eb180cc7c25da7766fa5a83dd32e'
            '1b786a4b7122d7c4216c58ae4007688a4f778c196c148d919163815ee10d53c4')
validpgpkeys=('176D338FCB6EDC71F934ED427D23DC2750FAC2E1') # Bernhard Stoeckner

build() {
  cd open-gpu-kernel-modules

  # Compile the early GSP blobs for packaging (with an extra option to install the main one)
  rm -r "${_gsp_output}" || true
  ./nouveau/extract-firmware-nouveau.py -s -d ../"${_nvidia}".run
}

package() {
  cd open-gpu-kernel-modules

  # Note: Main GSP blob is somehow over 20 MB (or 60 MB for shared Ampere/Ada/Blackwell)
  # (Interesting article about this: https://www.phoronix.com/news/NVIDIA-GSP-Firmware-Bloat)
  echo "Packaging GSP blobs..."
  install -dm755 "${pkgdir}"/usr/lib/firmware
  cp -a "${_gsp_output}" "${pkgdir}"/usr/lib/firmware

  _tmp_dir="$(mktemp -d)"
  pushd "${_tmp_dir}" > /dev/null; sh "${srcdir}/${_nvidia}.run" -x; popd > /dev/null

  # MIT/Expat license (for the early GSP blobs)
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.expat

  # Proprietary NVIDIA license (for the main GSP blob)
  install -Dm644 "${_tmp_dir}/${_nvidia}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.nvidia

  rm -r "${_tmp_dir}"
}
