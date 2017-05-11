# $Id$
# Maintainer: Jiahui Feng <fengjiahui@megvii.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>

pkgbase=nvidia-tesla-utils
pkgname=('nvidia-tesla-utils' 'nvidia-tesla-libgl' 'opencl-nvidia-tesla')
pkgver=375.66
pkgrel=1
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom')
options=('!strip')
source=('nvidia-drm-outputclass.conf')
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}.run")
sha512sums=('bf7e27b2f3c815f5e21ba3b17cb9f4e76360bb2c41b30face591834d82d786fee93546a469e30ebcb89f64a17a7e79e0b7ed6fd9f26438dfaa48899fce3ddf33')
sha512sums_x86_64=('518534816da3e20e9b539e19b0e93340b6141aebe76989139aa130883106a68da74f9ef3692419e0b3c111a7c50ceb20e45ecdde53af78c7c709b4d51acb5164')

[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}"

create_links() {
    # create soname links
    for _lib in $(find "${pkgdir}" -name '*.so*' | grep -v 'xorg/'); do
        _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
        _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
        [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
        [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
    done
}

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    bsdtar -xf nvidia-persistenced-init.tar.bz2
}

package_opencl-nvidia-tesla() {
    pkgdesc="OpenCL implemention for NVIDIA"
    depends=('zlib')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('opencl-nvidia', 'opencl-driver')
    cd "${_pkg}"

    # OpenCL
    install -D -m644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-compiler.so.${pkgver}"
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia "${pkgdir}/usr/share/licenses/opencl-nvidia"
}

package_nvidia-tesla-libgl() {
    pkgdesc="NVIDIA drivers libraries symlinks"
    depends=('nvidia-tesla-utils')
    conflicts=('libgl' 'libegl' 'libgles')
    provides=('libgl' 'libegl' 'libgles')
    cd "${_pkg}"

    mkdir -p "${pkgdir}/usr/lib/"

    ln -s "/usr/lib/nvidia/libGL.so.1" "${pkgdir}/usr/lib/libGL.so.1"
    ln -s "libGL.so.1" "${pkgdir}/usr/lib/libGL.so"

    ln -s "/usr/lib/nvidia/libEGL.so.1" "${pkgdir}/usr/lib/libEGL.so.1"
    ln -s "libEGL.so.1" "${pkgdir}/usr/lib/libEGL.so"

    ln -s "/usr/lib/nvidia/libGLESv1_CM.so.1" "${pkgdir}/usr/lib/libGLESv1_CM.so.1"
    ln -s "libGLESv1_CM.so.1" "${pkgdir}/usr/lib/libGLESv1_CM.so"

    ln -s "/usr/lib/nvidia/libGLESv2.so.2" "${pkgdir}/usr/lib/libGLESv2.so.2"
    ln -s "libGLESv2.so.2" "${pkgdir}/usr/lib/libGLESv2.so"

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia "${pkgdir}/usr/share/licenses/nvidia-libgl"
}

package_nvidia-tesla-utils() {
    pkgdesc="NVIDIA drivers utilities"
    depends=('xorg-server' 'libglvnd')
    optdepends=('nvidia-settings: configuration tool'
                'xorg-server-devel: nvidia-xconfig'
                'opencl-nvidia-tesla: OpenCL support')
    provides=("nvidia-utils=$pkgver" 'vulkan-driver')
    install="${pkgname}.install"
    cd "${_pkg}"

    # X driver
    install -D -m755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

    # GLX extension module for X
    install -D -m755 "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so.${pkgver}"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so.1"	# X doesn't find glx otherwise
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so"	# X doesn't find glx otherwise
    
    install -D -m755 "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLX_nvidia.so.${pkgver}"
    # now in mesa driver
    #ln -s "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLX_indirect.so.0"

    # Wayland stuff
    install -D -m755 "libnvidia-egl-wayland.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-egl-wayland.so.${pkgver}"
    ln -s "libnvidia-egl-wayland.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-egl-wayland.so.0"

    # OpenGL libraries
    install -D -m755 "libEGL_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libEGL_nvidia.so.${pkgver}"
    install -D -m755 "libGLESv1_CM_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv1_CM_nvidia.so.${pkgver}"
    install -D -m755 "libGLESv2_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv2_nvidia.so.${pkgver}"
    install -D -m644 "10_nvidia.json" "${pkgdir}/usr/share/glvnd/egl_vendor.d/10_nvidia.json"

    # OpenGL core library
    install -D -m755 "libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glcore.so.${pkgver}"
    install -D -m755 "libnvidia-eglcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-eglcore.so.${pkgver}"
    install -D -m755 "libnvidia-glsi.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glsi.so.${pkgver}"

    # misc
    install -D -m755 "libnvidia-ifr.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ifr.so.${pkgver}"
    install -D -m755 "libnvidia-fbc.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-fbc.so.${pkgver}"
    install -D -m755 "libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-encode.so.${pkgver}"
    install -D -m755 "libnvidia-cfg.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-cfg.so.${pkgver}"
    install -D -m755 "libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ml.so.${pkgver}"

    # Vulkan ICD
    install -D -m644 "nvidia_icd.json" "${pkgdir}/usr/share/vulkan/icd.d/nvidia_icd.json"

    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}"

    # nvidia-tls library
    install -D -m755 "libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-tls.so.${pkgver}"
    install -D -m755 "tls/libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/tls/libnvidia-tls.so.${pkgver}"

    # CUDA
    install -D -m755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib/libcuda.so.${pkgver}"
    install -D -m755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ptxjitcompiler.so.${pkgver}"

    # Fat (multiarchitecture) binary loader
    install -D -m755 "libnvidia-fatbinaryloader.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-fatbinaryloader.so.${pkgver}"

    # DEBUG
    install -D -m755 nvidia-debugdump "${pkgdir}/usr/bin/nvidia-debugdump"

    # nvidia-xconfig
    install -D -m755 nvidia-xconfig "${pkgdir}/usr/bin/nvidia-xconfig"
    install -D -m644 nvidia-xconfig.1.gz "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1.gz"

    # nvidia-bug-report
    install -D -m755 nvidia-bug-report.sh "${pkgdir}/usr/bin/nvidia-bug-report.sh"

    # nvidia-smi
    install -D -m755 nvidia-smi "${pkgdir}/usr/bin/nvidia-smi"
    install -D -m644 nvidia-smi.1.gz "${pkgdir}/usr/share/man/man1/nvidia-smi.1.gz"

    # nvidia-cuda-mps
    install -D -m755 nvidia-cuda-mps-server "${pkgdir}/usr/bin/nvidia-cuda-mps-server"
    install -D -m755 nvidia-cuda-mps-control "${pkgdir}/usr/bin/nvidia-cuda-mps-control"
    install -D -m644 nvidia-cuda-mps-control.1.gz "${pkgdir}/usr/share/man/man1/nvidia-cuda-mps-control.1.gz"

    # nvidia-modprobe
    # This should be removed if nvidia fixed their uvm module!
    install -D -m4755 nvidia-modprobe "${pkgdir}/usr/bin/nvidia-modprobe"
    install -D -m644 nvidia-modprobe.1.gz "${pkgdir}/usr/share/man/man1/nvidia-modprobe.1.gz"

    # nvidia-persistenced
    install -D -m755 nvidia-persistenced "${pkgdir}/usr/bin/nvidia-persistenced"
    install -D -m644 nvidia-persistenced.1.gz "${pkgdir}/usr/share/man/man1/nvidia-persistenced.1.gz"
    install -D -m644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
    sed -i 's/__USER__/nvidia-persistenced/' "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"

    # application profiles
    install -D -m644 nvidia-application-profiles-${pkgver}-rc "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-rc"
    install -D -m644 nvidia-application-profiles-${pkgver}-key-documentation "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-key-documentation"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/nvidia/LICENSE"
    ln -s nvidia "${pkgdir}/usr/share/licenses/nvidia-utils"
    install -D -m644 README.txt "${pkgdir}/usr/share/doc/nvidia/README"
    install -D -m644 NVIDIA_Changelog "${pkgdir}/usr/share/doc/nvidia/NVIDIA_Changelog"
    cp -r html "${pkgdir}/usr/share/doc/nvidia/"
    ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"

    # distro specific files must be installed in /usr/share/X11/xorg.conf.d
    install -D -m644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/nvidia-drm-outputclass.conf"

    create_links
}
