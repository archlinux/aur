# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Maintainer: Drew Walton <drewwalton19216801@gmail.com>
# Contributor: James Rayner <iphitus@gmail.com>

_pkgbasename=nvidia-utils-352
pkgbase=lib32-$_pkgbasename
pkgname=('lib32-nvidia-utils-352' 'lib32-nvidia-libgl-352' 'lib32-opencl-nvidia-352')
pkgver=352.63
pkgrel=1
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom')
options=('!strip')

_arch='x86'
_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
md5sums=('7882ecda1763504beb10af77a21b21c5')

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

package_lib32-opencl-nvidia-352() {
    pkgdesc="OpenCL implemention for NVIDIA (32-bit)"
    depends=('lib32-libcl' 'lib32-zlib' 'lib32-gcc-libs')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('lib32-opencl-nvidia')
    conflicts=('lib32-opencl-nvidia')
    cd "${_pkg}"

    # OpenCL
    install -D -m755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-compiler.so.${pkgver}"
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-opencl.so.${pkgver}" 

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/lib32-opencl-nvidia"
}

package_lib32-nvidia-libgl-352() {
    pkgdesc="NVIDIA drivers libraries symlinks (32-bit)"
    depends=('lib32-nvidia-utils-352')
    replaces=('lib32-nvidia-utils<=313.26-1')
    conflicts=('lib32-libgl' 'lib32-nvidia-libgl')
    provides=('lib32-libgl' 'lib32-nvidia-libgl')
    cd "${_pkg}"

    mkdir -p "${pkgdir}/usr/lib32"
    ln -s "/usr/lib32/nvidia/libGL.so.${pkgver}" "${pkgdir}/usr/lib32/libGL.so.${pkgver}"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib32/libGL.so.1"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib32/libGL.so"

    ln -s "/usr/lib32/nvidia/libEGL.so.${pkgver}" "${pkgdir}/usr/lib32/libEGL.so.${pkgver}"
    ln -s "libEGL.so.${pkgver}" "${pkgdir}/usr/lib32/libEGL.so.1"
    ln -s "libEGL.so.${pkgver}" "${pkgdir}/usr/lib32/libEGL.so"

    ln -s "/usr/lib32/nvidia/libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv1_CM.so.${pkgver}"
    ln -s "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv1_CM.so.1"
    ln -s "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv1_CM.so"

    ln -s "/usr/lib32/nvidia/libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv2.so.${pkgver}"
    ln -s "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv2.so.2"
    ln -s "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv2.so"

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/lib32-nvidia-libgl"
}

package_lib32-nvidia-utils-352() {
    pkgdesc="NVIDIA drivers utilities (32-bit)"
    depends=('lib32-zlib' 'lib32-gcc-libs')
    optdepends=('lib32-opencl-nvidia-352')
    provides=('lib32-nvidia-utils=$pkgver')
    conflicts=('lib32-nvidia-utils')
    cd "${_pkg}"

    # OpenGL libraries
    install -D -m755 "libGL.so.${pkgver}" "${pkgdir}/usr/lib32/nvidia/libGL.so.${pkgver}"
    install -D -m755 "libEGL.so.${pkgver}" "${pkgdir}/usr/lib32/nvidia/libEGL.so.${pkgver}"
    install -D -m755 "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib32/nvidia/libGLESv1_CM.so.${pkgver}"
    install -D -m755 "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib32/nvidia/libGLESv2.so.${pkgver}"

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

    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/vdpau/libvdpau_nvidia.so.${pkgver}"

    # nvidia-tls library
    install -D -m755 "tls/libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-tls.so.${pkgver}"

    # CUDA
    install -D -m755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib32/libcuda.so.${pkgver}"
    install -D -m755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib32/libnvcuvid.so.${pkgver}"

    create_links

    rm -rf "${pkgdir}"/usr/{include,share,bin}
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/${pkgname}"
}
