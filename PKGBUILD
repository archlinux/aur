# Maintainer: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Alonso Rodriguez <alonsorodi20 (at) gmail (dot) com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>

_pkgbasename=nvidia-390xx-utils
pkgbase=lib32-$_pkgbasename
pkgname=('lib32-nvidia-390xx-utils' 'lib32-opencl-nvidia-390xx')
pkgver=390.143
pkgrel=1
arch=('x86_64')
url="http://www.nvidia.com/"
#makedepends=('nvidia-libgl')  # To avoid conflict during installation in the build chroot
license=('custom')
options=('!strip')

_arch='x86'
_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
source=("https://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
sha512sums=('17bbcc2f5e9dde3f131b7924ea1e99a591b5e18b835dd324c528d17f74eded94e087c6a9a2b364189851e9972ad27bcd47e901c9ec14eedc568b99890f1e0a4f')

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

package_lib32-opencl-nvidia-390xx() {
    pkgdesc="OpenCL implemention for NVIDIA (32-bit), 390xx legacy branch"
    depends=('lib32-zlib' 'lib32-gcc-libs')
    conflicts=('lib32-opencl-nvidia')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('lib32-opencl-driver')

    cd "${_pkg}"

    # OpenCL
    install -D -m755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-compiler.so.${pkgver}"
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/lib32-opencl-nvidia"
}

package_lib32-nvidia-390xx-utils() {
    pkgdesc="NVIDIA drivers utilities (32-bit), 390xx legacy branch"
    depends=('lib32-zlib' 'lib32-gcc-libs' 'lib32-libglvnd' 'nvidia-390xx-utils')
    conflicts=('lib32-nvidia-utils')
    optdepends=('lib32-opencl-nvidia-390xx: OpenCL support')
    provides=('lib32-vulkan-driver' 'lib32-opengl-driver' 'lib32-nvidia-390xx-libgl' 'lib32-nvidia-utils')

    cd "${_pkg}"

    # GLX extension module for X - useless ?
    install -D -m755 "libglx.so.${pkgver}" "${pkgdir}/usr/lib32/nvidia/xorg/modules/extensions/libglx.so.${pkgver}"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib32/nvidia/xorg/modules/extensions/libglx.so"	# X doesn't find glx otherwise
    install -D -m755 "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/libGLX_nvidia.so.${pkgver}"
    # now in lib32-mesa driver
    #ln -s "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/libGLX_indirect.so.0"

    # Wayland stuff
    install -D -m755 "libnvidia-egl-wayland.so.1.0.2" "${pkgdir}/usr/lib32/libnvidia-egl-wayland.so.1.0.2"
    ln -s "libnvidia-egl-wayland.so.1.0.2" "${pkgdir}/usr/lib32/libnvidia-egl-wayland.so.1"

    # OpenGL libraries
    install -D -m755 "libEGL_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/libEGL_nvidia.so.${pkgver}"
    install -D -m755 "libGLESv1_CM_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv1_CM_nvidia.so.${pkgver}"
    install -D -m755 "libGLESv2_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv2_nvidia.so.${pkgver}"

    # OpenGL core library
    install -D -m755 "libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-glcore.so.${pkgver}"
    install -D -m755 "libnvidia-eglcore.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-eglcore.so.${pkgver}"
    install -D -m755 "libnvidia-glsi.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-glsi.so.${pkgver}"

    # misc
    install -D -m755 "libnvidia-ifr.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-ifr.so.${pkgver}"
    install -D -m755 "libnvidia-fbc.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-fbc.so.${pkgver}"
    install -D -m755 "libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-encode.so.${pkgver}"
    install -D -m755 "libnvidia-cfg.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-cfg.so.${pkgver}"
    install -D -m755 "libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-ml.so.${pkgver}"
    install -D -m755 "libnvidia-wfb.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-wfb.so.${pkgver}"

    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/vdpau/libvdpau_nvidia.so.${pkgver}"

    # nvidia-tls library
    install -D -m755 "libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-tls.so.${pkgver}"
    install -D -m755 "tls/libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib32/tls/libnvidia-tls.so.${pkgver}"

    # CUDA
    install -D -m755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib32/libcuda.so.${pkgver}"
    install -D -m755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib32/libnvcuvid.so.${pkgver}"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-ptxjitcompiler.so.${pkgver}"

    # Fat (multiarchitecture) binary loader
    install -D -m755 "libnvidia-fatbinaryloader.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-fatbinaryloader.so.${pkgver}"

    create_links

    rm -rf "${pkgdir}"/usr/{include,share,bin}
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/${pkgname}"
}
