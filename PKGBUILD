# Maintainer: Karl Ludwig Brennan <karlludwigbrennan@outlook.com>
# Contributor: Jérémy "Vrakfall" Lecocq <jeremy [dot] lecocq [at] protonmail [dot] com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>

_pkgmainbranch=nvidia-utils
pkgbase=nvidia-525xx-utils
pkgname=('nvidia-525xx-utils' 'opencl-nvidia-525xx' 'nvidia-525xx-dkms')
pkgver=525.147.05
pkgrel=9
pkgdesc="NVIDIA drivers for Linux, 525 branch, dkms"
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom')
options=('!strip')
makedepends=('patchelf')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=('nvidia-drm-outputclass.conf'
        'nvidia-utils.sysusers'
        'nvidia.rules'
        "https://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run"
        '0001-kernel-6.8.patch'
        '0002-gcc-14.patch'
        '0003-kernel-6.10.patch'
        '0004-kernel-6.12.patch'
        '0005-kernel-6.13.patch'
        '0006-kernel-6.14.patch'
        '0007-gcc-15.patch'
        '0008-kernel-6.15.patch'
        '0009-kernel-6.17.patch')
sha512sums=('de7116c09f282a27920a1382df84aa86f559e537664bb30689605177ce37dc5067748acf9afd66a3269a6e323461356592fdfc624c86523bf105ff8fe47d3770'
            '4b3ad73f5076ba90fe0b3a2e712ac9cde76f469cd8070280f960c3ce7dc502d1927f525ae18d008075c8f08ea432f7be0a6c3a7a6b49c361126dcf42f97ec499'
            'a0ceb0a6c240cf97b21a2e46c5c212250d3ee24fecef16aca3dffb04b8350c445b9f4398274abccdb745dd0ba5132a17942c9508ce165d4f97f41ece02b0b989'
            '0c7b31715fce6a7bd77a2d9f9a3dca54a929a7790d748051576f62cdaeaeb6a9d0f3fbb13f0b20a51966bdb9470acdbc9ee529a9e84f38a9c834a1bd28d81773'
            'd4faf1807de57265407fd6dba9734301b8281c942324851792047708a50442a1feb76fd2ae48bc8e162210ee72e0f13ed0373ed33a7637a382703d6b96fe54de'
            'e0222bf7f0f0914d18b219ead4ee2b8bee0f074d44b7955ee85a86d37a0b2ddee25c8bc434a4e81a2ec2f56f982530aa14aa135fc99714a3ad517571c9e2091f'
            '8aa7a6ba05d6dd2a4d504cb9eeecdce0ac34be8cd648400739332ae8b8aa9444cceaaa598cb75e431efc43eaf471422cbf5e49c8dc77adbfe23529bc8feb803b'
            'ad88501e64324d9841f04823d7eea0dde28aae2f6f63fb2ddf1e2c43c20e3553888fe8381ebe7e44942d9db0730895cfaf0daa85b317f2237262eb9407edd5c0'
            '68a63db7e1b2c17d1a23e9a44d3a2e0114560f89a158f7eb4c585f6c6416c844f9cf82fcc58141134e730fae7e36995e31de5d2565371ee4cc53e41c41185418'
            'ed872d796290cc53b5a99fcf23ade3b2e58a5820ac178e4af605ac0110f101827f29629cc8e60f15e4f583c58a5063592c207edf42d1d7ba2dd27f78787f5c3a'
            'fd4da6ae7afaa192ce60d157479f3195e78a76fb011f1e51012b925343acf07540857aa419c3c7d9e5af934eb9e431c16cfcbb3148b7319bc07adbf5303abf3e'
            '5404a5cd8a004ad1337eed8a5944f305b3ef78f36975e76345a43c34895200134fff3ac769aa2958ea6b49baff86f7cf4b78dc47f2f295176b5a90e9b8c54e39'
            '91bf2d1551d9a160dad635ae8e989c3dd484b458be590126b83848bed2679f6e13bc441cddda35c779041c3f501aa9dff63eaa9f5cdd562c4b4ddc4af17ad87b')


