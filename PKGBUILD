# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
# Contributor: jcstryker <public at jasonstryker dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Peter Jung <ptr1337@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-vulkan
pkgname=(
    'nvidia-vulkan'
    'nvidia-vulkan-open'
    'nvidia-vulkan-dkms'
    'nvidia-vulkan-open-dkms'
    'nvidia-vulkan-utils'
    'opencl-nvidia-vulkan'
    'lib32-nvidia-vulkan-utils'
    'lib32-opencl-nvidia-vulkan'
)
pkgver=580.94.02
pkgrel=1
pkgdesc="NVIDIA drivers for linux (vulkan developer branch)"
arch=('x86_64')
url="https://developer.nvidia.com/vulkan-driver"
makedepends=('libglvnd' 'linux' 'linux-headers')
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
_pkg_open="open-gpu-kernel-modules-${pkgver}"
source=(
    'nvidia-drm-outputclass.conf'
    'nvidia-vulkan-utils.sysusers'
    'nvidia.rules'
    'systemd-homed-override.conf'
    'systemd-suspend-override.conf'
    'nvidia-sleep.conf'
    "${_pkg}.run::https://developer.nvidia.com/downloads/vulkan-beta-${pkgver//./}-linux"
    "$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/open-gpu-kernel-modules/archive/refs/tags/${pkgver}.tar.gz"
    0001-Enable-atomic-kernel-modesetting-by-default.patch
    0003-Add-IBT-support.patch
)

sha512sums=(
    'de7116c09f282a27920a1382df84aa86f559e537664bb30689605177ce37dc5067748acf9afd66a3269a6e323461356592fdfc624c86523bf105ff8fe47d3770'
    '1bcf2c6ee71686c0d32625e746ec8c0f7cf42fc63c76c3076ff2526b2661e8b9e9f76eaa2c4b213c7cc437a6f06006cc07672c4974d7f4515b2de2fd7c47a891'
    'f8f071f5a46c1a5ce5188e104b017808d752e61c0c20de1466feb5d693c0b55a5586314411e78cc2ab9c0e16e2c67afdd358da94c0c75df1f8233f54c280762c'
    'a0183adce78e40853edf7e6b73867e7a8ea5dabac8e8164e42781f64d5232fbe869f850ab0697c3718ebced5cde760d0e807c05da50a982071dfe1157c31d6b8'
    '55def6319f6abb1a4ccd28a89cd60f1933d155c10ba775b8dfa60a2dc5696b4b472c14b252dc0891f956e70264be87c3d5d4271e929a4fc4b1a68a6902814cee'
    'c7fea39d11565f05a507d3aded4e9ea506ef9dbebf313e0fc8d6ebc526af3f9d6dec78af9d6c4456c056310f98911c638706bccdd9926d07f492615569430455'
    '5787a23700481fd7ae6c042d05c3dbb069e421da1694318980dd949b5f31a3022562fcfbd2733a2da996cad9d00a24e2716c103c97c8d086b739709511a567a9'
    'c5b428b9abbf80fb16f03130f5885f8ab2a2fc3502a4b46d1e9362f859fe9b16dafe256d41e2b40683303a22f68191d6071bbac4b4c3822e86dee62e07d717b0'
    '0bb89b9037f0baa9aae1ff8e70c9c93896f03fd0cc380eea4b0dc094a6991c3ad6738c9fbbaa42d8b5a544f77dc91c0e6401b1501c5970c576d5efbc0de8dd34'
    '42f621179d4fd9bf608f0d84b9019f5a5fdf5d92d68d22ce9b9a9add1cad1c90dcb3764db68e0b9bc7e902bb6b955c59563ea6d4f39f2e39a340387e4d5deb82'
)

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

    # Enable modeset by default
    # This avoids various issue, when Simplefb is used
    # https://gitlab.archlinux.org/archlinux/packaging/packages/nvidia-utils/-/issues/14
    # https://github.com/rpmfusion/nvidia-kmod/blob/master/make_modeset_default.patch
    patch -Np1 -d "${srcdir}/${_pkg}/kernel" -i "$srcdir"/0001-Enable-atomic-kernel-modesetting-by-default.patch

    cd kernel

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

    cd "$srcdir"/open-gpu-kernel-modules-${pkgver}

    # Enable modeset and fbdev as default
    # This avoids various issue, when Simplefb is used
    # https://gitlab.archlinux.org/archlinux/packaging/packages/nvidia-utils/-/issues/14
    # https://github.com/rpmfusion/nvidia-kmod/blob/master/make_modeset_default.patch
    patch -Np1 -i "$srcdir"/0001-Enable-atomic-kernel-modesetting-by-default.patch -d "${srcdir}/open-gpu-kernel-modules-${pkgver}/kernel-open"

    # Fix for https://bugs.archlinux.org/task/74886
    patch -Np1 --no-backup-if-mismatch -i "$srcdir"/0003-Add-IBT-support.patch

    # Attempt to make this reproducible
    sed -i "s/^HOSTNAME.*/HOSTNAME = echo archlinux"/ utils.mk
    sed -i "s/^WHOAMI.*/WHOAMI = echo archlinux-builder"/ utils.mk
    sed -i "s/^DATE.*/DATE = date -r version.mk"/ utils.mk

    sed -i "s/__VERSION_STRING/${pkgver}/" kernel-open/dkms.conf
    sed -i 's/__JOBS/`nproc`/' kernel-open/dkms.conf
    sed -i 's/__EXCLUDE_MODULES//' kernel-open/dkms.conf
    sed -i 's/__DKMS_MODULES//' kernel-open/dkms.conf
    sed -i '$i\
BUILT_MODULE_NAME[0]="nvidia"\
BUILT_MODULE_LOCATION[0]="kernel-open"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
BUILT_MODULE_LOCATION[1]="kernel-open"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
BUILT_MODULE_LOCATION[2]="kernel-open"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILT_MODULE_NAME[3]="nvidia-drm"\
BUILT_MODULE_LOCATION[3]="kernel-open"\
DEST_MODULE_LOCATION[3]="/kernel/drivers/video"\
BUILT_MODULE_NAME[4]="nvidia-peermem"\
BUILT_MODULE_LOCATION[4]="kernel-open"\
DEST_MODULE_LOCATION[4]="/kernel/drivers/video"' kernel-open/dkms.conf

    # Gift for linux-rt guys
    sed -i 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' kernel-open/dkms.conf

    # Clean version for later copying for DKMS
    cp -r ../open-gpu-kernel-modules-${pkgver} "$srcdir"/open-gpu-kernel-modules-dkms
}

build() {
    local MODULE_FLAGS=(
        KERNEL_UNAME="$(</usr/src/linux/version)"
        IGNORE_CC_MISMATCH=yes
        SYSSRC="/usr/src/linux"
    )

    cd "${_pkg}"/kernel
    make "${MODULE_FLAGS[@]}" -j"$(nproc)" modules

    cd "${srcdir}/open-gpu-kernel-modules-${pkgver}"
    CFLAGS="" CXXFLAGS="" LDFLAGS="" make "${MODULE_FLAGS[@]}" -j"$(nproc)" modules

}

package_nvidia-vulkan() {
    pkgdesc="NVIDIA drivers for linux (vulkan developer branch)"
    depends=('linux' "nvidia-vulkan-utils=${pkgver}" 'libglvnd')
    provides=("NVIDIA-MODULE" "nvidia=$pkgver")
    conflicts+=('nvidia')

    _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
    install -Dt "${pkgdir}${_extradir}" -m644 "${srcdir}/${_pkg}/kernel"/*.ko

    # Compress each module individually
    find "$pkgdir" -name '*.ko' -exec zstd --rm -19 {} +

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

package_nvidia-vulkan-open() {
    pkgdesc="NVIDIA drivers for linux (vulkan developer branch)"
    depends=('linux' "nvidia-vulkan-utils=${pkgver}" 'libglvnd')
    provides=("NVIDIA-MODULE" "nvidia=$pkgver")
    conflicts+=('nvidia')

    _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
    install -Dt "${pkgdir}${_extradir}" -m644 "$srcdir/open-gpu-kernel-modules-${pkgver}/kernel-open"/*.ko

    # Compress each module individually
    find "$pkgdir" -name '*.ko' -exec zstd --rm -19 {} +

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

package_nvidia-vulkan-dkms() {
    pkgdesc="NVIDIA kernel modules - module sources (vulkan developer branch)"
    depends=('dkms' "nvidia-vulkan-utils=$pkgver" 'libglvnd')
    provides=('NVIDIA-MODULE' 'nvidia')
    conflicts=('NVIDIA-MODULE' 'nvidia')

    cd ${_pkg}

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel "${pkgdir}/usr/src/nvidia-${pkgver}"

    install -Dm644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_nvidia-vulkan-open-dkms() {
    pkgdesc="NVIDIA open kernel modules - module sources (vulkan developer branch)"
    depends+=('dkms')
    license=('MIT AND GPL-2.0-only')
    conflicts=('nvidia-open' 'NVIDIA-MODULE')
    provides=('nvidia-open' 'NVIDIA-MODULE')

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' open-gpu-kernel-modules-dkms "${pkgdir}/usr/src/nvidia-$pkgver"
    mv "${pkgdir}/usr/src/nvidia-$pkgver/kernel-open/dkms.conf" "${pkgdir}/usr/src/nvidia-$pkgver/dkms.conf"

    install -Dm644 open-gpu-kernel-modules-${pkgver}/COPYING "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

package_nvidia-vulkan-utils() {
    pkgdesc="NVIDIA drivers utilities (vulkan developer branch)"
    depends=('libglvnd' 'egl-wayland' 'egl-gbm' 'egl-x11')
    optdepends=('xorg-server: Xorg support'
        'xorg-server-devel: nvidia-xconfig'
        'opencl-nvidia: OpenCL support')
    conflicts=('nvidia-libgl' 'nvidia-settings' 'nvidia-utils')
    provides=('vulkan-driver' 'opengl-driver' 'nvidia-libgl' 'nvidia-settings' "nvidia-utils=$pkgver")
    replaces=('nvidia-libgl')
    install="${pkgname}.install"

    cd "${_pkg}"

    # Check http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/README/installedcomponents.html
    # for hints on what needs to be installed where.

    # X driver
    install -Dm755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

    # Wayland/GBM
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
    install -Dm755 "libnvidia-gpucomp.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-gpucomp.so.${pkgver}"

    # Vulkan ICD
    install -Dm644 "nvidia_icd.json" "${pkgdir}/usr/share/vulkan/icd.d/nvidia_icd.json"
    install -Dm644 "nvidia_layers.json" "${pkgdir}/usr/share/vulkan/implicit_layer.d/nvidia_layers.json"

    # VulkanSC
    install -D -m755 nvidia-pcc -t "${pkgdir}/usr/bin"
    install -D -m755 "libnvidia-vksc-core.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m644 nvidia_icd_vksc.json -t "${pkgdir}/usr/share/vulkansc/icd.d"

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
    install -Dm755 "nvoptix.bin" "${pkgdir}/usr/share/nvidia/nvoptix.bin"
    install -Dm755 "libnvoptix.so.${pkgver}" "${pkgdir}/usr/lib/libnvoptix.so.${pkgver}"
    install -Dm755 "libnvidia-rtcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-rtcore.so.${pkgver}"

    # NGX
    install -Dm755 nvidia-ngx-updater "${pkgdir}/usr/bin/nvidia-ngx-updater"
    install -Dm755 "libnvidia-ngx.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ngx.so.${pkgver}"
    install -Dm755 _nvngx.dll "${pkgdir}/usr/lib/nvidia/wine/_nvngx.dll"
    install -Dm755 nvngx.dll "${pkgdir}/usr/lib/nvidia/wine/nvngx.dll"
    install -Dm755 nvngx_dlssg.dll "${pkgdir}/usr/lib/nvidia/wine/nvngx_dlssg.dll"

    # Optical flow
    install -Dm755 "libnvidia-opticalflow.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opticalflow.so.${pkgver}"

    # Cryptography library wrapper
    ls libnvidia-pkcs*
    ls *openssl*
    install -Dm755 "libnvidia-pkcs11.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-pkcs11.so.${pkgver}"
    install -Dm755 "libnvidia-pkcs11-openssl3.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-pkcs11-openssl3.so.${pkgver}"

    # Sandboxhelper
    install -Dm755 "libnvidia-sandboxutils.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-sandboxutils.so.${pkgver}"

    # Present Helper
    install -Dm755 "libnvidia-present.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-present.so.${pkgver}"

    # Debug
    install -Dm755 nvidia-debugdump "${pkgdir}/usr/bin/nvidia-debugdump"

    # nvidia-xconfig
    install -Dm755 nvidia-xconfig "${pkgdir}/usr/bin/nvidia-xconfig"
    install -Dm644 nvidia-xconfig.1.gz "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1.gz"

    # nvidia-bug-report
    install -Dm755 nvidia-bug-report.sh "${pkgdir}/usr/bin/nvidia-bug-report.sh"

    # GTK+ for nvidia-settings
    install -Dm755 "libnvidia-gtk3.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-gtk3.so.${pkgver}"

    # nvidia-settings
    install -Dm755 nvidia-settings "${pkgdir}/usr/bin/nvidia-settings"
    install -Dm644 nvidia-settings.1.gz "${pkgdir}/usr/share/man/man1/nvidia-settings.1.gz"
    install -Dm644 nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
    install -Dm644 nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
    sed -e 's:__UTILS_PATH__:/usr/bin:' \
        -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' \
        -i "$pkgdir"/usr/share/applications/nvidia-settings.desktop

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

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nvidia-vulkan-utils/LICENSE"
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
    install -Dm644 "${srcdir}"/systemd-homed-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-homed.service.d/10-nvidia-no-freeze-session.conf
    install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-suspend.service.d/10-nvidia-no-freeze-session.conf
    install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-suspend-then-hibernate.service.d/10-nvidia-no-freeze-session.conf
    install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-hibernate.service.d/10-nvidia-no-freeze-session.conf
    install -Dm644 "${srcdir}"/systemd-suspend-override.conf "${pkgdir}"/usr/lib/systemd/system/systemd-hybrid-sleep.service.d/10-nvidia-no-freeze-session.conf

    # distro specific files must be installed in /usr/share/X11/xorg.conf.d
    install -Dm644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"

    install -Dm644 "${srcdir}/nvidia-vulkan-utils.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"

    install -Dm644 "${srcdir}/nvidia.rules" "$pkgdir"/usr/lib/udev/rules.d/60-nvidia.rules

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf" <<END
blacklist nouveau
blacklist nova_core
blacklist nova_drm
END

    echo "nvidia-uvm" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

    # Enable PreserveVideoMemoryAllocations and TemporaryFilePath
    # Fixes Wayland Sleep, when restoring the session
    install -Dm644 "${srcdir}/nvidia-sleep.conf" "${pkgdir}/usr/lib/modprobe.d/nvidia-sleep.conf"

    # Lists NVIDIA driver files for container runtimes like nvidia-container-toolkit
    install -Dm644 sandboxutils-filelist.json "${pkgdir}/usr/share/nvidia/files.d/sandboxutils-filelist.json"

    create_links
}

package_opencl-nvidia-vulkan() {
    pkgdesc="OpenCL implemention for NVIDIA (vulkan developer branch)"
    depends=('zlib')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('opencl-driver' "opencl-nvidia=$pkgver")
    conflicts=('opencl-nvidia')

    cd "${_pkg}"

    # OpenCL
    install -Dm644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -Dm755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia-vulkan-utils "${pkgdir}/usr/share/licenses/opencl-nvidia"
}

package_lib32-opencl-nvidia-vulkan() {
    pkgdesc="OpenCL implemention for NVIDIA (32-bit) (vulkan developer branch)"
    depends=('lib32-zlib' 'lib32-gcc-libs')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('lib32-opencl-driver' "lib32-opencl-nvidia=$pkgver")
    conflicts=('lib32-opencl-nvidia')

    cd "${_pkg}"/32

    # OpenCL
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia-vulkan-utils "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_lib32-nvidia-vulkan-utils() {
    pkgdesc="NVIDIA drivers utilities (32-bit) (vulkan developer branch)"
    depends=('lib32-zlib' 'lib32-gcc-libs' 'lib32-libglvnd' "nvidia-vulkan-utils=${pkgver}")
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
    ln -s nvidia-vulkan-utils "${pkgdir}/usr/share/licenses/${pkgname}"
}
