# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034

# Note: The exit 1 conditions are for silencing shellcheck warnings

pkgname=nouveau-fw-gsp
pkgver=535.54.03
pkgrel=1
pkgdesc="NVIDIA GSP (Turing+) firmware for the latest skeggsb GSP kernel"
arch=('any')
url="https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/README/gsp.html"
license=('MIT' 'custom')
options=('!strip') # Disabled for now to prevent potential issues
makedepends=('git' 'python3')
_nvidia="NVIDIA-Linux-x86_64-${pkgver}"
_gsp_version="${pkgver//.}"
_gsp_output="_out/nvidia"
source=("git+https://github.com/NVIDIA/open-gpu-kernel-modules.git?signed#tag=${pkgver}"
        "https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_nvidia}.run")
sha256sums=('SKIP'
            '454764f57ea1b9e19166a370f78be10e71f0626438fb197f726dc3caf05b4082')
validpgpkeys=('FAC001E8B1F43387247B90526D466BB75E006CFC') # Andy Ritger <aritger@nvidia.com>

prepare() {
  # Compile the early GSP blobs for packaging
  cd open-gpu-kernel-modules || exit 1
  python3 nouveau/extract-firmware-nouveau.py
  cd ..

  # Run NVIDIA proprietary driver installer to get the main GSP blob
  if [ ! -d "${_nvidia}" ]; then
    sh "${_nvidia}.run" --extract-only
  fi
}

package() {
  cd open-gpu-kernel-modules || exit 1

  # Early GSP blobs
  echo "Packaging early GSP blobs..."

  install -dm755 "${pkgdir}"/usr/lib/firmware/nvidia/{tu102,tu116,ga100,ga102}/gsp

  for _chipset in tu104 tu106 tu117 ga103 ga104 ga106 ga107; do
    install -dm755 "${pkgdir}"/usr/lib/firmware/nvidia/"${_chipset}"
    [[ "${_chipset}" == ga* ]] && ln -s ../ga102/gsp "${pkgdir}"/usr/lib/firmware/nvidia/"${_chipset}"/gsp
    [[ "${_chipset}" == tu10* ]] && ln -s ../tu102/gsp "${pkgdir}"/usr/lib/firmware/nvidia/"${_chipset}"/gsp
    [[ "${_chipset}" == tu11* ]] && ln -s ../tu116/gsp "${pkgdir}"/usr/lib/firmware/nvidia/"${_chipset}"/gsp
  done

  for _chipset in tu102 ga100 ga102; do
    install -Dm644 "${_gsp_output}"/"${_chipset}"/gsp/*.bin -t "${pkgdir}"/usr/lib/firmware/nvidia/"${_chipset}"/gsp
  done

  ln -s ../../tu102/gsp/bootloader-"${_gsp_version}".bin "${pkgdir}"/usr/lib/firmware/nvidia/tu116/gsp
  install -Dm644 "${_gsp_output}"/tu116/gsp/booter*.bin -t "${pkgdir}"/usr/lib/firmware/nvidia/tu116/gsp

  # MIT/Expat license (for the early GSP blobs)
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.expat


  cd ../"${_nvidia}" || exit 1

  # Main GSP blob (this is over 20 MB (or 30 MB for Ampere) somehow)
  # Interesting article about this: https://www.phoronix.com/news/NVIDIA-GSP-Firmware-Bloat
  echo "Packaging main GSP blob..."

  install -Dm644 firmware/gsp_tu10x.bin "${pkgdir}"/usr/lib/firmware/nvidia/tu102/gsp/gsp-"${_gsp_version}".bin
  install -Dm644 firmware/gsp_ga10x.bin "${pkgdir}"/usr/lib/firmware/nvidia/ga100/gsp/gsp-"${_gsp_version}".bin
  ln -s ../../tu102/gsp/gsp-"${_gsp_version}".bin "${pkgdir}"/usr/lib/firmware/nvidia/tu116/gsp/gsp-"${_gsp_version}".bin
  ln -s ../../ga100/gsp/gsp-"${_gsp_version}".bin "${pkgdir}"/usr/lib/firmware/nvidia/ga102/gsp/gsp-"${_gsp_version}".bin

  # Proprietary NVIDIA license (for the main GSP blob)
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.nvidia
}
