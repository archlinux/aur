# Maintainer: eirikr <151315375+Oichkatzelesfrettschen@users.noreply.github.com>
# Why: AUR python-nvidia-dali is orphaned and requires gcc13 (AUR) to build from source.
#      NVIDIA publishes pre-built DALI wheels on pypi.nvidia.com for cuda130.
#      Wheel is py3-none but contains per-cpython .so files (cp39..cp313).
#      System Python is 3.14; python313 provides the matching cp313 extension.
#      Upgraded from AUR 1.51.0 to 1.53.0 (latest CUDA 13 compatible release).

pkgname=python-nvidia-dali-cuda130
pkgver=1.53.0
pkgrel=1
pkgdesc='NVIDIA DALI - data loading and augmentation library for deep learning (CUDA 13.x; use python3.13)'
arch=(x86_64)
url='https://github.com/NVIDIA/DALI'
license=('Apache-2.0')
# DALI bundles its own libs; system depends are minimal
depends=(cuda 'nvidia-utils>=590' python313)

_whl="nvidia_dali_cuda130-${pkgver}-py3-none-manylinux_2_28_x86_64.whl"
source=("https://pypi.nvidia.com/nvidia-dali-cuda130/${_whl}")
sha256sums=('f8f0f0a6216de4d7ab933c35bbf74c20e849fb042fc816995ab5fe3f437da277')
noextract=("${_whl}")

_sitepkgs313="$(python3.13 -c 'import site; print(site.getsitepackages()[0])')"

package() {
    # Install wheel to Python 3.13 site-packages (cp313 extension present; no cp314).
    install -d "${pkgdir}${_sitepkgs313}"
    bsdtar -C "${pkgdir}${_sitepkgs313}" -xf "${srcdir}/${_whl}" \
        'nvidia/*' \
        "nvidia_dali_cuda130-${pkgver}.dist-info/*"

    # Mark .so files executable
    find "${pkgdir}${_sitepkgs313}/nvidia/dali" -name '*.so*' -exec chmod 755 {} \;

    # Symlink main DALI libs to /usr/lib for system-level use
    install -d "${pkgdir}/usr/lib"
    for _so in libdali.so libdali_core.so libdali_kernels.so libdali_operators.so; do
        ln -sr "${pkgdir}${_sitepkgs313}/nvidia/dali/${_so}" "${pkgdir}/usr/lib/${_so}" 2>/dev/null || true
    done
}
