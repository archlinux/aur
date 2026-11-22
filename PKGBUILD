# Maintainer: Pablo Rodriguez <aur-contact@rodlop.net>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Peter Jung <ptr1337@archlinux.org
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>

_pkgbasename=nvidia-610xx-utils
pkgbase=lib32-$_pkgbasename
pkgname=('lib32-nvidia-610xx-utils' 'lib32-opencl-nvidia-610xx')
pkgver=610.57.04
pkgrel=1
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run")
sha512sums=('4c9566625716ba7257ed2203dbbabfbc7a2dfdfc8bcb16678212ec809dc7ff470d12973ad86ce5f925b271d04239425f43088e8e591cb4ed7f77ec0c8612ffc0')

create_links() {
    # create soname links
    for _lib in $(find "${pkgdir}" -name '*.so*' | grep -v 'xorg/'); do
        _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
        _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
        [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
        [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
    done
}

build() {
    sh ${_pkg}.run --extract-only
}

package_lib32-opencl-nvidia-610xx() {
    pkgdesc="OpenCL implemention for NVIDIA (32-bit) (610xx)"
    depends=('lib32-zlib' 'lib32-gcc-libs')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('lib32-opencl-driver' 'lib32-opencl-nvidia')
    conflicts=('lib32-opencl-nvidia')

    cd "${_pkg}"/32

    # OpenCL
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/lib32-opencl-nvidia"
}

package_lib32-nvidia-610xx-utils() {
    pkgdesc="NVIDIA drivers utilities (32-bit) (610xx)"
    depends=('lib32-zlib' 'lib32-gcc-libs' 'lib32-libglvnd' "nvidia-610xx-utils=${pkgver}")
    optdepends=('lib32-opencl-nvidia-610xx')
    conflicts=('lib32-nvidia-libgl' 'lib32-nvidia-utils')
    provides=('lib32-vulkan-driver' 'lib32-opengl-driver' 'lib32-nvidia-libgl' 'lib32-nvidia-utils')
    replaces=('lib32-nvidia-libgl')

    cd "${_pkg}"/32

    # Check http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/README/installedcomponents.html
    # for hints on what needs to be installed where.

    install -D -m755 "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/libGLX_nvidia.so.${pkgver}"

    # OpenGL libraries
    install -D -m755 "libEGL_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/libEGL_nvidia.so.${pkgver}"
    install -D -m755 "libGLESv1_CM_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv1_CM_nvidia.so.${pkgver}"
    install -D -m755 "libGLESv2_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv2_nvidia.so.${pkgver}"

    # OpenGL core library
    install -D -m755 "libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-glcore.so.${pkgver}"
    install -D -m755 "libnvidia-eglcore.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-eglcore.so.${pkgver}"
    install -D -m755 "libnvidia-glsi.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-glsi.so.${pkgver}"

    # misc
    mkdir -p "${pkgdir}/usr/lib32/gbm" && ln -sr "${pkgdir}/usr/lib32/libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib32/gbm/nvidia-drm_gbm.so"
    install -D -m755 "libnvidia-fbc.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-fbc.so.${pkgver}"
    install -D -m755 "libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-encode.so.${pkgver}"
    install -D -m755 "libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-ml.so.${pkgver}"
    install -D -m755 "libnvidia-glvkspirv.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-glvkspirv.so.${pkgver}"
    install -D -m755 "libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-allocator.so.${pkgver}"
    install -D -m755 "libnvidia-gpucomp.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-gpucomp.so.${pkgver}"
    install -D -m755 "libnvidia-tileiras.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-tileiras.so.${pkgver}"

    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/vdpau/libvdpau_nvidia.so.${pkgver}"

    # nvidia-tls library
    install -D -m755 "libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-tls.so.${pkgver}"

    # CUDA
    install -D -m755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib32/libcuda.so.${pkgver}"
    install -D -m755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib32/libnvcuvid.so.${pkgver}"

    # NVVM Compiler library loaded by the CUDA driver to do JIT link-time-optimization
    install -D -m644 "libnvidia-nvvm.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-nvvm.so.${pkgver}"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-ptxjitcompiler.so.${pkgver}"

    # Optical flow
    install -D -m755 "libnvidia-opticalflow.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-opticalflow.so.${pkgver}"

    create_links

    rm -rf "${pkgdir}"/usr/{include,share,bin}
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/${pkgname}"
}
