# Maintainer: Evert Vorster <superchief@evertvorster.com>
pkgname=wine-nvidia-libs-bin
pkgver=1.0.1
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


sha256sums=('ea9be4eeb35cb6f36a7454a9c5707a777dcca4bbb13fb52a3b097d34bb30122b'
            '12a0cba1f5cf6489e5ecee7ebab5ad9f60fa2b78dc6507afeb848f43d039e751')

package() {
  cd "${srcdir}/nvidia-libs-v${pkgver}-fakedll"

  # Match the -git packages: only these four modules
  install -d "${pkgdir}/usr/lib/wine/x86_64-unix"
  install -d "${pkgdir}/usr/lib/wine/x86_64-windows"

  install -m644 lib/wine/x86_64-unix/nvcuda.dll.so        "${pkgdir}/usr/lib/wine/x86_64-unix/"
  install -m644 lib/wine/x86_64-unix/nvcuvid.dll.so       "${pkgdir}/usr/lib/wine/x86_64-unix/"
  install -m644 lib/wine/x86_64-unix/nvencodeapi64.dll.so "${pkgdir}/usr/lib/wine/x86_64-unix/"
  install -m644 lib/wine/x86_64-unix/nvoptix.dll.so       "${pkgdir}/usr/lib/wine/x86_64-unix/"

  install -m644 lib/wine/x86_64-windows/nvcuda.dll        "${pkgdir}/usr/lib/wine/x86_64-windows/"
  install -m644 lib/wine/x86_64-windows/nvcuvid.dll       "${pkgdir}/usr/lib/wine/x86_64-windows/"
  install -m644 lib/wine/x86_64-windows/nvencodeapi64.dll "${pkgdir}/usr/lib/wine/x86_64-windows/"
  install -m644 lib/wine/x86_64-windows/nvoptix.dll       "${pkgdir}/usr/lib/wine/x86_64-windows/"

  # Licenses: create dir (like -git), but don't fail if upstream didn't ship them in the tarball
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

