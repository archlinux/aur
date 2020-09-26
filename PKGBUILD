# Maintainer: Jaroslav Safka <devel@safka.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>
# Note: package was derived from nvidia-410xx-utils and nvidia-utils-beta
# and made to just work

pkgbase=nvidia-440xx-utils
pkgname=('nvidia-440xx-utils' 'opencl-nvidia-440xx')
pkgver=440.100
pkgrel=1
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=("https://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run"
        'nvidia-drm-outputclass.conf'
        'nvidia-440xx-utils.sysusers')
sha512sums=('274b3a8e4c801b67a3f71f11da93134bc1a16a48bc85a6bf63265c00bb3fd8caf935dd23c85c40285a162e83c146bd5e34bb0b1d74fc34e7122bfc4c3a8c81e7'
            'c49d246a519731bfab9d22afa5c2dd2d366db06d80182738b84881e93cd697c783f16ee04819275c05597bb063451a5d6102fbc562cd078d2a374533a23cea48'
            '4b3ad73f5076ba90fe0b3a2e712ac9cde76f469cd8070280f960c3ce7dc502d1927f525ae18d008075c8f08ea432f7be0a6c3a7a6b49c361126dcf42f97ec499')

# create soname links
_create_links() {
    local _lib
    local _soname
    local _base
    find "$pkgdir" -type f -name '*.so*' ! -path '*xorg/*' -print0 | while read -d $'\0' _lib
    do
        _soname="$(dirname "$_lib")/$(readelf -d "$_lib" | grep -Po 'SONAME.*: \[\K[^]]*' || true)"
        _base="$(printf '%s' "$_soname" | sed -r 's/(.*).so.*/\1.so/')"
        [ -e "$_soname" ] || ln -s "$(basename "$_lib")"    "$_soname"
        [ -e "$_base"   ] || ln -s "$(basename "$_soname")" "$_base"
    done
}

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    bsdtar -xf nvidia-persistenced-init.tar.bz2
}

package_opencl-nvidia-440xx() {
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

    _create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia "${pkgdir}/usr/share/licenses/opencl-nvidia"
}

package_nvidia-440xx-utils() {
    pkgdesc="NVIDIA drivers utilities"
    depends=('xorg-server' 'libglvnd' 'egl-wayland')
    optdepends=('nvidia-440xx-settings: configuration tool'
                'xorg-server-devel: nvidia-xconfig'
                'opencl-nvidia-440xx: OpenCL support')
    conflicts=('nvidia-440xx-libgl' 'nvidia-utils' 'nvidia-libgl')
    provides=('vulkan-driver' 'opengl-driver' 'nvidia-utils' 'nvidia-440xx-libgl' 'nvidia-libgl')
    replaces=('nvidia-440xx-libgl')
    install="${pkgname}.install"

    cd "${_pkg}"

    # X driver
    install -D -m755 nvidia_drv.so -t "${pkgdir}/usr/lib/xorg/modules/drivers"

    # GLX extension module for X
    install -D -m755 "libglxserver_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib/nvidia/xorg"
    # Ensure that X finds glx
    ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.1"
    ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so"

    install -D -m755 "libGLX_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib"

    # OpenGL libraries
    install -D -m755 "libEGL_nvidia.so.${pkgver}"       -t "${pkgdir}/usr/lib"
    install -D -m755 "libGLESv1_CM_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libGLESv2_nvidia.so.${pkgver}"    -t "${pkgdir}/usr/lib"
    install -D -m644 10_nvidia.json                     -t "${pkgdir}/usr/share/glvnd/egl_vendor.d"

    # OpenGL core library
    install -D -m755 "libnvidia-glcore.so.${pkgver}"  -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-eglcore.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-glsi.so.${pkgver}"    -t "${pkgdir}/usr/lib"

    # misc
    install -D -m755 "libnvidia-ifr.so.${pkgver}"       -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-fbc.so.${pkgver}"       -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-encode.so.${pkgver}"    -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-cfg.so.${pkgver}"       -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-ml.so.${pkgver}"        -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-glvkspirv.so.${pkgver}" -t "${pkgdir}/usr/lib"

    # Vulkan ICD
    install -D -m644 nvidia_icd.json    -t "${pkgdir}/usr/share/vulkan/icd.d"
    install -D -m644 nvidia_layers.json -t "${pkgdir}/usr/share/vulkan/implicit_layer.d"

    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib/vdpau"

    # nvidia-tls library
    install -D -m755 "libnvidia-tls.so.${pkgver}" -t "${pkgdir}/usr/lib"

    # CUDA
    install -D -m755 "libcuda.so.${pkgver}"    -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvcuvid.so.${pkgver}" -t "${pkgdir}/usr/lib"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.${pkgver}" -t "${pkgdir}/usr/lib"

    # raytracing
    install -D -m755 "libnvoptix.so.${pkgver}"       -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-rtcore.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-cbl.so.${pkgver}"    -t "${pkgdir}/usr/lib"

    # Optical flow
    install -D -m755 "libnvidia-opticalflow.so.${pkgver}" -t "${pkgdir}/usr/lib"

    # DEBUG
    install -D -m755 nvidia-debugdump -t "${pkgdir}/usr/bin"

    # nvidia-xconfig
    install -D -m644 nvidia-xconfig.1.gz -t "${pkgdir}/usr/share/man/man1"

    # nvidia-bug-report
    install -D -m755 nvidia-bug-report.sh -t "${pkgdir}/usr/bin"

    # nvidia-smi
    install -D -m755 nvidia-smi   -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-smi.1.gz -t "${pkgdir}/usr/share/man/man1"

    # nvidia-cuda-mps
    install -D -m755 nvidia-cuda-mps-server    -t "${pkgdir}/usr/bin"
    install -D -m755 nvidia-cuda-mps-control   -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-cuda-mps-control.1.gz -t "${pkgdir}/usr/share/man/man1"

    # nvidia-modprobe
    # This should be removed if nvidia fixed their uvm module!
    install -D -m4755 nvidia-modprobe  -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-modprobe.1.gz -t "${pkgdir}/usr/share/man/man1"

    # nvidia-persistenced
    install -D -m755 nvidia-persistenced   -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-persistenced.1.gz -t "${pkgdir}/usr/share/man/man1"
    install -D -m644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
    sed -i 's/__USER__/nvidia-persistenced/' "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"

    # application profiles
    install -D -m644 "nvidia-application-profiles-${pkgver}-rc"                -t "${pkgdir}/usr/share/nvidia"
    install -D -m644 "nvidia-application-profiles-${pkgver}-key-documentation" -t "${pkgdir}/usr/share/nvidia"

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -D -m644 NVIDIA_Changelog -t "${pkgdir}/usr/share/doc/${pkgname}"
#    install -D -m644 supported-gpus.json -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname}/"
    #ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"

    # new power management support
    install -D -m644 nvidia-suspend.service   -t "${pkgdir}/usr/lib/systemd/system"
    install -D -m644 nvidia-hibernate.service -t "${pkgdir}/usr/lib/systemd/system"
    install -D -m644 nvidia-resume.service    -t "${pkgdir}/usr/lib/systemd/system"
    install -D -m755 nvidia                   -t "${pkgdir}/usr/lib/systemd/system-sleep"
    install -D -m755 nvidia-sleep.sh          -t "${pkgdir}/usr/bin"

    # distro specific files must be installed in /usr/share/X11/xorg.conf.d
    install -D -m644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"

    install -D -m644 "${srcdir}/nvidia-440xx-utils.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

    _create_links
}
