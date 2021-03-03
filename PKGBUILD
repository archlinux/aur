pkgname=nsight-graphics
pkgver=2021.1.1
_pkgver=${pkgver//\./_}
pkgrel=1
pkgdesc="Standalone application for the debugging and profiling of graphics applications"
arch=(x86_64)
url="https://developer.nvidia.com/nsight-graphics"
license=("custom")
depends=("libx11" "libxcb" "NVIDIA-MODULE")
source=("NVIDIA_Nsight_Graphics_${pkgver}.run::https://developer.nvidia.com/rdp/assets/nsight-graphics-${_pkgver}-linux-installer"
        "${pkgname}.png::http://developer.download.nvidia.com/NsightVisualStudio/3.1/Documentation/UserGuide/HTML/Content/Images/NSight_256.png"
        "${pkgname}.desktop")
sha512sums=('96812d951608b83ed096be37d15b22ddd2748ce79fc8a69d2f1e8f38cd40a559ec8316ab9e56e3d453c6320d7d9d340cd695c3488eb634e9c42c898ab1f7cc22'
            '784985c2bd3a053cee4887af3b960c7fdc041dda3ca71196ec0870d5413f646d542687b16bffe85985a46d70f68ccf7df29ed5e39952d5e553a4beec485a1185'
            '6efb406dd53f76366fc3717b8605d4d63f568a203b94fcfe276889f3934b1dfd5f633582ddb8f6b8103365cd176042d831c384ec6c0f1c00fad2cd906988e3aa')
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
