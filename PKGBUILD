# Maintainer: Erin Allison <erin@eallison.us>

pkgbase='nvidia-merged'
pkgname=('nvidia-merged' 'lib32-nvidia-merged-utils' 'lib32-opencl-nvidia-merged' 'nvidia-merged-dkms' 'nvidia-merged-settings' 'nvidia-merged-utils' 'opencl-nvidia-merged')
pkgver=460.73.01
pkgrel=11
arch=('x86_64')
makedepends=('git' 'rust')
url='https://krutavshah.github.io/GPU_Virtualization-Wiki/'
license=('custom')
options=('!strip')
groups=('nvidia-merged')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-grid-vgpu-kvm-v5"
_vgpuver=460.73.02
source=('nvidia-drm-outputclass.conf' 'nvidia-smi' 'nvidia-vgpu.conf' 'vgpu_unlock-rs.conf' 'twelve.patch' 'fourteen.patch' '99-nvidia-ignoreabi.conf'
    "${_pkg}.run::gdrive://1dCyUteA2MqJaemRKqqTu5oed5mINu9Bw"
    'git+https://github.com/mbilker/vgpu_unlock-rs.git#commit=3ca0999')
sha256sums=('be99ff3def641bb900c2486cce96530394c5dc60548fc4642f19d3a4c784134d'
            '20676096714ac00d9fc993901ab275e4b0fa3f2eddc937dae395c8f4e8cb543e'
            '5ea0d9edfcf282cea9b204291716a9a4d6d522ba3a6bc28d78edf505b6dc7949'
            'c85ae100a6c87c12906fd0057b77c0c4190f68434de4bc3bc89348ffc19aed61'
            '8c374e9e6053c20b0bcf71faf33adfa2659c1020ce1f38d469b42dd2bbda9749'
            'affb0b2fde720ee7963746bc7a4eda459b1dd1a8a5650b4ae2de64c9e6cf54f1'
            'a5caf3ce59fea2f99643be73412224cf27846bc10f09ba3a4758b05bbbf5fb1d'
            '0bc28cf13c1a4d8845c7f8987974e04bd52734321bb8db526c6938530ad12c71'
            'SKIP')

DLAGENTS=("gdrive::/usr/bin/bash -c cookie=\$(mktemp);id=\$(echo\ %u\ |cut\ -f3\ -d'/');curl\ -qgb\ \"\$cookie\"\ -c\ \"\$cookie\"\ -fLC\ -\ --retry\ 3\ --retry-delay\ 3\ https://drive.google.com/uc?export=download\\\&id=\$id\ -o\ /dev/null;curl\ -qgb\ \"\$cookie\"\ -c\ \"\$cookie\"\ -fLC\ -\ --retry\ 3\ --retry-delay\ 3\ https://drive.google.com/uc?export=download\\\&confirm=\`egrep\ download.+\$id\ \"\$cookie\"|cut\ -f7\`\\\&id=\$id\ -o\ %o")

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
    sh "${_pkg}.run" -x

    cd "${_pkg}"

    sed -i '/Environment=LD_PRELOAD.*/D' init-scripts/systemd/nvidia-vgpud.service
    sed -i '/Environment=LD_PRELOAD.*/D' init-scripts/systemd/nvidia-vgpu-mgr.service

    sed -i 's|/usr/bin/vgpu_unlock ||' init-scripts/systemd/nvidia-vgpud.service
    sed -i 's|/usr/bin/vgpu_unlock ||' init-scripts/systemd/nvidia-vgpu-mgr.service

    sed -i 's|__UTILS_PATH__|/usr/bin|' nvidia-settings.desktop
    sed -i 's|__PIXMAP_PATH__|/usr/share/pixmaps|' nvidia-settings.desktop

    gunzip nvidia-{cuda-mps-control,modprobe,settings,smi,xconfig}.1.gz

    cd kernel

    mkdir patches

    cp "${srcdir}/twelve.patch" patches/
    cp "${srcdir}/fourteen.patch" patches/

    patch -R -p1 < patches/twelve.patch

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
BUILT_MODULE_NAME[4]="nvidia-vgpu-vfio"\
DEST_MODULE_LOCATION[4]="/kernel/drivers/video"\
\
PATCH[0]="twelve.patch"\
PATCH_MATCH[0]="^5.1[012345].*$"\
PATCH[1]="fourteen.patch"\
PATCH_MATCH[1]="^5\.1[45].*$"' dkms.conf
}

