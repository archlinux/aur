# Maintainer: Vasiliy Stelmachenok <ventureo@cachyos.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>

pkgbase=lib32-nvidia-580xx-utils
pkgname=('lib32-nvidia-580xx-utils' 'lib32-opencl-nvidia-580xx')
pkgver=580.119.02
pkgrel=1
arch=('x86_64')
url="http://www.nvidia.com/"
#makedepends=('nvidia-libgl')  # To avoid conflict during installation in the build chroot
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=("https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run")
sha512sums=('b773deaa58823d3907488527507df6831959c1b8215ad34e1fdf7025d318d9ca7610d0b103252252c4e4097ec97d4224f99a3e9701327dc15eadc66e906af250')

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

package_lib32-opencl-nvidia-580xx() {
    pkgdesc="OpenCL implemention for NVIDIA (32-bit) (580xx)"
    depends=('lib32-zlib' 'lib32-gcc-libs')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    conflicts=('lib32-opencl-nvidia')
    provides=('lib32-opencl-driver' "lib32-opencl-nvidia=$pkgver")

    cd "${_pkg}"/32

    # OpenCL
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s lib32-nvidia-580xx-utils "${pkgdir}/usr/share/licenses/lib32-opencl-nvidia"
}

package_lib32-nvidia-580xx-utils() {
    pkgdesc="NVIDIA drivers utilities (32-bit) (580xx)"
    depends=('lib32-zlib' 'lib32-gcc-libs' 'lib32-libglvnd')
    optdepends=('lib32-opencl-nvidia')
    conflicts=('lib32-nvidia-libgl' 'lib32-nvidia-utils')
    provides=('lib32-vulkan-driver' 'lib32-opengl-driver' 'lib32-nvidia-libgl' "lib32-nvidia-utils=$pkgver")
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

    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/vdpau/libvdpau_nvidia.so.${pkgver}"

    # nvidia-tls library
    install -D -m755 "libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-tls.so.${pkgver}"

    # CUDA
    install -D -m755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib32/libcuda.so.${pkgver}"
    install -D -m755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib32/libnvcuvid.so.${pkgver}"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-ptxjitcompiler.so.${pkgver}"

    # Optical flow
    install -D -m755 "libnvidia-opticalflow.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-opticalflow.so.${pkgver}"

    create_links

    rm -rf "${pkgdir}"/usr/{include,share,bin}
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s lib32-nvidia-580xx-utils "${pkgdir}/usr/share/licenses/${pkgname}"
}
