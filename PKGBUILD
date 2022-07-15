# Maintainer: Erin Allison <erin@eallison.us>

# BUILD INSTRUCTIONS:
# -------------------
#
# Please note that distribution of the driver files used in this
# package may be prohibited by NVIDIA's EULA.
# Please consult any applicable license agreements prior to
# usage of this script.
#
# You will need to acquire both NVIDIA-Linux-...-grid.run
# and ...-vgpu-kvm.run, place them in the same directory
# as this PKGBUILD file, and then run makepkg.


pkgbase='nvidia-merged'
pkgname=('lib32-nvidia-merged-utils' 'lib32-opencl-nvidia-merged' 'nvidia-merged-dkms' 'nvidia-merged-settings' 'nvidia-merged-utils' 'opencl-nvidia-merged')
pkgver=510.73.06
pkgrel=1
arch=('x86_64')
makedepends=('git' 'rust')
url='https://krutavshah.github.io/GPU_Virtualization-Wiki/'
license=('custom')
options=('!strip')
groups=('nvidia-merged')
_gridpkgver=510.73.08
_gridpkg="NVIDIA-Linux-${CARCH}-${_gridpkgver}-grid"
_vgpupkg="NVIDIA-Linux-${CARCH}-${pkgver}-vgpu-kvm"

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])

source=(
    'nvidia-drm-outputclass.conf'
    'nvidia-smi'
    'nvidia-vgpu.conf'
    'vgpu_unlock-rs.conf'
    'disable-nvidia-blob-version-check.patch'
    'nvidia-510.73.05-vgpu-5.18.patch'
    'nv-kernel.patch'
    'nvidia.rules'
    'nvidia-utils.sysusers'
    'vgpu_unlock.patch'
    "file://${_gridpkg}.run"
    "file://${_vgpupkg}.run"
    'git+https://github.com/mbilker/vgpu_unlock-rs.git#commit=6deede6')
sha256sums=('be99ff3def641bb900c2486cce96530394c5dc60548fc4642f19d3a4c784134d'
            '20676096714ac00d9fc993901ab275e4b0fa3f2eddc937dae395c8f4e8cb543e'
            '5ea0d9edfcf282cea9b204291716a9a4d6d522ba3a6bc28d78edf505b6dc7949'
            'c85ae100a6c87c12906fd0057b77c0c4190f68434de4bc3bc89348ffc19aed61'
            'cc150696cf5b74556fca93cee3b1fc05695bb3a420a4a7bae5090e4b9d9bcfd7'
            '79b09682f9c3cfa32d219a14b3c956d8f05340addd5a43e7063c3d96175a56f4'
            '36325e26243429e1e55c8500bcac850fea6e6a8975a657984c0979042a001c7b'
            '4fbfd461f939f18786e79f8dba5fdb48be9f00f2ff4b1bb2f184dbce42dd6fc3'
            'd8d1caa5d72c71c6430c2a0d9ce1a674787e9272ccce28b9d5898ca24e60a167'
            'f77f26f609bb6f1eb69d3dc7e84ba704e5c065e424a619ab1460accb8247143f'
            '2affa1e1035a71b17d15d5fa9a16d8b3704d73701f04afaa4b09035a3412e6ce'
            'b7d076bee270e779b7c1eb512c9325794be2e8cbd7cd37c0f62fc72d87654a82'
            'SKIP')

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
    rm -rf "${_gridpkg}" "${_vgpupkg}"
    sh "${_gridpkg}.run" -x
    sh "${_vgpupkg}.run" -x

    sed \
      -e 's|__UTILS_PATH__|/usr/bin|' \
      -e 's|Icon=.*|Icon=nvidia-settings|' \
      -i "${_gridpkg}/nvidia-settings.desktop"

    bsdtar -C "${_gridpkg}" -xf "${_gridpkg}/nvidia-persistenced-init.tar.bz2"
    gunzip "${_gridpkg}"/nvidia-{cuda-mps-control,modprobe,persistenced,settings,smi,xconfig}.1.gz

    sed \
      -e 's/# VGX_KVM_BUILD parameter.*/\0 \nVGX_KVM_BUILD=1/' \
      -i "${_gridpkg}/kernel/conftest.sh"

    sed \
      -e "s/__VERSION_STRING/${_gridpkgver}/" \
      -e 's/__JOBS/`nproc`/' \
      -e 's/__DKMS_MODULES//' \
      -e '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILT_MODULE_NAME[3]="nvidia-drm"\
DEST_MODULE_LOCATION[3]="/kernel/drivers/video"\
BUILT_MODULE_NAME[4]="nvidia-vgpu-vfio"\
DEST_MODULE_LOCATION[4]="/kernel/drivers/video" \
BUILT_MODULE_NAME[5]="nvidia-peermem"\
DEST_MODULE_LOCATION[5]="/kernel/drivers/video"' \
      -e 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' \
      -i "${_gridpkg}/kernel/dkms.conf"

    pushd "${_vgpupkg}"
    patch -p1 < "${srcdir}/nvidia-510.73.05-vgpu-5.18.patch"
    popd

    pushd "${_gridpkg}"
    patch -p1 < "${srcdir}/disable-nvidia-blob-version-check.patch"
    patch -u kernel/nvidia/nv-kernel.o_binary < "${srcdir}/nv-kernel.patch"
    patch -p1 < "${srcdir}/vgpu_unlock.patch"
    popd
}

build() {
    cd "${srcdir}/vgpu_unlock-rs"

    cargo build -j `nproc` --release
}

package_opencl-nvidia-merged() {
    pkgdesc="OpenCL implemention for NVIDIA"
    depends=('zlib')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('opencl-driver' 'opencl-nvidia')
    conflicts=('opencl-nvidia')

    # OpenCL
    install -D -m644 "${_gridpkg}/nvidia.icd" "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 "${_gridpkg}/libnvidia-compiler-next.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-compiler-next.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvidia-compiler.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-compiler.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvidia-opencl.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${_gridpkgver}"

    create_links

    install -D -m644 "${_gridpkg}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

package_nvidia-merged-dkms() {
    pkgdesc="NVIDIA drivers - module sources; patched for vGPU support w/ Rust unlock & host DRM output"
    depends=('dkms' "nvidia-merged-utils=${pkgver}" 'libglvnd')
    provides=('NVIDIA-MODULE' 'nvidia-dkms')

    install -d -m755 "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_gridpkg}/kernel" "${pkgdir}/usr/src/nvidia-${_gridpkgver}"

    install -D -m644 "${_vgpupkg}/kernel/common/inc/nv-vgpu-vfio-interface.h" "${pkgdir}/usr/src/nvidia-${_gridpkgver}/common/inc/nv-vgpu-vfio-interface.h"
    install -D -m644 "${_vgpupkg}/kernel/nvidia/nv-vgpu-vfio-interface.c" "${pkgdir}/usr/src/nvidia-${_gridpkgver}/nvidia/nv-vgpu-vfio-interface.c"
    install -D -m644 "${_vgpupkg}/kernel/nvidia/nvidia-sources.Kbuild" "${pkgdir}/usr/src/nvidia-${_gridpkgver}/nvidia/nvidia-sources.Kbuild"
    cp -dr --no-preserve='ownership' "${_vgpupkg}/kernel/nvidia-vgpu-vfio" "${pkgdir}/usr/src/nvidia-${_gridpkgver}/nvidia-vgpu-vfio"

    echo "blacklist nouveau" | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
    echo "nvidia-uvm"        | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

    install -D -m644 "${_gridpkg}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "${_vgpupkg}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/VGPU_LICENSE"
}

package_nvidia-merged-settings() {
    pkgdesc='Tool for configuring the NVIDIA graphics driver'
    depends=('jansson' 'gtk3' 'libxv' 'libvdpau' "nvidia-merged-utils=${pkgver}")
    provides=('nvidia-settings')

    install -D -m755 "${_gridpkg}/nvidia-settings" "${pkgdir}/usr/bin/nvidia-settings"
    install -D -m644 "${_gridpkg}/libnvidia-gtk3.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-gtk3.so.${_gridpkgver}"
    install -D -m644 "${_gridpkg}/nvidia-settings.1" "${pkgdir}/usr/share/man/man1/nvidia-settings.1"
    install -D -m644 "${_gridpkg}/nvidia-settings.png" "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
    install -D -m644 "${_gridpkg}/nvidia-settings.desktop" "${pkgdir}/usr/share/applications/nvidia-settings.desktop"

    create_links

    install -D -m644 "${_gridpkg}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

package_nvidia-merged-utils() {
    pkgdesc="NVIDIA drivers utilities; patched for vGPU support w/ Rust unlock & host DRM output"
    depends=('xorg-server' 'libglvnd' 'egl-wayland')
    optdepends=("nvidia-merged-settings=${pkgver}: configuration tool"
                'xorg-server-devel: nvidia-xconfig'
                "opencl-nvidia-merged=${pkgver}: OpenCL support"
                'mdevctl: mediated device contfiguration tool'
                'libvirt: virtualization engine control interface')
    conflicts=('nvidia-libgl')
    provides=('vulkan-driver' 'opengl-driver' 'nvidia-libgl' 'nvidia-utils' 'vgpu_unlock')
    replaces=('vgpu_unlock')

    # X driver
    install -D -m755 "${_gridpkg}/nvidia_drv.so" "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

    # Wayland/GBM
    install -D -m755 "${_gridpkg}/libnvidia-egl-gbm.so.1.1.0" "${pkgdir}/usr/lib/libnvidia-egl-gbm.so.1.1.0"
    install -D -m644 "${_gridpkg}/15_nvidia_gbm.json" "${pkgdir}/usr/share/egl/egl_external_platform.d/15_nvidia_gbm.json"

    mkdir -p "${pkgdir}/usr/lib/gbm"
    ln -s "/usr/lib/libnvidia-allocator.so.${_gridpkgver}" "${pkgdir}/usr/lib/gbm/nvidia-drm_gbm.so"

    # firmware
    install -D -m644 "${_gridpkg}/firmware/gsp.bin" "${pkgdir}/usr/lib/firmware/nvidia/${_gridpkgver}/gsp.bin"

    # GLX extension module for X
    install -D -m755 "${_gridpkg}/libglxserver_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.${_gridpkgver}"

    # Ensure that X finds glx
    ln -s "libglxserver_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.1"
    ln -s "libglxserver_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so"

    install -D -m755 "${_gridpkg}/libGLX_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib/libGLX_nvidia.so.${_gridpkgver}"

    # OpenGL libraries
    install -D -m755 "${_gridpkg}/libEGL_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib/libEGL_nvidia.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libGLESv1_CM_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib/libGLESv1_CM_nvidia.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libGLESv2_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib/libGLESv2_nvidia.so.${_gridpkgver}"
    install -D -m644 "${_gridpkg}/10_nvidia.json" "${pkgdir}/usr/share/glvnd/egl_vendor.d/10_nvidia.json"

    # OpenGL core library
    install -D -m755 "${_gridpkg}/libnvidia-glcore.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-glcore.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvidia-eglcore.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-eglcore.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvidia-glsi.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-glsi.so.${_gridpkgver}"

    # misc
    install -D -m755 "${_gridpkg}/libnvidia-fbc.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-fbc.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvidia-encode.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-encode.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvidia-cfg.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-cfg.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvidia-ml.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-ml.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvidia-glvkspirv.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-glvkspirv.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvidia-allocator.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-allocator.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvidia-vulkan-producer.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-vulkan-producer.so.${_gridpkgver}"
    # Sigh libnvidia-vulkan-producer.so has no SONAME set so create_links doesn't catch it. NVIDIA please fix!
    ln -s "libnvidia-vulkan-producer.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-vulkan-producer.so.1"
    ln -s "libnvidia-vulkan-producer.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-vulkan-producer.so"

    # Vulkan ICD
    install -D -m644 "${_gridpkg}/nvidia_icd.json" "${pkgdir}/usr/share/vulkan/icd.d/nvidia_icd.json"
    install -D -m644 "${_gridpkg}/nvidia_layers.json" "${pkgdir}/usr/share/vulkan/implicit_layer.d/nvidia_layers.json"

    # VDPAU
    install -D -m755 "${_gridpkg}/libvdpau_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${_gridpkgver}"

    # nvidia-tls library
    install -D -m755 "${_gridpkg}/libnvidia-tls.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-tls.so.${_gridpkgver}"

    # CUDA
    install -D -m755 "${_gridpkg}/libcuda.so.${_gridpkgver}" "${pkgdir}/usr/lib/libcuda.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvcuvid.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvcuvid.so.${_gridpkgver}"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "${_gridpkg}/libnvidia-ptxjitcompiler.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-ptxjitcompiler.so.${_gridpkgver}"

    # raytracing
    install -D -m755 "${_gridpkg}/libnvoptix.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvoptix.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/libnvidia-rtcore.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-rtcore.so.${_gridpkgver}"

    # NGX
    install -D -m755 "${_gridpkg}/libnvidia-ngx.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-ngx.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/nvidia-ngx-updater" "${pkgdir}/usr/bin/nvidia-ngx-updater"
    install -D -m755 "${_gridpkg}/_nvngx.dll" "${pkgdir}/usr/lib/nvidia/wine/_nvngx.dll"
    install -D -m755 "${_gridpkg}/nvngx.dll" "${pkgdir}/usr/lib/nvidia/wine/nvngx.dll"

    # Optical flow
    install -D -m755 "${_gridpkg}/libnvidia-opticalflow.so.${_gridpkgver}" "${pkgdir}/usr/lib/libnvidia-opticalflow.so.${_gridpkgver}"

    # vGPU
    install -D -m755 "${_vgpupkg}/libnvidia-vgpu.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-vgpu.so.${pkgver}"
    install -D -m755 "${_vgpupkg}/libnvidia-vgxcfg.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-vgxcfg.so.${pkgver}"

    # DEBUG
    install -D -m755 "${_gridpkg}/nvidia-debugdump" "${pkgdir}/usr/bin/nvidia-debugdump"

    # nvidia-xconfig
    install -D -m755 "${_gridpkg}/nvidia-xconfig" "${pkgdir}/usr/bin/nvidia-xconfig"
    install -D -m644 "${_gridpkg}/nvidia-xconfig.1" "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1"

    # nvidia-bug-report
    install -D -m755 "${_vgpupkg}/nvidia-bug-report.sh" "${pkgdir}/usr/bin/nvidia-bug-report.sh"

    # nvidia-smi
    install -D -m755 "${_gridpkg}/nvidia-smi" "${pkgdir}/usr/lib/nvidia/nvidia-smi.orig"
    install -D -m644 "${_gridpkg}/nvidia-smi.1" "${pkgdir}/usr/share/man/man1/nvidia-smi.1"
    install -D -m755 "${srcdir}/nvidia-smi" "${pkgdir}/usr/bin/nvidia-smi"

    # nvidia-vgpu
    install -D -m755 "${_vgpupkg}/nvidia-vgpud" "${pkgdir}/usr/bin/nvidia-vgpud"
    install -D -m755 "${_vgpupkg}/nvidia-vgpu-mgr" "${pkgdir}/usr/bin/nvidia-vgpu-mgr"
    install -D -m644 "${_vgpupkg}/vgpuConfig.xml" "${pkgdir}/usr/share/nvidia/vgpu/vgpuConfig.xml"
    install -D -m644 "${_vgpupkg}/init-scripts/systemd/nvidia-vgpud.service" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpud.service"
    install -D -m644 "${_vgpupkg}/init-scripts/systemd/nvidia-vgpu-mgr.service" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpu-mgr.service"
    install -D -m644 "${srcdir}/vgpu_unlock-rs.conf" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpud.service.d/30-vgpu_unlock-rs.conf"
    install -D -m644 "${srcdir}/vgpu_unlock-rs.conf" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpu-mgr.service.d/30-vgpu_unlock-rs.conf"
    install -D -m644 "${srcdir}/nvidia-vgpu.conf" "${pkgdir}/usr/lib/systemd/system/libvirtd.service.d/20-nvidia-vgpu.conf"

    # nvidia-cuda-mps
    install -D -m755 "${_gridpkg}/nvidia-cuda-mps-server" "${pkgdir}/usr/bin/nvidia-cuda-mps-server"
    install -D -m755 "${_gridpkg}/nvidia-cuda-mps-control" "${pkgdir}/usr/bin/nvidia-cuda-mps-control"
    install -D -m644 "${_gridpkg}/nvidia-cuda-mps-control.1" "${pkgdir}/usr/share/man/man1/nvidia-cuda-mps-control.1"

    # nvidia-modprobe
    # This should be removed if nvidia fixed their uvm module!
    install -D -m4755 "${_gridpkg}/nvidia-modprobe" "${pkgdir}/usr/bin/nvidia-modprobe"
    install -D -m644  "${_gridpkg}/nvidia-modprobe.1" "${pkgdir}/usr/share/man/man1/nvidia-modprobe.1"

    # nvidia-persistenced
    install -D -m755 "${_gridpkg}/nvidia-persistenced" "${pkgdir}/usr/bin/nvidia-persistenced"
    install -D -m644 "${_gridpkg}/nvidia-persistenced.1" "${pkgdir}/usr/share/man/man1/nvidia-persistenced.1"
    install -D -m644 "${_gridpkg}/nvidia-persistenced-init/systemd/nvidia-persistenced.service.template" "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
    sed -i 's/__USER__/nvidia-persistenced/' "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"

    # application profiles
    install -D -m644 "${_gridpkg}/nvidia-application-profiles-${_gridpkgver}-rc" "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${_gridpkgver}-rc"
    install -D -m644 "${_gridpkg}/nvidia-application-profiles-${_gridpkgver}-key-documentation" "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${_gridpkgver}-key-documentation"

    install -D -m644 "${_gridpkg}/README.txt" "${pkgdir}/usr/share/doc/nvidia/README"
    install -D -m644 "${_gridpkg}/NVIDIA_Changelog" "${pkgdir}/usr/share/doc/nvidia/NVIDIA_Changelog"
    cp -r "${_gridpkg}/html" "${pkgdir}/usr/share/doc/nvidia/"
    ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"

    # distro specific files must be installed in /usr/share/X11/xorg.conf.d
    install -D -m644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"

    create_links

    # vgpu_unlock-rs
    install -D -m755 "vgpu_unlock-rs/target/release/libvgpu_unlock_rs.so" "${pkgdir}/usr/lib/nvidia/libvgpu_unlock_rs.so"

    install -D -m644 "${_gridpkg}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "${_vgpupkg}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/VGPU_LICENSE"
    install -D -m644 "vgpu_unlock-rs/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/VGPU_UNLOCK-RS_LICENSE"
}

package_lib32-nvidia-merged-utils() {
    pkgdesc="NVIDIA drivers utilities; patched for vGPU support w/ Rust unlock & host DRM output (32-bit)"
    depends=('lib32-zlib' 'lib32-gcc-libs' 'lib32-libglvnd' "nvidia-merged-utils=${pkgver}")
    optdepends=("lib32-opencl-nvidia=${pkgver}")
    provides=('lib32-vulkan-driver' 'lib32-opengl-driver' 'lib32-nvidia-libgl' 'lib32-nvidia-utils')
    replaces=('lib32-nvidia-libgl')

    install -D -m755 "${_gridpkg}/32/libGLX_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libGLX_nvidia.so.${_gridpkgver}"

    # OpenGL libraries
    install -D -m755 "${_gridpkg}/32/libEGL_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libEGL_nvidia.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/32/libGLESv1_CM_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libGLESv1_CM_nvidia.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/32/libGLESv2_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libGLESv2_nvidia.so.${_gridpkgver}"

    # OpenGL core library
    install -D -m755 "${_gridpkg}/32/libnvidia-glcore.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-glcore.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/32/libnvidia-eglcore.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-eglcore.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/32/libnvidia-glsi.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-glsi.so.${_gridpkgver}"

    # misc
    install -D -m755 "${_gridpkg}/32/libnvidia-fbc.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-fbc.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/32/libnvidia-encode.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-encode.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/32/libnvidia-ml.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-ml.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/32/libnvidia-glvkspirv.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-glvkspirv.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/32/libnvidia-allocator.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-allocator.so.${_gridpkgver}"

    # VDPAU
    install -D -m755 "${_gridpkg}/32/libvdpau_nvidia.so.${_gridpkgver}" "${pkgdir}/usr/lib32/vdpau/libvdpau_nvidia.so.${_gridpkgver}"

    # nvidia-tls library
    install -D -m755 "${_gridpkg}/32/libnvidia-tls.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-tls.so.${_gridpkgver}"

    # CUDA
    install -D -m755 "${_gridpkg}/32/libcuda.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libcuda.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/32/libnvcuvid.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvcuvid.so.${_gridpkgver}"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "${_gridpkg}/32/libnvidia-ptxjitcompiler.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-ptxjitcompiler.so.${_gridpkgver}"

    # Optical flow
    install -D -m755 "${_gridpkg}/32/libnvidia-opticalflow.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-opticalflow.so.${_gridpkgver}"

    create_links

    install -D -m644 "${_gridpkg}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

package_lib32-opencl-nvidia-merged() {
    pkgdesc="OpenCL implemention for NVIDIA (32-bit)"
    depends=('lib32-zlib' 'lib32-gcc-libs')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('lib32-opencl-driver' 'lib32-opencl-nvidia')
    conflicts=('lib32-opencl-nvidia')

    # OpenCL
    install -D -m755 "${_gridpkg}/32/libnvidia-compiler.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-compiler.so.${_gridpkgver}"
    install -D -m755 "${_gridpkg}/32/libnvidia-opencl.so.${_gridpkgver}" "${pkgdir}/usr/lib32/libnvidia-opencl.so.${_gridpkgver}"

    create_links

    install -D -m644 "${_gridpkg}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
