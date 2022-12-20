# Maintainer: tytan652 <tytan652@tytanium.xyz>

_pkgname=nvidia-vulkan-utils
pkgname=${_pkgname}-nvlax
pkgver=525.47.04
pkgrel=1
pkgdesc="NVIDIA drivers utilities (vulkan developer branch) with NVENC and NvFBC patched with nvlax"
arch=('x86_64')
license=('custom')
url="https://github.com/illnyang/nvlax/"
depends=(
  'xorg-server' 'libglvnd' 'egl-wayland'
  'gtk3'
)
makedepends=('cmake' 'git')
optdepends=(
  'xorg-server-devel: nvidia-xconfig'
  "opencl-nvidia-vulkan=${pkgver}: OpenCL support"
)
conflicts=(
  "${_pkgname}"
  'nvidia-libgl'
  'nvidia-fake-powerd'
)
provides=(
  "${_pkgname}=${pkgver}"
  "nvidia-utils=${pkgver}" "nvidia-utils-nvlax"
  'vulkan-driver' 'opengl-driver'
  'nvidia-libgl'
  'nvidia-settings'
)
replaces=(
  'nvidia-libgl'
)
install="${_pkgname}.install"
options=('!strip' '!ccache')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=(
  "nvidia-drm-outputclass.conf"
  "${_pkgname}.sysusers"
  "nvidia.rules"
  "${_pkg}.run::https://developer.nvidia.com/downloads/vulkan-beta-${pkgver//.}-linux"
  "nvlax::git+https://github.com/illnyang/nvlax.git#commit=b3699ad40c4dfbb9d46c53325d63ae8bf4a94d7f"
  "nvlax_cpm.patch"
)
sha512sums=(
  "de7116c09f282a27920a1382df84aa86f559e537664bb30689605177ce37dc5067748acf9afd66a3269a6e323461356592fdfc624c86523bf105ff8fe47d3770"
  "4b3ad73f5076ba90fe0b3a2e712ac9cde76f469cd8070280f960c3ce7dc502d1927f525ae18d008075c8f08ea432f7be0a6c3a7a6b49c361126dcf42f97ec499"
  "a0ceb0a6c240cf97b21a2e46c5c212250d3ee24fecef16aca3dffb04b8350c445b9f4398274abccdb745dd0ba5132a17942c9508ce165d4f97f41ece02b0b989"
  "f612a82cb03d0e7564a30eb4ff0a2fff1d5b54ab4a0754f4a9865f786dad289fb3e69726651ebc841f594f8167105d158ccd810b5d609215245a93ff363dd0ad"
  "SKIP"
  "3188b66c6a158ac97a9200ce96d8ada5da2f39eb6eae19e710e7c0d7e3d1b9189beb92c1446fa4b0aa937d2b0c08a2fc9a3b4b3f821566a4e629478addf9d098"
)

create_links() {
  # create soname links
  find "$pkgdir" -type f -name '*.so*' ! -path '*xorg/*' -print0 | while read -d $'\0' _lib; do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*)\.so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

prepare() {
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"
  bsdtar -xf nvidia-persistenced-init.tar.bz2

  cd "$srcdir"/nvlax
  patch -Np1 < "$srcdir"/nvlax_cpm.patch
}

build() {
  cd nvlax
  cmake -B build
  make -C build

  cd build
  cp -a nvlax_fbc "$srcdir/${_pkg}"/nvlax_fbc
  cp -a nvlax_encode "$srcdir/${_pkg}"/nvlax_encode
}

package() {
  cd "${_pkg}"

  # GTK+ for nvidia-settings
  install -Dm755 libnvidia-gtk3.so.$pkgver "$pkgdir"/usr/lib/libnvidia-gtk3.so.$pkgver

  # nvidia-settings
  install -Dm755 nvidia-settings "$pkgdir"/usr/bin/nvidia-settings
  install -Dm644 nvidia-settings.1.gz "$pkgdir"/usr/share/man/man1/nvidia-settings.1.gz
  install -Dm644 nvidia-settings.png "$pkgdir"/usr/share/pixmaps/nvidia-settings.png
  install -Dm644 nvidia-settings.desktop "$pkgdir"/usr/share/applications/nvidia-settings.desktop
  sed -e 's:__UTILS_PATH__:/usr/bin:' \
  -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' \
  -i "$pkgdir"/usr/share/applications/nvidia-settings.desktop

  # X driver
  install -Dm755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

  # Wayland/GBM
  install -Dm755 libnvidia-egl-gbm.so.1* -t "${pkgdir}/usr/lib/"
  install -Dm644 15_nvidia_gbm.json "${pkgdir}/usr/share/egl/egl_external_platform.d/15_nvidia_gbm.json"
  mkdir -p "${pkgdir}/usr/lib/gbm"
  ln -sr "${pkgdir}/usr/lib/libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib/gbm/nvidia-drm_gbm.so"

  # firmware
  install -Dm644 -t "${pkgdir}/usr/lib/firmware/nvidia/${pkgver}/" firmware/*.bin

  # GLX extension module for X
  install -Dm755 "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.${pkgver}"
  # Ensure that X finds glx
  ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.1"
  ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so"

  install -Dm755 "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLX_nvidia.so.${pkgver}"

  # OpenGL libraries
  install -Dm755 "libEGL_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libEGL_nvidia.so.${pkgver}"
  install -Dm755 "libGLESv1_CM_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv1_CM_nvidia.so.${pkgver}"
  install -Dm755 "libGLESv2_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv2_nvidia.so.${pkgver}"
  install -Dm644 "10_nvidia.json" "${pkgdir}/usr/share/glvnd/egl_vendor.d/10_nvidia.json"

  # OpenGL core library
  install -Dm755 "libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glcore.so.${pkgver}"
  install -Dm755 "libnvidia-eglcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-eglcore.so.${pkgver}"
  install -Dm755 "libnvidia-glsi.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glsi.so.${pkgver}"

  # misc
  install -Dm755 "libnvidia-cfg.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-cfg.so.${pkgver}"
  install -Dm755 "libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ml.so.${pkgver}"
  install -Dm755 "libnvidia-glvkspirv.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glvkspirv.so.${pkgver}"
  install -Dm755 "libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-allocator.so.${pkgver}"
  install -Dm755 "libnvidia-vulkan-producer.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-vulkan-producer.so.${pkgver}"
  # Sigh libnvidia-vulkan-producer.so has no SONAME set so create_links doesn't catch it. NVIDIA please fix!
  ln -s "libnvidia-vulkan-producer.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-vulkan-producer.so.1"
  ln -s "libnvidia-vulkan-producer.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-vulkan-producer.so"

  # Patched NvFBC
  ./nvlax_fbc -i "libnvidia-fbc.so.${pkgver}" -o "libnvidia-fbc.so.${pkgver}"
  install -Dm755 "libnvidia-fbc.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-fbc.so.${pkgver}"

  # Patched NVENC
  ./nvlax_encode -i "libnvidia-encode.so.${pkgver}" -o "libnvidia-encode.so.${pkgver}"
  install -Dm755 "libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-encode.so.${pkgver}"

  # Vulkan ICD
  install -Dm644 "nvidia_icd.json" "${pkgdir}/usr/share/vulkan/icd.d/nvidia_icd.json"
  install -Dm644 "nvidia_layers.json" "${pkgdir}/usr/share/vulkan/implicit_layer.d/nvidia_layers.json"

  # VDPAU
  install -Dm755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}"

  # nvidia-tls library
  install -Dm755 "libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-tls.so.${pkgver}"

  # CUDA
  install -Dm755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib/libcuda.so.${pkgver}"
  install -Dm755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}"

  # NVVM Compiler library loaded by the CUDA driver to do JIT link-time-optimization
  install -Dm644 "libnvidia-nvvm.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-nvvm.so.${pkgver}"

  # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
  install -Dm755 "libnvidia-ptxjitcompiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ptxjitcompiler.so.${pkgver}"

  # raytracing
  install -Dm755 "libnvoptix.so.${pkgver}" "${pkgdir}/usr/lib/libnvoptix.so.${pkgver}"
  install -Dm755 "libnvidia-rtcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-rtcore.so.${pkgver}"

  # NGX
  install -Dm755 nvidia-ngx-updater "${pkgdir}/usr/bin/nvidia-ngx-updater"
  install -Dm755 "libnvidia-ngx.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ngx.so.${pkgver}"
  install -Dm755 _nvngx.dll "${pkgdir}/usr/lib/nvidia/wine/_nvngx.dll"
  install -Dm755 nvngx.dll "${pkgdir}/usr/lib/nvidia/wine/nvngx.dll"

  # Optical flow
  install -Dm755 "libnvidia-opticalflow.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opticalflow.so.${pkgver}"

  # DEBUG
  install -Dm755 nvidia-debugdump "${pkgdir}/usr/bin/nvidia-debugdump"

  # nvidia-xconfig
  install -Dm755 nvidia-xconfig "${pkgdir}/usr/bin/nvidia-xconfig"
  install -Dm644 nvidia-xconfig.1.gz "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1.gz"

  # nvidia-bug-report
  install -Dm755 nvidia-bug-report.sh "${pkgdir}/usr/bin/nvidia-bug-report.sh"

  # nvidia-smi
  install -Dm755 nvidia-smi "${pkgdir}/usr/bin/nvidia-smi"
  install -Dm644 nvidia-smi.1.gz "${pkgdir}/usr/share/man/man1/nvidia-smi.1.gz"

  # nvidia-cuda-mps
  install -Dm755 nvidia-cuda-mps-server "${pkgdir}/usr/bin/nvidia-cuda-mps-server"
  install -Dm755 nvidia-cuda-mps-control "${pkgdir}/usr/bin/nvidia-cuda-mps-control"
  install -Dm644 nvidia-cuda-mps-control.1.gz "${pkgdir}/usr/share/man/man1/nvidia-cuda-mps-control.1.gz"

  # nvidia-modprobe
  # This should be removed if nvidia fixed their uvm module!
  install -Dm4755 nvidia-modprobe "${pkgdir}/usr/bin/nvidia-modprobe"
  install -Dm644 nvidia-modprobe.1.gz "${pkgdir}/usr/share/man/man1/nvidia-modprobe.1.gz"

  # nvidia-persistenced
  install -Dm755 nvidia-persistenced "${pkgdir}/usr/bin/nvidia-persistenced"
  install -Dm644 nvidia-persistenced.1.gz "${pkgdir}/usr/share/man/man1/nvidia-persistenced.1.gz"
  install -Dm644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
  sed -i 's/__USER__/nvidia-persistenced/' "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"

  # application profiles
  install -Dm644 nvidia-application-profiles-${pkgver}-rc "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-rc"
  install -Dm644 nvidia-application-profiles-${pkgver}-key-documentation "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-key-documentation"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.txt "${pkgdir}/usr/share/doc/nvidia/README"
  install -Dm644 NVIDIA_Changelog "${pkgdir}/usr/share/doc/nvidia/NVIDIA_Changelog"
  cp -r html "${pkgdir}/usr/share/doc/nvidia/"
  ln -s nvidia "${pkgdir}/usr/share/doc/${_pkgname}"

  # new power management support
  install -Dm644 systemd/system/*.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm755 systemd/system-sleep/nvidia "${pkgdir}/usr/lib/systemd/system-sleep/nvidia"
  install -Dm755 systemd/nvidia-sleep.sh "${pkgdir}/usr/bin/nvidia-sleep.sh"
  install -Dm755 nvidia-powerd "${pkgdir}/usr/bin/nvidia-powerd"

  install -Dm644 nvidia-dbus.conf "${pkgdir}"/usr/share/dbus-1/system.d/nvidia-dbus.conf

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -Dm644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"

  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"

  install -Dm644 "${srcdir}/nvidia.rules" "$pkgdir"/usr/lib/udev/rules.d/60-nvidia.rules

  echo "blacklist nouveau" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
  echo "nvidia-uvm" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

  create_links
}
