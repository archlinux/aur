# Maintainer: Evert Vorster <superchief@evertvorster.com>
pkgname=wine-nvidia-libs-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="SveSop's NVIDIA CUDA/NVENC/OptiX Wine modules (binary release, fakedll layout)"
arch=('x86_64')
url="https://github.com/SveSop/nvidia-libs"
license=('LGPL-2.1-or-later')
depends=('wine' 'nvidia-utils')

# Replace your split -git packages cleanly
provides=('wine-nvcuda' 'wine-nvenc' 'wine-nvoptix' 'wine-nvidia-libs')
conflicts=('wine-nvcuda-git' 'wine-nvenc-git' 'wine-nvoptix-git' 'wine-nvidia-libs-git')

_asset="nvidia-libs-v${pkgver}-fakedll.tar.xz"
source=("${_asset}::https://github.com/SveSop/nvidia-libs/releases/download/v${pkgver}/${_asset}"
  "LICENSE::https://raw.githubusercontent.com/SveSop/nvidia-libs/v${pkgver}/LICENSE"
)


sha256sums=('80ecba06fef2828710837010342941dbadcf53e91cf6a60f9ffdcaaa8bb981e7'
            '12a0cba1f5cf6489e5ecee7ebab5ad9f60fa2b78dc6507afeb848f43d039e751')

package() {
  cd "${srcdir}/nvidia-libs-v${pkgver}-fakedll"

  # 1) Wine modules (install all architectures provided by the tarball)
  # Matches your existing prefix: /usr/lib/wine/...
  install -d "${pkgdir}/usr/lib/wine"
  cp -a --no-preserve=ownership lib/wine/. "${pkgdir}/usr/lib/wine/"

  # 2) Vulkan layer (dxvk-nvapi vkreflex layer)
  # Standard location: /usr/share/vulkan/{implicit_layer.d,explicit_layer.d}
  # This layer is typically loaded as an implicit layer.
  install -d "${pkgdir}/usr/lib"
  install -m755 layer/libdxvk_nvapi_vkreflex_layer.so "${pkgdir}/usr/lib/"

  install -d "${pkgdir}/usr/share/vulkan/implicit_layer.d"
  install -m644 layer/VkLayer_DXVK_NVAPI_reflex.json \
    "${pkgdir}/usr/share/vulkan/implicit_layer.d/VkLayer_DXVK_NVAPI_reflex.json"
# Fix layer manifest to point at the installed .so
  sed -i 's|"library_path": "\./libdxvk_nvapi_vkreflex_layer\.so"|"library_path": "/usr/lib/libdxvk_nvapi_vkreflex_layer.so"|' \
    "${pkgdir}/usr/share/vulkan/implicit_layer.d/VkLayer_DXVK_NVAPI_reflex.json"


  # NOTE: If the JSON contains an absolute/relative library_path that doesn't match
  # /usr/lib/libdxvk_nvapi_vkreflex_layer.so, we'll patch it after you inspect it.

  # 3) Test binaries (optional but "everything" means include them)
  install -d "${pkgdir}/usr/share/${pkgname}/bin"
  install -m755 bin/*.exe "${pkgdir}/usr/share/${pkgname}/bin/"

  # 4) Docs
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  [[ -f README.md ]] && install -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/"

  # 5) License
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