build() {
    cd "${srcdir}/vgpu_unlock-rs"

    cargo build --release
}

package_opencl-nvidia-merged() {
    pkgdesc="OpenCL implemention for NVIDIA"
    depends=('zlib')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('opencl-driver' 'opencl-nvidia')

    cd "${_pkg}"

    # OpenCL
    install -D -m644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-compiler.so.${pkgver}"
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opencl.so.${pkgver}"

    create_links

    install -D -m644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/opencl-nvidia"
}

package_nvidia-merged-dkms() {
    pkgdesc="NVIDIA drivers - module sources; patched for vGPU support w/ Rust unlock"
    depends=('dkms' "nvidia-merged-utils=${pkgver}" 'libglvnd')
    provides=('NVIDIA-MODULE' 'nvidia-dkms')

    cd "${_pkg}"

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel "${pkgdir}/usr/src/nvidia-${pkgver}"

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia-dkms.conf"

    install -D -m644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/nvidia-dkms"
}

package_nvidia-merged-settings() {
    pkgdesc='Tool for configuring the NVIDIA graphics driver'
    depends=('jansson' 'gtk3' 'libxv' 'libvdpau' "nvidia-merged-utils=${pkgver}")
    provides=('nvidia-settings')

    cd "${_pkg}"


    install -D -m755 nvidia-settings "${pkgdir}/usr/bin/nvidia-settings"
    install -D -m644 "libnvidia-gtk3.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-gtk3.so.${pkgver}"
    install -D -m644 nvidia-settings.1 "${pkgdir}/usr/share/man/man1/nvidia-settings.1"
    install -D -m644 nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
    install -D -m644 nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia-utils "${pkgdir}/usr/share/licenses/nvidia-settings"
}

package_nvidia-merged() {
    pkgdesc='NVIDIA drivers for linux; patched for vGPU support w/ Rust unlock'
    depends=("nvidia-merged-dkms=${pkgver}" "nvidia-merged-utils=${pkgver}")
    optdepends=("lib32-nvidia-merged-utils=${pkgver}" "lib32-opencl-nvidia-merged=${pkgver}")
    provides=('nvidia')

    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s nvidia-utils "${pkgdir}/usr/share/licenses/nvidia"
}

