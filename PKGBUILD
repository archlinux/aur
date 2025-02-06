pkgname=nsight-graphics
pkgver=2024.3.0
_vercode=24333
_pkgver=${pkgver//\./_}
pkgrel=1
pkgdesc="Standalone application for the debugging and profiling of graphics applications"
arch=(x86_64)
url="https://developer.nvidia.com/nsight-graphics"
license=("custom")
depends=("libx11" "libxcb" "NVIDIA-MODULE")
#provides=('nsight')
#replaces=('nsight')
source=("NVIDIA_Nsight_Graphics_${pkgver}.run::https://developer.nvidia.com/downloads/assets/tools/secure/nsight-graphics/${_pkgver}/linux/NVIDIA_Nsight_Graphics_${pkgver}.${_vercode}.run"
        "ngfx-ui.png::https://developer.download.nvidia.com/images/nvidia-nsight-graphics-icon-gbp-shaded-128.png"
        "${pkgname}.desktop")
sha512sums=('a9fa3e11fc874d7964591ad2bb91fe6fd3606be4dc1ef6e337901d4f21d996acb46216611f9d0b1e01d2e2a2d3a3b61ea5a543c36a9f545772853fdea9fae47f'
            '81d9682fb9b190698418fd110d02f6f32776a9b013600152b3241b9811194a7ec18bb3d8e823b1f3f857e7ff12a4b3a1801b8cd886f7677f4adf451440e52639'
            '5db24d90129e9c9998c2246c0848c91f0ae64333f536d90533b724a6053c2f1efcb8c862d470fac946ed72855eb5086e543e611f6445c68c1d95105bbcdc0c96')
options=('!debug')

prepare() {
  sh "NVIDIA_Nsight_Graphics_${pkgver}.run" --target "${srcdir}" --noexec

  # Fix install path /usr to ${pkgdir}/usr for registering of layers
  #sed -i "s,\([= ]\)/usr/,\1${pkgdir}/usr/,g" ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/VK_LAYER_NV_nomad.sh
  #sed -i "s,\([= ]\)/usr/,\1${pkgdir}/usr/,g" ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/VK_LAYER_NV_GPU_Trace.sh
}

package() {
  "${srcdir}/install-linux.pl" -noprompt -targetpath="${pkgdir}/opt/${pkgname}"

  # installation script from nvidia creates a subdirectory "NVIDIA-Nsight-Graphics-<major ver>.<minor ver>" inside <targetpath>
  # create link to that subdirectory so that other resources can point to /opt/nsight-graphics/latest/
  local _nv_subdir="NVIDIA-Nsight-Graphics-${pkgver%.*}"
  ln -s "${_nv_subdir}" "${pkgdir}/opt/${pkgname}/latest"

  #install -dm 755 "${pkgdir}"/usr/bin
  #ln -s /opt/${pkgname}/host/linux-desktop-nomad-x64/ngfx "${pkgdir}"/usr/bin
  #ln -s /opt/${pkgname}/host/linux-desktop-nomad-x64/ngfx-ui "${pkgdir}"/usr/bin

  #rm ${pkgdir}/opt/${pkgname}/host/linux-desktop-nomad-x64/VK_LAYER_NV_nomad.sh
  #rm ${pkgdir}/opt/${pkgname}/host/linux-desktop-nomad-x64/VK_LAYER_NV_GPU_Trace.sh

  # Install icon and desktop entry
  install -Dm644 -t "${pkgdir}/opt/${pkgname}/latest/host/linux-desktop-nomad-x64" "${srcdir}/ngfx-ui.png"
  install -Dt "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"

  # Licenses
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/latest/EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/EULA.txt"
}

# vim:set ts=2 sw=2 et:
