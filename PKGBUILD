pkgname=nsight-graphics
pkgver=2020.5
_pkgver=${pkgver//\./_}
pkgrel=1
pkgdesc="Standalone application for the debugging and profiling of graphics applications"
arch=(x86_64)
url="https://developer.nvidia.com/nsight-graphics"
license=("custom")
depends=("libx11" "libxcb" "nvidia")
source=("NVIDIA_Nsight_Graphics_${pkgver}.run::https://developer.nvidia.com/rdp/assets/nsight-graphics-${_pkgver}-linux-installer"
        "${pkgname}.png::http://developer.download.nvidia.com/NsightVisualStudio/3.1/Documentation/UserGuide/HTML/Content/Images/NSight_256.png"
        "${pkgname}.desktop")
sha512sums=('7bb090a55773fb52c8c82d245245ffe965a4f5543900ec8930b832b93f81c32676ed7b170015eccdb5a71b7bea150967988348161b9a8da7f32f0240897e3f9e'
            '784985c2bd3a053cee4887af3b960c7fdc041dda3ca71196ec0870d5413f646d542687b16bffe85985a46d70f68ccf7df29ed5e39952d5e553a4beec485a1185'
            'e6ac4a16de65d8f82c0ac88f2445d9e2e57f6ea1597cc3c1a171d5c9d3d277e4e85140feceedfa6df84bafd837b57e2a252a9685c5dc43d2b5f72310fd9d8f21')
replaces=('nsight')
provides=('nsight')
options=('!debug')

prepare() {
  # Extract package
  sh "NVIDIA_Nsight_Graphics_${pkgver}.run" --noexec --target ${pkgname}
  # Fix install path /usr to ${pkgdir}/usr for registering of layers
  sed -i "s,\([= ]\)/usr/,\1${pkgdir}/usr/,g" ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/VK_LAYER_NV_nomad.sh
  sed -i "s,\([= ]\)/usr/,\1${pkgdir}/usr/,g" ${srcdir}/${pkgname}/pkg/host/linux-desktop-nomad-x64/VK_LAYER_NV_GPU_Trace.sh
}

package() {
  cd ${srcdir}/${pkgname}
  ./install-linux.pl -noprompt -targetpath=${pkgdir}/opt/${pkgname}

  install -dm 755 "${pkgdir}"/usr/bin
  ln -s /opt/${pkgname}/host/linux-desktop-nomad-x64/ngfx "${pkgdir}"/usr/bin
  ln -s /opt/${pkgname}/host/linux-desktop-nomad-x64/ngfx-ui "${pkgdir}"/usr/bin

  rm ${pkgdir}/opt/${pkgname}/host/linux-desktop-nomad-x64/VK_LAYER_NV_nomad.sh
  rm ${pkgdir}/opt/${pkgname}/host/linux-desktop-nomad-x64/VK_LAYER_NV_GPU_Trace.sh

  install -Dm644 "${srcdir}/${pkgname}.desktop" ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 "${srcdir}/${pkgname}.png" ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${pkgname}/pkg/EULA.txt"
}

# vim:set ts=2 sw=2 et:
