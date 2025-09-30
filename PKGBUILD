# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Contributor: Dan Vratil

pkgbase=nvidia-utils-beta
pkgname=('nvidia-utils-beta' 'opencl-nvidia-beta' 'nvidia-settings-beta')
pkgver=580.95.05
pkgrel=1
pkgdesc='NVIDIA drivers utilities (beta version)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('LicenseRef-custom')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        'nvidia-drm-outputclass.conf'
        'nvidia-sleep.conf'
        'nvidia-utils.sysusers'
        'nvidia.rules'
        'systemd-homed-override.conf'
        'systemd-suspend-override.conf'
        '10-gsk.conf'
        'gsk-renderer.sh'
        '120-nvidia-settings-change-desktop-paths.patch')
sha256sums=('849ef0ef8e842b9806b2cde9f11c1303d54f1a9a769467e4e5d961b2fe1182a7'
            'be99ff3def641bb900c2486cce96530394c5dc60548fc4642f19d3a4c784134d'
            '9c60bfe357cd1faf20f9167a6d42bfa724747805c1f12a1b603eb5ff57a523df'
            'f77a5247a3ba63e9fad3a3b2822d0fcfa51e0f79b5a90bd79bf08ea34b64ab07'
            '0e54249a7754b668b436f0f7aa7e95fff68edbb12a93dbee4660e09a8c695f84'
            'c5aa7b8abe69e72bfdc6b9ee8afbfd350bcc557e894558f2e6e4087fa9aa0dd8'
            '1d053c5078387021338cfc3a732bed61be1a20a549775573788e9134775c8149'
            '05af96f86b7b3b40b93160fdcb702572401579f8756c0831b5de5f8e9afebeba'
            '67eac203e7de4cf979b82c1e43439ac0e7c951d8901ebd9e4555c5d186a1b2ec'
            '6f0f4a23706241e9e37e0fe30a09bd30ca29bb446d8fe7861cb4959f0a010ef4')

# create soname links
_create_links() {
    local _lib
    local _soname
    local _base
    find "$pkgdir" -type f -name '*.so*' ! -path '*xorg/*' -print0 | while read -d $'\0' _lib
    do
        _soname="$(dirname "$_lib")/$(readelf -d "$_lib" | grep -Po 'SONAME.*: \[\K[^]]*' || true)"
        _base="$(printf '%s' "$_soname" | sed -r 's/(.*)\.so.*/\1.so/')"
        [ -e "$_soname" ] || ln -s "$(basename "$_lib")"    "$_soname"
        [ -e "$_base"   ] || ln -s "$(basename "$_soname")" "$_base"
    done
}

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    bsdtar -C "$_pkg" -xf "${_pkg}/nvidia-persistenced-init.tar.bz2"
    gunzip "$_pkg"/nvidia-{cuda-mps-control,modprobe,persistenced,settings,smi,xconfig}.1.gz
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/120-nvidia-settings-change-desktop-paths.patch"
}

package_nvidia-settings-beta() {
    pkgdesc='Tool for configuring the NVIDIA graphics driver (beta version)'
    depends=(
        'at-spi2-core'
        'cairo'
        'glib2'
        'glibc'
        'gdk-pixbuf2'
        'gtk3'
        'hicolor-icon-theme'
        'libx11'
        'libxext'
        "nvidia-utils-beta>=${pkgver}"
        'pango'
        'wayland')
    provides=("nvidia-settings=${pkgver}" "nvidia-settings-beta=${pkgver}")
    conflicts=('nvidia-settings')
    
    cd "$_pkg"
    
    install -D -m755 nvidia-settings         -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-settings.1       -t "${pkgdir}/usr/share/man/man1"
    install -D -m644 nvidia-settings.png     -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    install -D -m644 nvidia-settings.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m755 "libnvidia-gtk3.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-wayland-client.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_opencl-nvidia-beta() {
    pkgdesc='OpenCL implemention for NVIDIA (beta version)'
    depends=(
        'glibc'
        "nvidia-utils-beta>=${pkgver}"
        'zlib')
    optdepends=(
        'opencl-headers: headers necessary for OpenCL development')
    provides=("opencl-nvidia=${pkgver}" 'opencl-driver')
    conflicts=('opencl-nvidia')
    
    cd "$_pkg"
    
    # OpenCL
    install -D -m644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 "libnvidia-opencl.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    _create_links

    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_nvidia-utils-beta() {
    depends=(
        'bash'
        'egl-gbm'
        'egl-wayland'
        'egl-x11'
        'gcc-libs'
        'glibc'
        'libglvnd'
        'libx11'
        'libxext'
        'openssl')
    optdepends=(
        'nvidia-settings-beta: for the configuration tool'
        'opencl-nvidia-beta: for OpenCL support'
        'xorg-server: for Xorg support'
        'xorg-server-devel: for nvidia-xconfig')
    provides=("nvidia-utils=${pkgver}" 'vulkan-driver' 'opengl-driver' "nvidia-libgl=${pkgver}"
              "nvidia-libgl-beta=${pkgver}")
    conflicts=('nvidia-utils' 'nvidia-libgl')
    replaces=('nvidia-libgl')
    install=nvidia-utils.install
    
    cd "$_pkg"
    
    # X driver
    install -D -m755 nvidia_drv.so -t "${pkgdir}/usr/lib/xorg/modules/drivers"
    
    # Wayland/GBM
    install -d -m755 "${pkgdir}/usr/lib/gbm"
    ln -s "../libnvidia-allocator.so.${pkgver}" "${pkgdir}/usr/lib/gbm/nvidia-drm_gbm.so"
    
    # firmware
    install -D -m644 firmware/*.bin -t "${pkgdir}/usr/lib/firmware/nvidia/${pkgver}"
    
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
    install -D -m755  libnvidia-api.so.1                -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-fbc.so.${pkgver}"       -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-encode.so.${pkgver}"    -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-cfg.so.${pkgver}"       -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-ml.so.${pkgver}"        -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-glvkspirv.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-allocator.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-gpucomp.so.${pkgver}"   -t "${pkgdir}/usr/lib"
    
    # Vulkan ICD
    install -D -m644 nvidia_icd.json    -t "${pkgdir}/usr/share/vulkan/icd.d"
    install -D -m644 nvidia_layers.json -t "${pkgdir}/usr/share/vulkan/implicit_layer.d"
    
    # VulkanSC
    install -D -m755 nvidia-pcc -t "${pkgdir}/usr/bin"
    install -D -m755 "libnvidia-vksc-core.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m644 nvidia_icd_vksc.json -t "${pkgdir}/usr/share/vulkansc/icd.d"
    
    # NvPresent - Vulkan layer implementing NVIDIA Smooth Motion
    install -D -m755 "libnvidia-present.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib/vdpau"
    
    # nvidia-tls library
    install -D -m755 "libnvidia-tls.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # CUDA
    install -D -m755 "libcuda.so.${pkgver}"         -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvcuvid.so.${pkgver}"      -t "${pkgdir}/usr/lib"
    install -D -m755 "libcudadebugger.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # NVVM Compiler (JIT link-time-optimization for CUDA)
    install -D -m755 libnvidia-nvvm70.so.4 -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-nvvm.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # raytracing
    install -D -m755 "libnvoptix.so.${pkgver}"       -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-rtcore.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "nvoptix.bin"                   -t "${pkgdir}/usr/share/nvidia/nvoptix.bin"
    
    # NGX / DLSS
    install -D -m755 nvidia-ngx-updater -t "${pkgdir}/usr/bin"
    install -D -m755 "libnvidia-ngx.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m644 {,_}nvngx.dll -t "${pkgdir}/usr/lib/nvidia/wine"
    
    # Optical flow
    install -D -m755 "libnvidia-opticalflow.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # Cryptography library wrapper
    install -D -m755 "libnvidia-pkcs11.so.${pkgver}"          -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-pkcs11-openssl3.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # Debug
    install -D -m755 nvidia-debugdump -t "${pkgdir}/usr/bin"
    
    # nvidia-xconfig
    install -D -m755 nvidia-xconfig   -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-xconfig.1 -t "${pkgdir}/usr/share/man/man1"
    
    # nvidia-bug-report
    install -D -m755 nvidia-bug-report.sh -t "${pkgdir}/usr/bin"
    
    # nvidia-smi
    install -D -m755 nvidia-smi   -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-smi.1 -t "${pkgdir}/usr/share/man/man1"
    
    # nvidia-cuda-mps
    install -D -m755 nvidia-cuda-mps-server    -t "${pkgdir}/usr/bin"
    install -D -m755 nvidia-cuda-mps-control   -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-cuda-mps-control.1 -t "${pkgdir}/usr/share/man/man1"
    
    # nvidia-modprobe
    # This should be removed if nvidia fixed their uvm module!
    install -D -m4755 nvidia-modprobe   -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-modprobe.1 -t "${pkgdir}/usr/share/man/man1"
    
    # nvidia-persistenced
    install -D -m755 nvidia-persistenced   -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-persistenced.1 -t "${pkgdir}/usr/share/man/man1"
    install -D -m644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
    sed -i 's/__USER__/nvidia-persistenced/' "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
    
    # application profiles
    install -D -m644 "nvidia-application-profiles-${pkgver}-rc"                -t "${pkgdir}/usr/share/nvidia"
    install -D -m644 "nvidia-application-profiles-${pkgver}-key-documentation" -t "${pkgdir}/usr/share/nvidia"
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -D -m644 NVIDIA_Changelog -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 supported-gpus/supported-gpus.json -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' html "${pkgdir}/usr/share/doc/${pkgname}/"
    #ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"
    
    # new power management support
    install -D -m644 systemd/system/*.service -t "${pkgdir}/usr/lib/systemd/system"
    install -D -m755 systemd/system-sleep/nvidia -t "${pkgdir}/usr/lib/systemd/system-sleep"
    install -D -m755 systemd/nvidia-sleep.sh -t "${pkgdir}/usr/bin"
    install -D -m755 nvidia-powerd -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-dbus.conf -t "${pkgdir}/usr/share/dbus-1/system.d"
    install -D -m644 "${srcdir}/systemd-homed-override.conf" "${pkgdir}/usr/lib/systemd/system/systemd-homed.service.d/10-nvidia-no-freeze-session.conf"
    local _dir
    for _dir in systemd-{suspend{,-then-hibernate},hibernate,hybrid-sleep}.service.d
    do
        install -D -m644 "${srcdir}/systemd-suspend-override.conf" "${pkgdir}/usr/lib/systemd/system/${_dir}/10-nvidia-no-freeze-session.conf"
    done
    
    # distro specific files must be installed in /usr/share/X11/xorg.conf.d
    install -D -m644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"
    
    install -D -m644 "${srcdir}/nvidia-utils.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m644 "${srcdir}/nvidia.rules" "${pkgdir}/usr/lib/udev/rules.d/60-nvidia.rules"
    
    install -D -m644 <(printf '%s\n%s\n%s\n' 'blacklist nouveau' 'blacklist nova_core' 'blacklist nova_drm') "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
    install -D -m644 <(printf '%s\n' 'nvidia-uvm') "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
    
    # enable PreserveVideoMemoryAllocations and TemporaryFilePath
    # fixes Wayland Sleep, when restoring the session
    install -D -m644 "${srcdir}/nvidia-sleep.conf" -t "${pkgdir}/usr/lib/modprobe.d"
    
    # Vulkan GTK renderer crash fix
    # https://forums.developer.nvidia.com/t/580-65-06-gtk-4-apps-hang-when-attempting-to-exit-close/341308/5?u=ptr1337
    install -D -m644 "${srcdir}/gsk-renderer.sh" -t "${pkgdir}/etc/profile.d"
    # same fix but also for Gnome/GDM users
    install -D -m644 "${srcdir}/10-gsk.conf" -t "${pkgdir}/usr/lib/environment.d"
    
    # lists NVIDIA driver files for container runtimes like nvidia-container-toolkit
    install -D -m644 sandboxutils-filelist.json -t "${pkgdir}/usr/share/nvidia/files.d"
    
    _create_links
}
