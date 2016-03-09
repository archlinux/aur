# $Id$
# Maintainer: David McFarland <corngood@gmail.com>

_suffix=vulkan-beta
pkgbase=nvidia-vulkan-beta
pkgname=nvidia-vulkan-beta
#pkgname=nvidia-vulkan-beta-dkms
pkgname+=(nvidia-vulkan-beta-utils nvidia-vulkan-beta-libgl opencl-nvidia-vulkan-beta)
if [[ $CARCH == "x86_64" ]]; then
    pkgname+=(lib32-nvidia-vulkan-beta-utils lib32-nvidia-vulkan-beta-libgl lib32-opencl-nvidia-vulkan-beta)
fi
pkgver=355.00.29
_extramodules=extramodules-4.4-ARCH
pkgrel=3
pkgdesc="NVIDIA drivers for linux (vulkan beta)"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('linux' 'linux-headers>=4.4' 'linux-headers<4.5')
license=('custom')
options=(!strip)
source_i686=("NVIDIA-Linux-x86-${pkgver}.run::https://developer.nvidia.com/linux32bit")
source_x86_64=("NVIDIA-Linux-x86_64-${pkgver}.run::https://developer.nvidia.com/linux64bit")
md5sums_i686=('1c6178b96fafd01e0e7378d79d154a1b')
md5sums_x86_64=('39016e6d14d60a3b321219aa9fefdddf')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here

    bsdtar -xf nvidia-persistenced-init.tar.bz2

    cp -a kernel kernel-dkms
    cd kernel-dkms
    sed -i "s/__VERSION_STRING/${pkgver}/" dkms.conf
    sed -i 's/__JOBS/`nproc`/' dkms.conf
    sed -i 's/__DKMS_MODULES//' dkms.conf
    sed -i '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"' dkms.conf
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package_nvidia-vulkan-beta() {
    pkgdesc="NVIDIA drivers for linux"
    depends=('linux>=4.4' 'linux<4.5' "nvidia-vulkan-beta-utils=${pkgver}" 'libgl')
    conflicts=(nvidia nvidia-dkms nvidia-vulkan-beta-dkms)
    install=nvidia.install

    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"

    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
}

package_nvidia-vulkan-beta-dkms() {
    pkgdesc="NVIDIA driver sources for linux"
    depends=('dkms' "nvidia-vulkan-beta-utils=$pkgver")
    optdepends=('linux-headers: Build the module for Arch kernel'
                'linux-lts-headers: Build the module for LTS Arch kernel')
    conflicts=(nvidia nvidia-dkms nvidia-vulkan-beta)
    install=nvidia-dkms.install

    cd ${_pkg}
    install -dm 755 "${pkgdir}"/usr/{lib/modprobe.d,src}
    cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-${pkgver}"
}

create_links() {
    # create soname links
    for _lib in $(find "${pkgdir}" -name '*.so*' | grep -v 'xorg/'); do
        _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
        _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
        [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
        [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
    done
}

package_opencl-nvidia-vulkan-beta() {
    pkgdesc="OpenCL implemention for NVIDIA"
    depends=('libcl' 'zlib')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    conflicts=(opencl-nvidia)
    provides=(opencl-nvidia)
    cd "${_pkg}"

    install -D -m644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-compiler.so.${pkgver}"
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia "${pkgdir}/usr/share/licenses/opencl-nvidia"
}

package_nvidia-vulkan-beta-libgl() {
    pkgdesc="NVIDIA drivers libraries symlinks"
    depends=('nvidia-vulkan-beta-utils')
    conflicts=('libgl')
    provides=('libgl')
    cd "${_pkg}"

    mkdir -p "${pkgdir}/usr/lib/xorg/modules/extensions"
    ln -s "/usr/lib/nvidia/xorg/modules/extensions/libglx.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so.${pkgver}"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so.1"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

    ln -s "/usr/lib/nvidia/libGL.so.${pkgver}" "${pkgdir}/usr/lib/libGL.so.${pkgver}"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib/libGL.so.1"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib/libGL.so"

    ln -s "/usr/lib/nvidia/libEGL.so.1" "${pkgdir}/usr/lib/libEGL.so.1"
    ln -s "libEGL.so.1" "${pkgdir}/usr/lib/libEGL.so.$pkgver"
    ln -s "libEGL.so.1" "${pkgdir}/usr/lib/libEGL.so"

    ln -s "/usr/lib/nvidia/libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv1_CM.so.${pkgver}"
    ln -s "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv1_CM.so.1"
    ln -s "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv1_CM.so"

    ln -s "/usr/lib/nvidia/libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv2.so.${pkgver}"
    ln -s "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv2.so.2"
    ln -s "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv2.so"

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia "${pkgdir}/usr/share/licenses/nvidia-libgl"

    install -D -m644 nvidia_icd.json "${pkgdir}/usr/share/vulkan/icd.d/nvidia_icd.json"
}

package_nvidia-vulkan-beta-utils() {
    pkgdesc="NVIDIA drivers utilities"
    depends=('xorg-server')
    optdepends=('gtk2: nvidia-settings'
                'xorg-server-devel: nvidia-xconfig'
                'opencl-nvidia-vulkan-beta: OpenCL support')
    conflicts=(nvidia-utils libglvnd)
    install="nvidia-utils.install"
    cd "${_pkg}"

    # X driver
    install -D -m755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

    # GLX extension module for X
    install -D -m755 "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/modules/extensions/libglx.so.${pkgver}"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/modules/extensions/libglx.so"	# X doesn't find glx otherwise

    # OpenGL libraries
    install -D -m755 "libGL.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libGL.so.${pkgver}"
    install -D -m755 "libEGL.so.1" "${pkgdir}/usr/lib/nvidia/libEGL.so.1"
    install -D -m755 "libEGL_nvidia.so.0" "${pkgdir}/usr/lib/libEGL_nvidia.so.0"
    install -D -m755 "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libGLESv1_CM.so.${pkgver}"
    install -D -m755 "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libGLESv2.so.${pkgver}"
    install -D -m755 "libOpenGL.so.0" "${pkgdir}/usr/lib/libOpenGL.so.0"
    install -D -m755 "libGLdispatch.so.0" "${pkgdir}/usr/lib/libGLdispatch.so.0"

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

    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}"

    # nvidia-tls library
    install -D -m755 "tls/libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-tls.so.${pkgver}"

    # CUDA
    install -D -m755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib/libcuda.so.${pkgver}"
    install -D -m755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}"

    # DEBUG
    install -D -m755 nvidia-debugdump "${pkgdir}/usr/bin/nvidia-debugdump"

    # nvidia-xconfig
    install -D -m755 nvidia-xconfig "${pkgdir}/usr/bin/nvidia-xconfig"
    install -D -m644 nvidia-xconfig.1.gz "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1.gz"

    # nvidia-settings
    install -D -m755 nvidia-settings "${pkgdir}/usr/bin/nvidia-settings"
    install -D -m644 nvidia-settings.1.gz "${pkgdir}/usr/share/man/man1/nvidia-settings.1.gz"
    install -D -m644 nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
    install -D -m644 nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
    install -D -m755 "libnvidia-gtk2.so.$pkgver" "$pkgdir/usr/lib/libnvidia-gtk2.so.$pkgver"
    install -D -m755 "libnvidia-gtk3.so.$pkgver" "$pkgdir/usr/lib/libnvidia-gtk3.so.$pkgver"
    sed -e 's:__UTILS_PATH__:/usr/bin:' -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"

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

    create_links
}

package_lib32-opencl-nvidia-vulkan-beta() {
    pkgdesc="OpenCL implemention for NVIDIA (32-bit)"
    depends=('lib32-libcl' 'lib32-zlib' 'lib32-gcc-libs')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    conflicts=('lib32-opencl-nvidia')
    provides=('lib32-opencl-nvidia')
    cd "${_pkg}/32"

    # OpenCL
    install -D -m755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-compiler.so.${pkgver}"
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/lib32-opencl-nvidia"
}

package_lib32-nvidia-vulkan-beta-libgl() {
    pkgdesc="NVIDIA drivers libraries symlinks (32-bit)"
    depends=('lib32-nvidia-vulkan-beta-utils')
    conflicts=('lib32-libgl')
    provides=('lib32-libgl')
    cd "${_pkg}/32"

    mkdir -p "${pkgdir}/usr/lib32"
    ln -s "/usr/lib32/nvidia/libGL.so.${pkgver}" "${pkgdir}/usr/lib32/libGL.so.${pkgver}"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib32/libGL.so.1"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib32/libGL.so"

    ln -s "/usr/lib32/nvidia/libEGL.so.1" "${pkgdir}/usr/lib32/libEGL.so.1"
    ln -s "libEGL.so.1" "${pkgdir}/usr/lib32/libEGL.so.${pkgver}"
    ln -s "libEGL.so.1" "${pkgdir}/usr/lib32/libEGL.so"

    ln -s "/usr/lib32/nvidia/libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv1_CM.so.${pkgver}"
    ln -s "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv1_CM.so.1"
    ln -s "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv1_CM.so"

    ln -s "/usr/lib32/nvidia/libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv2.so.${pkgver}"
    ln -s "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv2.so.2"
    ln -s "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib32/libGLESv2.so"

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/lib32-nvidia-libgl"
}

package_lib32-nvidia-vulkan-beta-utils() {
    pkgdesc="NVIDIA drivers utilities (32-bit)"
    depends=('lib32-zlib' 'lib32-gcc-libs')
    optdepends=('lib32-opencl-nvidia')
    conflicts=(lib32-nvidia-utils lib32-libglvnd)
    cd "${_pkg}/32"

    # OpenGL libraries
    install -D -m755 "libGL.so.${pkgver}" "${pkgdir}/usr/lib32/nvidia/libGL.so.${pkgver}"
    install -D -m755 "libEGL.so.1" "${pkgdir}/usr/lib32/nvidia/libEGL.so.1"
    install -D -m755 "libEGL_nvidia.so.0" "${pkgdir}/usr/lib32/libEGL_nvidia.so.0"
    install -D -m755 "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib32/nvidia/libGLESv1_CM.so.${pkgver}"
    install -D -m755 "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib32/nvidia/libGLESv2.so.${pkgver}"
    install -D -m755 "libOpenGL.so.0" "${pkgdir}/usr/lib32/libOpenGL.so.0"
    install -D -m755 "libGLdispatch.so.0" "${pkgdir}/usr/lib32/libGLdispatch.so.0"

    # OpenGL core library
    install -D -m755 "libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-glcore.so.${pkgver}"
    install -D -m755 "libnvidia-eglcore.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-eglcore.so.${pkgver}"
    install -D -m755 "libnvidia-glsi.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-glsi.so.${pkgver}"

    # misc
    install -D -m755 "libnvidia-ifr.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-ifr.so.${pkgver}"
    install -D -m755 "libnvidia-fbc.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-fbc.so.${pkgver}"
    install -D -m755 "libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-encode.so.${pkgver}"
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