package_nvidia-merged-utils() {
    pkgdesc="NVIDIA drivers utilities; patched for vGPU support w/ Rust unlock"
    depends=('xorg-server' 'libglvnd' 'egl-wayland')
    optdepends=("nvidia-merged-settings=${pkgver}: configuration tool"
                'xorg-server-devel: nvidia-xconfig'
                "opencl-nvidia-merged=${pkgver}: OpenCL support"
                'mdevctl: mediated device contfiguration tool'
                'libvirt: virtualization engine control interface')
    conflicts=('nvidia-libgl')
    provides=('vulkan-driver' 'opengl-driver' 'nvidia-libgl' 'nvidia-utils' 'vgpu_unlock')
    replaces=('nvidia-libgl' 'vgpu_unlock')
    backup=('etc/vgpu_unlock/profile_override.toml')

    cd "${_pkg}"

    # X driver
    install -D -m755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"

    # GLX extension module for X
    install -D -m755 "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.${pkgver}"
    # Ensure that X finds glx
    ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.1"
    ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so"

    install -D -m755 "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLX_nvidia.so.${pkgver}"

    install -D -m 644 "${srcdir}/99-nvidia-ignoreabi.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/99-nvidia-ignoreabi.conf"

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
    install -D -m755 "libnvidia-ngx.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ngx.so.${pkgver}"
    install -D -m755 "libnvidia-glvkspirv.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glvkspirv.so.${pkgver}"
    install -D -m755 "libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-allocator.so.${pkgver}"

    # Vulkan ICD
    install -D -m644 "nvidia_icd.json" "${pkgdir}/usr/share/vulkan/icd.d/nvidia_icd.json"
    install -D -m644 "nvidia_layers.json" "${pkgdir}/usr/share/vulkan/implicit_layer.d/nvidia_layers.json"

    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}"

    # nvidia-tls library
    install -D -m755 "libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-tls.so.${pkgver}"

    # CUDA
    install -D -m755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib/libcuda.so.${pkgver}"
    install -D -m755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ptxjitcompiler.so.${pkgver}"

    # raytracing
    install -D -m755 "libnvoptix.so.${pkgver}" "${pkgdir}/usr/lib/libnvoptix.so.${pkgver}"
    install -D -m755 "libnvidia-rtcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-rtcore.so.${pkgver}"
    install -D -m755 "libnvidia-cbl.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-cbl.so.${pkgver}"

    # Optical flow
    install -D -m755 "libnvidia-opticalflow.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-opticalflow.so.${pkgver}"

    # vGPU
    install -D -m755 "libnvidia-vgpu.so.${_vgpuver}" "${pkgdir}/usr/lib/libnvidia-vgpu.so.${_vgpuver}"
    install -D -m755 "libnvidia-vgxcfg.so.${_vgpuver}" "${pkgdir}/usr/lib/libnvidia-vgxcfg.so.${_vgpuver}"

    # DEBUG
    install -D -m755 nvidia-debugdump "${pkgdir}/usr/bin/nvidia-debugdump"

    # nvidia-xconfig
    install -D -m755 nvidia-xconfig "${pkgdir}/usr/bin/nvidia-xconfig"
    install -D -m644 nvidia-xconfig.1 "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1"

    # nvidia-bug-report
    install -D -m755 nvidia-bug-report.sh "${pkgdir}/usr/bin/nvidia-bug-report.sh"

    # nvidia-smi
    install -D -m755 nvidia-smi "${pkgdir}/usr/lib/nvidia/nvidia-smi.orig"
    install -D -m644 nvidia-smi.1 "${pkgdir}/usr/share/man/man1/nvidia-smi.1"
    install -D -m755 "${srcdir}/nvidia-smi" "${pkgdir}/usr/bin/nvidia-smi"

    # nvidia-vgpu
    install -D -m755 nvidia-vgpud "${pkgdir}/usr/bin/nvidia-vgpud"
    install -D -m755 nvidia-vgpu-mgr "${pkgdir}/usr/bin/nvidia-vgpu-mgr"
    install -D -m644 vgpuConfig.xml "${pkgdir}/usr/share/nvidia/vgpu/vgpuConfig.xml"
    install -D -m644 init-scripts/systemd/nvidia-vgpud.service "${pkgdir}/usr/lib/systemd/system/nvidia-vgpud.service"
    install -D -m644 init-scripts/systemd/nvidia-vgpu-mgr.service "${pkgdir}/usr/lib/systemd/system/nvidia-vgpu-mgr.service"
    install -D -m644 "${srcdir}/vgpu_unlock-rs.conf" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpud.service.d/30-vgpu_unlock-rs.conf"
    install -D -m644 "${srcdir}/vgpu_unlock-rs.conf" "${pkgdir}/usr/lib/systemd/system/nvidia-vgpu-mgr.service.d/30-vgpu_unlock-rs.conf"
    install -D -m644 "${srcdir}/nvidia-vgpu.conf" "${pkgdir}/usr/lib/systemd/system/libvirtd.service.d/20-nvidia-vgpu.conf"

    # nvidia-cuda-mps
    install -D -m755 nvidia-cuda-mps-server "${pkgdir}/usr/bin/nvidia-cuda-mps-server"
    install -D -m755 nvidia-cuda-mps-control "${pkgdir}/usr/bin/nvidia-cuda-mps-control"
    install -D -m644 nvidia-cuda-mps-control.1 "${pkgdir}/usr/share/man/man1/nvidia-cuda-mps-control.1"

    # nvidia-modprobe
    # This should be removed if nvidia fixed their uvm module!
    install -D -m4755 nvidia-modprobe "${pkgdir}/usr/bin/nvidia-modprobe"
    install -D -m644 nvidia-modprobe.1 "${pkgdir}/usr/share/man/man1/nvidia-modprobe.1"

    # application profiles
    install -D -m644 nvidia-application-profiles-${pkgver}-rc "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-rc"
    install -D -m644 nvidia-application-profiles-${pkgver}-key-documentation "${pkgdir}/usr/share/nvidia/nvidia-application-profiles-${pkgver}-key-documentation"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/nvidia-utils/LICENSE"
    install -D -m644 README.txt "${pkgdir}/usr/share/doc/nvidia/README"
    install -D -m644 NVIDIA_Changelog "${pkgdir}/usr/share/doc/nvidia/NVIDIA_Changelog"
    cp -r html "${pkgdir}/usr/share/doc/nvidia/"
    ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"

    # distro specific files must be installed in /usr/share/X11/xorg.conf.d
    install -D -m644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"

    create_links

    # vgpu_unlock-rs
    install -D -m755 "${srcdir}/vgpu_unlock-rs/target/release/libvgpu_unlock_rs.so" "${pkgdir}/usr/lib/nvidia/libvgpu_unlock_rs.so"
    install -D -m644 /dev/null "${pkgdir}/etc/vgpu_unlock/profile_override.toml"
}

