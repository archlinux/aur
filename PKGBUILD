# $Id$
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Maintainer: Drew Walton <drewwalton19216801@gmail.com>
# Contributor: James Rayner <iphitus@gmail.com>
pkgbase=nvidia-utils-352
pkgname=('nvidia-utils-352' 'nvidia-libgl-352' 'opencl-nvidia-352')
pkgver=352.63
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
license=('custom')
conflicts=('nvidia-utils' 'nvidia-libgl' 'opencl-nvidia')
options=('!strip')
source=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
        "ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums=('7882ecda1763504beb10af77a21b21c5'
         'ce1ec67f875d434c212b859b582204c5')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

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

package_opencl-nvidia-352() {
    pkgdesc="OpenCL implemention for NVIDIA"
    depends=('libcl' 'zlib')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('opencl-nvidia')
    conflicts=('opencl-nvidia')
    cd "${_pkg}"

    # OpenCL
    install -D -m644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-compiler.so.${pkgver}"
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${pkgver}" 

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia "${pkgdir}/usr/share/licenses/opencl-nvidia"
}

package_nvidia-libgl-352() {
    pkgdesc="NVIDIA drivers libraries symlinks"
    depends=('nvidia-utils')
    conflicts=('libgl' 'nvidia-libgl' 'mesa<10.1.0-2')
    provides=('libgl' 'nvidia-libgl')
    cd "${_pkg}"

    mkdir -p "${pkgdir}/usr/lib/xorg/modules/extensions"
    ln -s "/usr/lib/nvidia/xorg/modules/extensions/libglx.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so.${pkgver}"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so.1"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

    ln -s "/usr/lib/nvidia/libGL.so.${pkgver}" "${pkgdir}/usr/lib/libGL.so.${pkgver}"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib/libGL.so.1"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib/libGL.so"

    ln -s "/usr/lib/nvidia/libEGL.so.${pkgver}" "${pkgdir}/usr/lib/libEGL.so.${pkgver}"
    ln -s "libEGL.so.${pkgver}" "${pkgdir}/usr/lib/libEGL.so.1"
    ln -s "libEGL.so.${pkgver}" "${pkgdir}/usr/lib/libEGL.so"

    ln -s "/usr/lib/nvidia/libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv1_CM.so.${pkgver}"
    ln -s "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv1_CM.so.1"
    ln -s "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv1_CM.so"

    ln -s "/usr/lib/nvidia/libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv2.so.${pkgver}"
    ln -s "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv2.so.2"
    ln -s "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv2.so"

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia "${pkgdir}/usr/share/licenses/nvidia-libgl"
}

package_nvidia-utils-352() {
    pkgdesc="NVIDIA drivers utilities"
    depends=('xorg-server')
    optdepends=('gtk2: nvidia-settings (GTK+ v2)'
              'gtk3: nvidia-settings (GTK+ v3)'
              'opencl-nvidia-352: OpenCL support'
              'xorg-server-devel: nvidia-xconfig')
    provides=('nvidia-utils=$pkgver')
    conflicts=('nvidia-utils')
    install="${pkgname}.install"
    cd "${_pkg}"

    # X driver
    install -D -m755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

    # GLX extension module for X
    install -D -m755 "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/modules/extensions/libglx.so.${pkgver}"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/modules/extensions/libglx.so"	# X doesn't find glx otherwise

    # OpenGL libraries
    install -D -m755 "libGL.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libGL.so.${pkgver}"
    install -D -m755 "libEGL.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libEGL.so.${pkgver}"
    install -D -m755 "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libGLESv1_CM.so.${pkgver}"
    install -D -m755 "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libGLESv2.so.${pkgver}"

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
