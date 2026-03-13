pkgname=lib32-nvidia-575xx-utils
pkgver=575.64.05
pkgrel=1
pkgdesc="NVIDIA drivers utilities (32-bit) (575xx)"
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom')
depends=(
  'lib32-zlib'
  'lib32-gcc-libs'
  'lib32-libglvnd'
  "nvidia-575xx-utils=${pkgver}"
)
optdepends=('steam: 32-bit Vulkan/OpenGL consumers')
provides=(
  "lib32-nvidia-utils=${pkgver}"
  'lib32-vulkan-driver'
  'lib32-opengl-driver'
  'lib32-nvidia-libgl'
)
conflicts=('lib32-nvidia-utils' 'lib32-nvidia-libgl')
replaces=('lib32-nvidia-libgl')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=("${_pkg}.run::https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run")
noextract=("${_pkg}.run")
sha256sums=('85f2b50f912261c1917a0b2cf7e1f9743affd008fdc0f209f4d5563f774d502d')

create_links_lib32() {
  find "${pkgdir}/usr/lib32" -type f -name '*.so*' -print0 | while IFS= read -r -d '' lib; do
    local soname
    local base
    soname=$(dirname "${lib}")/$(readelf -d "${lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    base=$(echo "${soname}" | sed -r 's/(.*)\.so.*/\1.so/')
    [[ -z "${soname}" ]] && continue
    [[ -e "${soname}" ]] || ln -s "$(basename "${lib}")" "${soname}"
    [[ -e "${base}" ]] || ln -s "$(basename "${soname}")" "${base}"
  done
}

prepare() {
  rm -rf "${srcdir:?}/${_pkg}"
  sh "${srcdir}/${_pkg}.run" --extract-only
}

package() {
  cd "${srcdir}/${_pkg}/32"

  local libs=(
    "libEGL_nvidia.so.${pkgver}"
    "libGLESv1_CM_nvidia.so.${pkgver}"
    "libGLESv2_nvidia.so.${pkgver}"
    "libGLX_nvidia.so.${pkgver}"
    "libcuda.so.${pkgver}"
    "libnvcuvid.so.${pkgver}"
    "libnvidia-allocator.so.${pkgver}"
    "libnvidia-eglcore.so.${pkgver}"
    "libnvidia-encode.so.${pkgver}"
    "libnvidia-fbc.so.${pkgver}"
    "libnvidia-glcore.so.${pkgver}"
    "libnvidia-glsi.so.${pkgver}"
    "libnvidia-glvkspirv.so.${pkgver}"
    "libnvidia-gpucomp.so.${pkgver}"
    "libnvidia-ml.so.${pkgver}"
    "libnvidia-opticalflow.so.${pkgver}"
    "libnvidia-ptxjitcompiler.so.${pkgver}"
    "libnvidia-tls.so.${pkgver}"
  )

  for lib in "${libs[@]}"; do
    install -Dm755 "${lib}" "${pkgdir}/usr/lib32/${lib}"
  done

  install -Dm755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/vdpau/libvdpau_nvidia.so.${pkgver}"

  install -d "${pkgdir}/usr/lib32/gbm"
  ln -s "../libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib32/gbm/libnvidia-allocator.so.1"
  ln -s "libnvidia-allocator.so.1" "${pkgdir}/usr/lib32/gbm/libnvidia-allocator.so"
  ln -s "libnvidia-allocator.so.1" "${pkgdir}/usr/lib32/gbm/nvidia-drm_gbm.so"

  install -d "${pkgdir}/usr/share/licenses"
  install -Dm644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  create_links_lib32
}
