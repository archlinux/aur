# Maintainer: Bieito "bieito" <>
# Contributor: Sandy Carter "bwrsandman" <>

pkgname=nsight-graphics
# version and "code" from https://developer.nvidia.com/tools-downloads#?search=NVIDIA%20Nsight%20Graphics
pkgver=2025.4.1
_vercode=25250
_pkgver=${pkgver//\./_}
pkgrel=1
pkgdesc="Standalone application for the debugging and profiling of graphics applications"
arch=(x86_64)
url="https://developer.nvidia.com/nsight-graphics"
license=("custom")
# dependencies from https://docs.nvidia.com/nsight-graphics/InstallationGuide/index.html#linux-installation-and-setup
depends=(
  "glibc"
  "libxcb"
  "xcb-util-cursor" "xcb-util-wm" "xcb-util-image" "xcb-util-keysyms" "xcb-util-renderutil" "xcb-util" "libxext" "libxkbcommon-x11" "libxrender"
)
optdepends=(
  "libvulkan.so" "libzstd.so" 
)
source=("NVIDIA_Nsight_Graphics_${pkgver}.run::https://developer.nvidia.com/downloads/assets/tools/secure/nsight-graphics/${_pkgver}/linux/NVIDIA_Nsight_Graphics_${pkgver}.${_vercode}.run"
        "ngfx-ui.png::https://developer.download.nvidia.com/images/nvidia-nsight-graphics-icon-gbp-shaded-128.png"
        "${pkgname}.desktop")
sha512sums=('76f23f728de8eaa9822901f788aef7dd07b424c33fc1fc42f2d9160258ea50863275f82f8a3c1433c93d46da9640a56e7f714804e7a9ecf40a68a67051b97d9e'
            '81d9682fb9b190698418fd110d02f6f32776a9b013600152b3241b9811194a7ec18bb3d8e823b1f3f857e7ff12a4b3a1801b8cd886f7677f4adf451440e52639'
            '5db24d90129e9c9998c2246c0848c91f0ae64333f536d90533b724a6053c2f1efcb8c862d470fac946ed72855eb5086e543e611f6445c68c1d95105bbcdc0c96')
options=('!debug')

prepare() {
  sh "NVIDIA_Nsight_Graphics_${pkgver}.run" --target "${srcdir}" --noexec
}

package() {
  # Run installation script from NVIDIA
  "${srcdir}/install-linux.pl" -noprompt -targetpath="${pkgdir}/opt/${pkgname}"

  # Installation script creates a subdirectory "NVIDIA-Nsight-Graphics-<major ver>.<minor ver>" inside <targetpath>
  # Create link to that subdirectory so that other resources can point to /opt/nsight-graphics/latest/
  local _nv_subdir="NVIDIA-Nsight-Graphics-${pkgver%.*}"
  ln -s "${_nv_subdir}" "${pkgdir}/opt/${pkgname}/latest"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/latest/host/linux-desktop-nomad-x64/ngfx" "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/latest/host/linux-desktop-nomad-x64/ngfx-ui" "${pkgdir}/usr/bin"

  # Install icon and desktop entry
  install -Dm644 -t "${pkgdir}/opt/${pkgname}/latest/host/linux-desktop-nomad-x64" "${srcdir}/ngfx-ui.png"
  install -Dt "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"

  # Licenses
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/latest/EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/EULA.txt"
}

# vim:set ts=2 sw=2 et:
