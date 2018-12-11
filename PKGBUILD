# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Contributor: Dan Vratil
# Based on [extra]'s nvidia-utils: https://www.archlinux.org/packages/extra/x86_64/nvidia-utils/

pkgbase=nvidia-utils-beta
pkgname=('nvidia-utils-beta' 'nvidia-egl-wayland-beta' 'nvidia-libgl-beta' 'opencl-nvidia-beta')
pkgver=415.22
pkgrel=1
pkgdesc='NVIDIA driver utilities and libraries (beta version)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom:NVIDIA')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        'nvidia-drm-outputclass.conf'
        'nvidia-utils-beta.sysusers')
sha256sums=('41f59dc6916aad42bce97debacd9cf44a7511e49de661138da761cebc23d13c9'
            '089d6dc247c9091b320c418b0d91ae6adda65e170934d178cdd4e9bd0785b182'
            'd8d1caa5d72c71c6430c2a0d9ce1a674787e9272ccce28b9d5898ca24e60a167')

_eglver=1.1.0

# create missing soname links
_create_links() {
    local _lib
    local _soname
    local _base
    
    for _lib in $(find "$pkgdir" -name '*.so*' | grep -v 'xorg/')
    do
        # get soname/base name
        _soname="$(dirname "$_lib")/$(readelf -d "$_lib" | grep -Po 'SONAME.*: \[\K[^]]*' || true)"
        _base="$(echo "$_soname" | sed -r 's/(.*).so.*/\1.so/')"
        
        # create missing links
        [ -e "$_soname" ] || ln -s "$(basename "$_lib")"    "$_soname"
        [ -e "$_base"   ] || ln -s "$(basename "$_soname")" "$_base"
    done
}

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    bsdtar -xf nvidia-persistenced-init.tar.bz2
    
    sed -i 's/__NV_VK_ICD__/libGLX_nvidia.so.0/' nvidia_icd.json.template
}

package_opencl-nvidia-beta() {
    pkgdesc="NVIDIA's OpenCL implemention for 'nvidia-utils-beta'"
    depends=('zlib')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=("opencl-nvidia=${pkgver}" 'opencl-driver')
    conflicts=('opencl-nvidia')
    
    cd "$_pkg"
    
    # libraries
    install -D -m755 "libnvidia-compiler.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-opencl.so.${pkgver}"   -t "${pkgdir}/usr/lib"
    _create_links
    
    # vendor icd
    install -D -m644 nvidia.icd -t "${pkgdir}/etc/OpenCL/vendors"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_nvidia-libgl-beta() {
    pkgdesc="NVIDIA driver library symlinks for 'nvidia-utils-beta'"
    depends=('nvidia-utils-beta')
    provides=("nvidia-libgl=${pkgver}" 'libgl' 'libegl' 'libgles')
    conflicts=('nvidia-libgl' 'libgl' 'libegl' 'libgles')
    
    cd "$_pkg"
    
    mkdir -p "${pkgdir}/usr/lib/"
    
    # libGL (link)
    ln -s /usr/lib/nvidia/libGL.so.1.7.0 "${pkgdir}/usr/lib/libGL.so.1"
    ln -s libGL.so.1 "${pkgdir}/usr/lib/libGL.so"
    
    # EGL (link)
    ln -s /usr/lib/nvidia/libEGL.so.1.1.0 "${pkgdir}/usr/lib/libEGL.so.1"
    ln -s libEGL.so.1 "${pkgdir}/usr/lib/libEGL.so"
    
    # OpenGL ES 1 (link)
    ln -s /usr/lib/nvidia/libGLESv1_CM.so.1.2.0 "${pkgdir}/usr/lib/libGLESv1_CM.so.1"
    ln -s libGLESv1_CM.so.1 "${pkgdir}/usr/lib/libGLESv1_CM.so"
    
    # OpenGL ES 2 (link)
    ln -s /usr/lib/nvidia/libGLESv2.so.2.1.0 "${pkgdir}/usr/lib/libGLESv2.so.2"
    ln -s libGLESv2.so.2 "${pkgdir}/usr/lib/libGLESv2.so"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_nvidia-egl-wayland-beta() {
    pkgdesc="NVIDIA EGL Wayland library (libnvidia-egl-wayland.so.${_eglver}) for 'nvidia-utils-beta'"
    depends=('nvidia-utils-beta')
    provides=('egl-wayland')
    conflicts=('egl-wayland')
    
    cd "$_pkg"
    
    # libraries
    install -D -m755 "libnvidia-egl-wayland.so.${_eglver}" -t "${pkgdir}/usr/lib"
    ln -s "libnvidia-egl-wayland.so.${_eglver}" "${pkgdir}/usr/lib/libnvidia-egl-wayland.so"
    ln -s "libnvidia-egl-wayland.so.${_eglver}" "${pkgdir}/usr/lib/libnvidia-egl-wayland.so.1"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_nvidia-utils-beta() {
    pkgdesc='NVIDIA driver utilities and libraries (beta version)'
    depends=('xorg-server' 'mesa>=17.0.2-2')
    optdepends=('gtk2: nvidia-settings (GTK+ v2)'
                'gtk3: nvidia-settings (GTK+ v3)'
                'opencl-nvidia-beta: OpenCL support'
                'xorg-server-devel: nvidia-xconfig'
                "egl-wayland-git: for alternative, more advanced Wayland library (libnvidia-egl-wayland.so.${_eglver})")
    provides=("nvidia-utils=${pkgver}" "nvidia-settings=${pkgver}" 'libglvnd' 'vulkan-driver')
    conflicts=('nvidia-utils' 'nvidia-settings' 'libglvnd')
    install="${pkgname}.install"
    
    cd "$_pkg"
    
##### LIBRARIES AND COMPONENTS #####
    
    # X driver
    install -D -m755 nvidia_drv.so -t "${pkgdir}/usr/lib/xorg/modules/drivers/"
    
    # GLX extension for X
    install -D -m755 "libglxserver_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib/nvidia/xorg"
    ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so.1"  # X doesn't find glx otherwise
    ln -s "libglxserver_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/libglxserver_nvidia.so"    # X doesn't find glx otherwise
    
    # X wrapped software rendering
    install -D -m755 "libnvidia-wfb.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # libGL & OpenGL
    install -D -m755  libGL.so.1.7.0                    -t "${pkgdir}/usr/lib/nvidia"
    install -D -m755  libGLdispatch.so.0                -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-glcore.so.${pkgver}"    -t "${pkgdir}/usr/lib"
    install -D -m755  libOpenGL.so.0                    -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-glvkspirv.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # GLX
    install -D -m755  libGLX.so.0                 -t "${pkgdir}/usr/lib"
    install -D -m755 "libGLX_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib"
    # now in mesa driver
    #ln -s "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/libGLX_indirect.so.0"
    
    # EGL
    install -D -m755  libEGL.so.1.1.0                 -t "${pkgdir}/usr/lib/nvidia"
    install -D -m755 "libEGL_nvidia.so.${pkgver}"     -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-eglcore.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m644  10_nvidia.json         -t "${pkgdir}/usr/share/glvnd/egl_vendor.d"
    install -D -m644  10_nvidia_wayland.json -t "${pkgdir}/usr/share/egl/egl_external_platform.d"
    
    # OpenGL ES
    install -D -m755  libGLESv1_CM.so.1.2.0             -t "${pkgdir}/usr/lib/nvidia"
    install -D -m755 "libGLESv1_CM_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755  libGLESv2.so.2.1.0                -t "${pkgdir}/usr/lib/nvidia"
    install -D -m755 "libGLESv2_nvidia.so.${pkgver}"    -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-glsi.so.${pkgver}"      -t "${pkgdir}/usr/lib"
    
    # VDPAU (Video Decode and Presentation API for Unix)
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib/vdpau"
    
    # GPU-accelerated video encoding
    install -D -m755 "libnvidia-encode.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # GTK+ for nvidia-settings
    install -D -m755 "libnvidia-gtk2.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-gtk3.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # component of nvidia-xconfig
    install -D -m755 "libnvidia-cfg.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # CUDA (Compute Unified Device Architecture) (perform traditional CPU calculations with the GPU)
    install -D -m755 "libcuda.so.${pkgver}"    -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvcuvid.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # Fat (multiarchitecture) binary loader
    install -D -m755 "libnvidia-fatbinaryloader.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # TLS (Thread local storage) support for OpenGL libs
    install -D -m755 "libnvidia-tls.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # GPU monitoring and management (1/2)
    install -D -m755 "libnvidia-ml.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # vulkan icd
    install -D -m644 nvidia_icd.json.template "${pkgdir}/usr/share/vulkan/icd.d/nvidia_icd.json"
    
    # vulkan real-time ray tracing extensions (VK_NV_raytracing)
    install -D -m755 "libnvidia-rtcore.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-cbl.so.${pkgver}"    -t "${pkgdir}/usr/lib"
    
    # helper libs for approved partners GRID remote apps
    install -D -m755 "libnvidia-ifr.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-fbc.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # OptiX ray tracing engine
    install -D -m755 "libnvoptix.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    _create_links
    
##### BINARIES AND MANPAGES #####
    
    # CUDA MPS (Multi Process Service)
    install -D -m755 nvidia-cuda-mps-server       -t "${pkgdir}/usr/bin"
    install -D -m755 nvidia-cuda-mps-control      -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-cuda-mps-control.1.gz -t "${pkgdir}/usr/share/man/man1"
    
    # for loading the kernel module and creating the character device files
    install -D -m4755 nvidia-modprobe      -t "${pkgdir}/usr/bin"
    install -D -m644  nvidia-modprobe.1.gz -t "${pkgdir}/usr/share/man/man1"
    
    # daemon for maintaining persistent software state in the driver
    install -D -m755 nvidia-persistenced      -t "$pkgdir/usr/bin"
    install -D -m644 nvidia-persistenced.1.gz -t "$pkgdir/usr/share/man/man1"
    install -D -m644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template \
                   "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
    sed -i 's/__USER__/nvidia-persistenced/' "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
    
    # GUI for configuring the driver
    install -D -m755 nvidia-settings         -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-settings.1.gz    -t "${pkgdir}/usr/share/man/man1"
    install -D -m644 nvidia-settings.png     -t "${pkgdir}/usr/share/pixmaps"
    install -D -m644 nvidia-settings.desktop -t "${pkgdir}/usr/share/applications"
    sed -e 's:__UTILS_PATH__:/usr/bin:' \
        -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' \
        -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
        
    # GPU monitoring and management (2/2)
    install -D -m755 nvidia-smi      -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-smi.1.gz -t "${pkgdir}/usr/share/man/man1"
    
    # basic control over configuration options in the driver
    install -D -m755 nvidia-xconfig      -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-xconfig.1.gz -t "${pkgdir}/usr/share/man/man1"
    
    # debugging and bug reporting
    install -D -m755 nvidia-bug-report.sh -t "${pkgdir}/usr/bin"
    install -D -m755 nvidia-debugdump     -t "${pkgdir}/usr/bin"
    
##### MISCELLANEOUS #####
    
    # vendor profiles
    install -D -m644 "nvidia-application-profiles-${pkgver}-rc"                -t "${pkgdir}/usr/share/nvidia"
    install -D -m644 "nvidia-application-profiles-${pkgver}-key-documentation" -t "${pkgdir}/usr/share/nvidia"
                    
    # documentation
    install -D -m644 README.txt          "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -D -m644 NVIDIA_Changelog -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a html                           "${pkgdir}/usr/share/doc/${pkgname}"
    
    # distro-specific files must be installed in /usr/share/X11/xorg.conf.d
    install -D -m644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"
    
    # sysusers
    install -D -m644 "${srcdir}/nvidia-utils-beta.sysusers" -t "${pkgdir}/usr/lib/sysusers.d"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