package_lib32-nvidia-merged-utils() {
    pkgdesc="NVIDIA drivers utilities; patched for vGPU support w/ Rust unlock (32-bit)"
    depends=('lib32-zlib' 'lib32-gcc-libs' 'lib32-libglvnd' "nvidia-merged-utils=${pkgver}")
    optdepends=("lib32-opencl-nvidia=${pkgver}")
    provides=('lib32-vulkan-driver' 'lib32-opengl-driver' 'lib32-nvidia-libgl' 'lib32-nvidia-utils')
    replaces=('lib32-nvidia-libgl')

    cd "${_pkg}/32"

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
    install -D -m755 "libnvidia-fbc.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-fbc.so.${pkgver}"
    install -D -m755 "libnvidia-ifr.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-ifr.so.${pkgver}"
    install -D -m755 "libnvidia-encode.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-encode.so.${pkgver}"
    install -D -m755 "libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-ml.so.${pkgver}"
    install -D -m755 "libnvidia-glvkspirv.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-glvkspirv.so.${pkgver}"
    install -D -m755 "libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-allocator.so.${pkgver}"

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
    ln -s nvidia-utils "${pkgdir}/usr/share/licenses/lib32-nvidia-utils"
}

package_lib32-opencl-nvidia-merged() {
    pkgdesc="OpenCL implemention for NVIDIA (32-bit)"
    depends=('lib32-zlib' 'lib32-gcc-libs')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('lib32-opencl-driver' 'lib32-opencl-nvidia')

    cd "${_pkg}/32"

    # OpenCL
    install -D -m755 "libnvidia-compiler.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-compiler.so.${pkgver}"
    install -D -m755 "libnvidia-opencl.so.${pkgver}" "${pkgdir}/usr/lib32/libnvidia-opencl.so.${pkgver}"

    create_links

    mkdir -p "${pkgdir}/usr/share/licenses"
    install -D -m644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/lib32-opencl-nvidia"
}
