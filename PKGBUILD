# Maintainer: Evert Vorster

pkgname=wine-nvidia-libs-git
pkgver=1.0.0.r383.gdfbdbfa
pkgrel=1
pkgdesc="SveSop's NVIDIA CUDA/NVAPI/NVENC/NVML/OptiX Wine modules (git build; system-wide 64-bit only)"
arch=('x86_64')
url="https://github.com/SveSop/nvidia-libs"
license=('LGPL-2.1-only')

depends=('wine' 'nvidia-utils')
makedepends=('git' 'meson' 'ninja' 'mingw-w64-gcc')

_commit="dfbdbfa"
source=("git+https://github.com/SveSop/nvidia-libs.git#commit=${_commit}")
sha256sums=('SKIP')

_outdir="_build-out"
_rel="nvidia-libs-release"

pkgver() {
  cd "${srcdir}/nvidia-libs"
  printf "1.0.0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/nvidia-libs"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/nvidia-libs"

  rm -rf "${srcdir}/${_outdir}"
  mkdir -p "${srcdir}/${_outdir}"

  # MinGW ld does not support ELF hardening flags (-Wl,-z,...). Strip them.
  local _save_ldflags="${LDFLAGS}"
  export LDFLAGS
  LDFLAGS="$(printf '%s\n' "${LDFLAGS}" | sed -E 's/-Wl,-z,[^ ]+//g')"

  ./package-release.sh release "${srcdir}/${_outdir}" --fakedll

  export LDFLAGS="${_save_ldflags}"
}

package() {
  local _root="${srcdir}/${_outdir}/${_rel}"

  # --- Wine modules (64-bit only) ---
  install -d "${pkgdir}/usr/lib/wine/x86_64-windows"
  install -d "${pkgdir}/usr/lib/wine/x86_64-unix"

  # PE side (Windows)
  install -m644 "${_root}/lib/wine/x86_64-windows/"*.dll \
    "${pkgdir}/usr/lib/wine/x86_64-windows/"

  # Unix side (loader modules)
  if compgen -G "${_root}/lib/wine/x86_64-unix/*.dll.so" >/dev/null; then
    install -m755 "${_root}/lib/wine/x86_64-unix/"*.dll.so \
      "${pkgdir}/usr/lib/wine/x86_64-unix/"
  fi
  if [[ -f "${_root}/lib/wine/x86_64-unix/nvml.so" ]]; then
    install -m755 "${_root}/lib/wine/x86_64-unix/nvml.so" \
      "${pkgdir}/usr/lib/wine/x86_64-unix/"
  fi

  # --- Vulkan implicit layer (Reflex) ---
  install -d "${pkgdir}/usr/lib"
  install -d "${pkgdir}/usr/share/vulkan/implicit_layer.d"

  install -m755 "${_root}/layer/libdxvk_nvapi_vkreflex_layer.so" \
    "${pkgdir}/usr/lib/libdxvk_nvapi_vkreflex_layer.so"

  install -m644 "${_root}/layer/VkLayer_DXVK_NVAPI_reflex.json" \
    "${pkgdir}/usr/share/vulkan/implicit_layer.d/VkLayer_DXVK_NVAPI_reflex.json"

  # --- Tests (install only the EXEs, not the whole build output) ---
  install -d "${pkgdir}/usr/share/${pkgname}/tests"
  install -m644 "${_root}/bin/cudatest.exe" "${pkgdir}/usr/share/${pkgname}/tests/"
  install -m644 "${_root}/bin/nvapi64-tests.exe" "${pkgdir}/usr/share/${pkgname}/tests/"
  install -m644 "${_root}/bin/nvofapi64-tests.exe" "${pkgdir}/usr/share/${pkgname}/tests/"

  # --- Docs ---
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  [[ -f "${_root}/README.md" ]] && install -m644 \
    "${_root}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/"

  # --- License ---
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  [[ -f "${srcdir}/nvidia-libs/LICENSE" ]] && install -m644 \
    "${srcdir}/nvidia-libs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