create_links() {
    # create soname links
    find "$pkgdir" -type f -name '*.so*' ! -path '*xorg/*' -print0 | while read -d $'\0' _lib; do
        _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
        _base=$(echo ${_soname} | sed -r 's/(.*)\.so.*/\1.so/')
        [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
        [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
    done
}

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    bsdtar -xf nvidia-persistenced-init.tar.bz2

    cd kernel

    patch -p1 -i "$srcdir/0001-kernel-6.8.patch"
    patch -p1 -i "$srcdir/0002-gcc-14.patch"
    patch -p1 -i "$srcdir/0003-kernel-6.10.patch"
    patch -p1 -i "$srcdir/0004-kernel-6.12.patch"
    patch -p1 -i "$srcdir/0005-kernel-6.13.patch"
    patch -p1 -i "$srcdir/0006-kernel-6.14.patch"
    patch -p1 -i "$srcdir/0007-gcc-15.patch"
    patch -p1 -i "$srcdir/0008-kernel-6.15.patch"
    patch -p1 -i "$srcdir/0009-kernel-6.17.patch"

    sed -i "s/__VERSION_STRING/${pkgver}/" dkms.conf
    sed -i 's/__JOBS/`nproc`/' dkms.conf
    sed -i 's/__DKMS_MODULES//' dkms.conf
    sed -i '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILT_MODULE_NAME[3]="nvidia-drm"\
DEST_MODULE_LOCATION[3]="/kernel/drivers/video"\
BUILT_MODULE_NAME[4]="nvidia-peermem"\
DEST_MODULE_LOCATION[4]="/kernel/drivers/video"' dkms.conf

    # Gift for linux-rt guys
    sed -i 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' dkms.conf
}

package_opencl-nvidia-525xx() {
    pkgdesc="OpenCL implemention for NVIDIA, 525 branch"
    depends=('zlib')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    conflicts=('opencl-nvidia')
    provides=('opencl-nvidia' 'opencl-driver')
    cd "${_pkg}"

    # OpenCL
    install -Dm644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -Dm755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-compiler.so.${pkgver}"
    install -Dm755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia-utils "${pkgdir}/usr/share/licenses/opencl-nvidia"
}

package_nvidia-525xx-dkms() {
    _pkgmainbranch=nvidia-dkms
    pkgdesc="NVIDIA drivers - module sources, 525 branch"
    depends=('dkms' "nvidia-utils=${pkgver}" 'libglvnd')
    provides=("nvidia-dkms=${pkgver}" 'NVIDIA-MODULE' 'nvidia')
    conflicts=('nvidia-dkms' 'NVIDIA-MODULE' 'nvidia')

    cd ${_pkg}

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel "${pkgdir}/usr/src/nvidia-${pkgver}"

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
    ln -s "${pkgname}" "${pkgdir}/usr/share/licenses/${_pkgmainbranch}"
}

package_nvidia-525xx-utils() {
    pkgdesc="NVIDIA drivers utilities, 525 branch"
    depends=('xorg-server' 'libglvnd' 'egl-wayland')
    optdepends=('nvidia-settings: configuration tool'
                'xorg-server-devel: nvidia-xconfig'
                'opencl-nvidia: OpenCL support')
    conflicts=('nvidia-utils' 'nvidia-libgl' 'egl-gbm')
    provides=("nvidia-utils=${pkgver}" 'vulkan-driver' 'opengl-driver' 'nvidia-libgl')
    install="${pkgname}.install"

    cd "${_pkg}"

    # Check http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/README/installedcomponents.html
    # for hints on what needs to be installed where.

    # X driver
    install -Dm755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

    # Wayland/GBM
    install -Dm755 libnvidia-egl-gbm.so.1* -t "${pkgdir}/usr/lib/"
    install -Dm644 15_nvidia_gbm.json "${pkgdir}/usr/share/egl/egl_external_platform.d/15_nvidia_gbm.json"
    mkdir -p "${pkgdir}/usr/lib/gbm"
    ln -sr "${pkgdir}/usr/lib/libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib/gbm/nvidia-drm_gbm.so"

    # firmware
    install -Dm644 -t "${pkgdir}/usr/lib/firmware/nvidia/${pkgver}/" firmware/*.bin

    # GLX extension module for X
    install -Dm755 "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.${pkgver}"
    # Ensure that X finds glx
    ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.1"
    ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so"

    install -Dm755 "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLX_nvidia.so.${pkgver}"

    # OpenGL libraries
    install -Dm755 "libEGL_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libEGL_nvidia.so.${pkgver}"
    install -Dm755 "libGLESv1_CM_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv1_CM_nvidia.so.${pkgver}"
    install -Dm755 "libGLESv2_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLESv2_nvidia.so.${pkgver}"
    install -Dm644 "10_nvidia.json" "${pkgdir}/usr/share/glvnd/egl_vendor.d/10_nvidia.json"

    # OpenGL core library
    install -Dm755 "libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glcore.so.${pkgver}"
    install -Dm755 "libnvidia-eglcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-eglcore.so.${pkgver}"
    install -Dm755 "libnvidia-glsi.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glsi.so.${pkgver}"

    # misc
    install -Dm755 "libnvidia-api.so.1" "${pkgdir}/usr/lib/libnvidia-api.so.1"
    install -Dm755 "libnvidia-fbc.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-fbc.so.${pkgver}"
    install -Dm755 "libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-encode.so.${pkgver}"
    install -Dm755 "libnvidia-cfg.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-cfg.so.${pkgver}"
    install -Dm755 "libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ml.so.${pkgver}"
    install -Dm755 "libnvidia-glvkspirv.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glvkspirv.so.${pkgver}"
    install -Dm755 "libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-allocator.so.${pkgver}"
    install -Dm755 "libnvidia-vulkan-producer.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-vulkan-producer.so.${pkgver}"
    # Sigh libnvidia-vulkan-producer.so has no SONAME set so create_links doesn't catch it. NVIDIA please fix!
    patchelf --set-soname "libnvidia-vulkan-producer.so.1" "${pkgdir}/usr/lib/libnvidia-vulkan-producer.so.${pkgver}"

    # Vulkan ICD
    install -Dm644 "nvidia_icd.json" "${pkgdir}/usr/share/vulkan/icd.d/nvidia_icd.json"
    install -Dm644 "nvidia_layers.json" "${pkgdir}/usr/share/vulkan/implicit_layer.d/nvidia_layers.json"

    # VDPAU
    install -Dm755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}"

    # nvidia-tls library
    install -Dm755 "libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-tls.so.${pkgver}"

    # CUDA
    install -Dm755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib/libcuda.so.${pkgver}"
    install -Dm755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}"
    install -Dm755 "libcudadebugger.so.${pkgver}" "${pkgdir}/usr/lib/libcudadebugger.so.${pkgver}"

    # NVVM Compiler library loaded by the CUDA driver to do JIT link-time-optimization
    install -Dm644 "libnvidia-nvvm.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-nvvm.so.${pkgver}"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -Dm755 "libnvidia-ptxjitcompiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ptxjitcompiler.so.${pkgver}"

    # raytracing
    install -Dm755 "libnvoptix.so.${pkgver}" "${pkgdir}/usr/lib/libnvoptix.so.${pkgver}"
    install -Dm755 "libnvidia-rtcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-rtcore.so.${pkgver}"

    # NGX
    install -Dm755 nvidia-ngx-updater "${pkgdir}/usr/bin/nvidia-ngx-updater"
    install -Dm755 "libnvidia-ngx.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ngx.so.${pkgver}"
    install -Dm755 _nvngx.dll "${pkgdir}/usr/lib/nvidia/wine/_nvngx.dll"
    install -Dm755 nvngx.dll "${pkgdir}/usr/lib/nvidia/wine/nvngx.dll"

    # Optical flow
    install -Dm755 "libnvidia-opticalflow.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opticalflow.so.${pkgver}"

    # Debug
    install -Dm755 nvidia-debugdump "${pkgdir}/usr/bin/nvidia-debugdump"

    # nvidia-xconfig
    install -Dm755 nvidia-xconfig "${pkgdir}/usr/bin/nvidia-xconfig"
    install -Dm644 nvidia-xconfig.1.gz "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1.gz"

    # nvidia-bug-report
    install -Dm755 nvidia-bug-report.sh "${pkgdir}/usr/bin/nvidia-bug-report.sh"

    # nvidia-smi
    install -Dm755 nvidia-smi "${pkgdir}/usr/bin/nvidia-smi"
    install -Dm644 nvidia-smi.1.gz "${pkgdir}/usr/share/man/man1/nvidia-smi.1.gz"

    # nvidia-cuda-mps
    install -Dm755 nvidia-cuda-mps-server "${pkgdir}/usr/bin/nvidia-cuda-mps-server"
    install -Dm755 nvidia-cuda-mps-control "${pkgdir}/usr/bin/nvidia-cuda-mps-control"
    install -Dm644 nvidia-cuda-mps-control.1.gz "${pkgdir}/usr/share/man/man1/nvidia-cuda-mps-control.1.gz"

    # nvidia-modprobe
    # This should be removed if nvidia fixed their uvm module!
    install -Dm4755 nvidia-modprobe "${pkgdir}/usr/bin/nvidia-modprobe"
    install -Dm644 nvidia-modprobe.1.gz "${pkgdir}/usr/share/man/man1/nvidia-modprobe.1.gz"

    # nvidia-persistenced
    install -Dm755 nvidia-persistenced "${pkgdir}/usr/bin/nvidia-persistenced"
    install -Dm644 nvidia-persistenced.1.gz "${pkgdir}/usr/share/man/man1/nvidia-persistenced.1.gz"
    install -Dm644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
    sed -i 's/__USER__/nvidia-persistenced/' "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"

    # application profiles
    install -Dm644 nvidia-application-profiles-${pkgver}-rc "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-rc"
    install -Dm644 nvidia-application-profiles-${pkgver}-key-documentation "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-key-documentation"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nvidia-utils/LICENSE"
    install -Dm644 README.txt "${pkgdir}/usr/share/doc/nvidia/README"
    install -Dm644 NVIDIA_Changelog "${pkgdir}/usr/share/doc/nvidia/NVIDIA_Changelog"
    cp -r html "${pkgdir}/usr/share/doc/nvidia/"
    ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"

    # new power management support
    install -Dm644 systemd/system/*.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm755 systemd/system-sleep/nvidia "${pkgdir}/usr/lib/systemd/system-sleep/nvidia"
    install -Dm755 systemd/nvidia-sleep.sh "${pkgdir}/usr/bin/nvidia-sleep.sh"
    install -Dm755 nvidia-powerd "${pkgdir}/usr/bin/nvidia-powerd"
    install -Dm644 nvidia-dbus.conf "${pkgdir}"/usr/share/dbus-1/system.d/nvidia-dbus.conf

    # distro specific files must be installed in /usr/share/X11/xorg.conf.d
    install -Dm644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"

    install -Dm644 "${srcdir}/nvidia-utils.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"

    install -Dm644 "${srcdir}/nvidia.rules" "$pkgdir"/usr/lib/udev/rules.d/60-nvidia.rules

    # Blacklist nouveau and nova
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf" <<END
blacklist nouveau
blacklist nova_core
blacklist nova_drm
END
    echo "nvidia-uvm" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

    create_links
}
