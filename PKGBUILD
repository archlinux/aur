# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>

pkgbase=nvidia-340xx-utils
pkgname=('nvidia-340xx-utils' 'opencl-nvidia-340xx')
pkgver=340.108
pkgrel=1
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom')
options=('!strip')
source=(nvidia-drm-outputclass.conf
        "http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
        nvidia-340xx-utils.sysusers)
sha512sums=('c49d246a519731bfab9d22afa5c2dd2d366db06d80182738b84881e93cd697c783f16ee04819275c05597bb063451a5d6102fbc562cd078d2a374533a23cea48'
            '9f636aab5ffee36c951bd450bd56db397e6eb127ac6ef2b93eade3850892966195602c2d894548c7b19da38f40a144f4d98f835d8c695038ff6c65249129e739'
            '4b3ad73f5076ba90fe0b3a2e712ac9cde76f469cd8070280f960c3ce7dc502d1927f525ae18d008075c8f08ea432f7be0a6c3a7a6b49c361126dcf42f97ec499')

[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

create_links() {
    # create soname links
    find "$pkgdir" -type f -name '*.so*' ! -path '*xorg/*' -print0 | while read -d $'\0' _lib; do
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

package_opencl-nvidia-340xx() {
    pkgdesc="OpenCL implemention for NVIDIA"
    depends=('zlib')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    conflicts=('opencl-nvidia')
    provides=('opencl-nvidia' 'opencl-driver')
    cd "${_pkg}"

    # OpenCL
    install -D -m644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-compiler.so.${pkgver}"
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia "${pkgdir}/usr/share/licenses/opencl-nvidia"
}

package_nvidia-340xx-utils() {
    pkgdesc="NVIDIA drivers utilities"
    depends=('xorg-server')
    optdepends=('gtk2: nvidia-settings'
                'xorg-server-devel: nvidia-xconfig'
                'opencl-nvidia-340xx: OpenCL support')
    conflicts=('nvidia-utils' 'nvidia-340xx-libgl' 'nvidia-libgl')
    provides=('libgl' 'libgles' 'libegl' 'nvidia-utils' 'nvidia-340xx-libgl' 'nvidia-libgl')
    replaces=('nvidia-340xx-libgl')
    install="${pkgname}.install"

    cd "${_pkg}"

    # X driver
    install -D -m755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

    # GLX extension module for X
    install -D -m755 "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so.${pkgver}"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so.1"	# X doesn't find glx otherwise
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglx.so"	# X doesn't find glx otherwise

    # OpenGL libraries
    install -D -m755 "libGL.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libGL.so.${pkgver}"
    install -D -m755 "libEGL.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libEGL.so.${pkgver}"
    install -D -m755 "libGLESv1_CM.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libGLESv1_CM.so.${pkgver}"
    install -D -m755 "libGLESv2.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libGLESv2.so.${pkgver}"

    # OpenGL core library
    install -D -m755 "libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libnvidia-glcore.so.${pkgver}"
    install -D -m755 "libnvidia-eglcore.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libnvidia-eglcore.so.${pkgver}"
    install -D -m755 "libnvidia-glsi.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libnvidia-glsi.so.${pkgver}"

    # misc
    install -D -m755 "libnvidia-ifr.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libnvidia-ifr.so.${pkgver}"
    install -D -m755 "libnvidia-fbc.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libnvidia-fbc.so.${pkgver}"
    install -D -m755 "libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libnvidia-encode.so.${pkgver}"
    install -D -m755 "libnvidia-cfg.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libnvidia-cfg.so.${pkgver}"
    install -D -m755 "libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libnvidia-ml.so.${pkgver}"

    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}"

    # nvidia-tls library
    install -D -m755 "tls/libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libnvidia-tls.so.${pkgver}"

    # CUDA
    install -D -m755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libcuda.so.${pkgver}"
    install -D -m755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libnvcuvid.so.${pkgver}"

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

    # distro specific files must be installed in /usr/share/X11/xorg.conf.d
    install -m755 -d "${pkgdir}/usr/share/X11/xorg.conf.d"
    install -m644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"

    install -dm 755 "${pkgdir}"/etc/ld.so.conf.d
    echo -e '/usr/lib/nvidia/' > "${pkgdir}"/etc/ld.so.conf.d/00-nvidia.conf

    install -Dm644 "${srcdir}/nvidia-340xx-utils.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"

    create_links
}
