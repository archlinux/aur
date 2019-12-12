# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>

pkgbase=nvidia-full-beta-all
pkgname=('nvidia-full-beta-all'
         'nvidia-utils-full-beta-all'
         'opencl-nvidia-full-beta-all'
         'nvidia-settings-full-beta-all'
         'lib32-nvidia-utils-full-beta-all'
         'lib32-opencl-nvidia-full-beta-all')
pkgver=440.44
pkgrel=1
pkgdesc='Full NVIDIA driver package for all kernels on the system (drivers, utilities and libraries) (beta version)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom')
makedepends=('linux' 'linux-headers')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        'nvidia-drm-outputclass.conf'
        'nvidia-utils-full-beta-all.sysusers'
        'FS62142.patch'
        'nvidia-settings-full-beta-all-change-desktop-paths.patch')
sha256sums=('ad427df2b619e6150291f9e03938dc8253769a59e900178c7f07d12d6ec2fc14'
            '5519cdb420a45c15030f99c5c8c73eff322dc24b55d20e0167f0f5e97ebf0a97'
            'd8d1caa5d72c71c6430c2a0d9ce1a674787e9272ccce28b9d5898ca24e60a167'
            'c961006882afb691410c017c239e2c2ef61badb88f15735d37112b513ef0a99d'
            '633bf69c39b8f35d0e64062eb0365c9427c2191583f2daa20b14e51772e8423a')

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
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    bsdtar -xf nvidia-persistenced-init.tar.bz2
    
    patch -Np1 -i "${srcdir}/nvidia-settings-full-beta-all-change-desktop-paths.patch"
    
    # create a build directory for each installed kernel
    local _kernel
    local -a _kernels
    mapfile -t _kernels < <(find /usr/lib/modules/*/build/version -exec cat {} +)
    for _kernel in "${_kernels[@]}"
    do
        cp -a kernel "kernel-${_kernel}"
        printf '%s\n' "  -> Applying patch(es) for kernel ${_kernel}..."
        cd "kernel-${_kernel}"
        
        # fix https://bugs.archlinux.org/task/62142
        patch -Np2 -i "${srcdir}/FS62142.patch"
        
        cd ..
    done
}

build() {
    local _kernel
    local -a _kernels
    mapfile -t _kernels < <(find /usr/lib/modules/*/build/version -exec cat {} +)
    
    for _kernel in "${_kernels[@]}"
    do
        cd "${srcdir}/${_pkg}/kernel-${_kernel}"
        
        printf '%s\n' "  -> Building Nvidia module for ${_kernel}..."
        make SYSSRC="/usr/lib/modules/${_kernel}/build" module
    done
}

package_nvidia-full-beta-all() {
    depends=("nvidia-utils-full-beta-all>=${pkgver}" 'libglvnd')
    provides=("nvidia=${pkgver}" "nvidia-beta=${pkgver}")
    conflicts=('nvidia')
    
    local _kernel
    local -a _kernels
    mapfile -t _kernels < <(find /usr/lib/modules/*/build/version -exec cat {} +)
    
    for _kernel in "${_kernels[@]}"
    do
        install -D -m644 "${_pkg}/kernel-${_kernel}/"nvidia{,-drm,-modeset,-uvm}.ko -t "${pkgdir}/usr/lib/modules/${_kernel}/extramodules"
        
        find "$pkgdir" -name '*.ko' -exec gzip -n {} +
    done
    
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_nvidia-settings-full-beta-all() {
    pkgdesc="Tool for configuring the NVIDIA graphics driver for 'nvidia-full-beta-all'"
    depends=("nvidia-utils-full-beta-all>=${pkgver}" 'gtk3')
    provides=("nvidia-settings=${pkgver}" "nvidia-settings=${pkgver}")
    conflicts=('nvidia-settings')
    
    cd "$_pkg"
    
    install -D -m755 nvidia-settings         -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-settings.1.gz    -t "${pkgdir}/usr/share/man/man1"
    install -D -m644 nvidia-settings.png     -t "${pkgdir}/usr/share/pixmaps"
    install -D -m644 nvidia-settings.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m755 "libnvidia-gtk3.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_opencl-nvidia-full-beta-all() {
    pkgdesc="NVIDIA's OpenCL implemention for 'nvidia-utils-full-beta-all'"
    depends=('zlib' "nvidia-utils-full-beta-all>=${pkgver}")
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=("opencl-nvidia=${pkgver}" 'opencl-driver')
    conflicts=('opencl-nvidia')
    
    cd "$_pkg"
    
    # OpenCL
    install -D -m644 nvidia.icd "${pkgdir}/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 "libnvidia-compiler.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-opencl.so.${pkgver}"   -t "${pkgdir}/usr/lib"
    
    _create_links

    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_nvidia-utils-full-beta-all() {
    pkgdesc="NVIDIA driver utilities and libraries for 'nvidia-full-beta-all'"
    depends=('xorg-server' 'libglvnd' 'egl-wayland')
    optdepends=('nvidia-settings-full-beta-all: for the configuration tool'
                'xorg-server-devel: for nvidia-xconfig'
                'opencl-nvidia-full-beta-all: for OpenCL support')
    provides=("nvidia-utils=${pkgver}" 'vulkan-driver' 'opengl-driver' "nvidia-libgl=${pkgver}"
              "nvidia-libgl-beta=${pkgver}")
    conflicts=('nvidia-utils' 'nvidia-libgl')
    replaces=('nvidia-libgl')
    install=nvidia-utils-full-beta-all.install
    
    cd "$_pkg"
    
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
    install -D -m644 "10_nvidia.json"                   -t "${pkgdir}/usr/share/glvnd/egl_vendor.d"
    
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
    
    # Fat (multiarchitecture) binary loader
    install -D -m755 "libnvidia-fatbinaryloader.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # raytracing
    install -D -m755 "libnvoptix.so.${pkgver}"       -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-rtcore.so.${pkgver}" -t "${pkgdir}/usr/lib"
    install -D -m755 "libnvidia-cbl.so.${pkgver}"    -t "${pkgdir}/usr/lib"
    
    # Optical flow
    install -D -m755 "libnvidia-opticalflow.so.${pkgver}" -t "${pkgdir}/usr/lib"
    
    # DEBUG
    install -D -m755 nvidia-debugdump -t "${pkgdir}/usr/bin"
    
    # nvidia-xconfig
    install -D -m755 nvidia-xconfig      -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-xconfig.1.gz -t "${pkgdir}/usr/share/man/man1"
    
    # nvidia-bug-report
    install -D -m755 nvidia-bug-report.sh -t "${pkgdir}/usr/bin"
    
    # nvidia-smi
    install -D -m755 nvidia-smi      -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-smi.1.gz -t "${pkgdir}/usr/share/man/man1"
    
    # nvidia-cuda-mps
    install -D -m755 nvidia-cuda-mps-server       -t "${pkgdir}/usr/bin"
    install -D -m755 nvidia-cuda-mps-control      -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-cuda-mps-control.1.gz -t "${pkgdir}/usr/share/man/man1"
    
    # nvidia-modprobe
    # This should be removed if nvidia fixed their uvm module!
    install -D -m4755 nvidia-modprobe     -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-modprobe.1.gz -t "${pkgdir}/usr/share/man/man1"
    
    # nvidia-persistenced
    install -D -m755 nvidia-persistenced      -t "${pkgdir}/usr/bin"
    install -D -m644 nvidia-persistenced.1.gz -t "${pkgdir}/usr/share/man/man1"
    install -D -m644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
    sed -i 's/__USER__/nvidia-persistenced/' "${pkgdir}/usr/lib/systemd/system/nvidia-persistenced.service"
    
    # application profiles
    install -D -m644 "nvidia-application-profiles-${pkgver}-rc"                -t "${pkgdir}/usr/share/nvidia"
    install -D -m644 "nvidia-application-profiles-${pkgver}-key-documentation" -t "${pkgdir}/usr/share/nvidia"
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -D -m644 NVIDIA_Changelog -t "${pkgdir}/usr/share/doc/${pkgname}"
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
    
    install -D -m644 "${srcdir}/nvidia-utils-full-beta-all.sysusers" -t "${pkgdir}/usr/lib/sysusers.d"
    
    _create_links
}

package_lib32-opencl-nvidia-full-beta-all() {
    pkgdesc="NVIDIA's OpenCL implemention for 'lib32-nvidia-utils-full-beta-all' "
    depends=('lib32-zlib' 'lib32-gcc-libs' "lib32-nvidia-utils-full-beta-all>=${pkgver}")
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=("lib32-opencl-nvidia=${pkgver}" 'lib32-opencl-driver')
    conflicts=('lib32-opencl-nvidia')
    
    cd "${_pkg}/32"
    
    # OpenCL
    install -D -m755 "libnvidia-compiler.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-opencl.so.${pkgver}"   -t "${pkgdir}/usr/lib32"
    
    _create_links
    
    # license
    install -D -m644 "${srcdir}/${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_lib32-nvidia-utils-full-beta-all() {
    pkgdesc="NVIDIA driver utilities and libraries for 'nvidia-full-beta-all' (32-bit)"
    depends=('lib32-zlib' 'lib32-gcc-libs' 'lib32-libglvnd' "nvidia-utils-full-beta-all>=${pkgver}")
    optdepends=('lib32-opencl-nvidia-full-beta-all: for OpenCL support')
    provides=("lib32-nvidia-utils=${pkgver}" 'lib32-vulkan-driver' 'lib32-opengl-driver'
              "lib32-nvidia-libgl=${pkgver}" "lib32-nvidia-libgl-beta=${pkgver}")
    conflicts=('lib32-nvidia-utils' 'lib32-nvidia-libgl')
    replaces=('lib32-nvidia-libgl')
    
    cd "${_pkg}/32"
    
    install -D -m755 "libGLX_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # OpenGL libraries
    install -D -m755 "libEGL_nvidia.so.${pkgver}"       -t "${pkgdir}/usr/lib32"
    install -D -m755 "libGLESv1_CM_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    install -D -m755 "libGLESv2_nvidia.so.${pkgver}"    -t "${pkgdir}/usr/lib32"
    
    # OpenGL core library
    install -D -m755 "libnvidia-glcore.so.${pkgver}"  -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-eglcore.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-glsi.so.${pkgver}"    -t "${pkgdir}/usr/lib32"
    
    # misc
    install -D -m755 "libnvidia-ifr.so.${pkgver}"       -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-fbc.so.${pkgver}"       -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-encode.so.${pkgver}"    -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-ml.so.${pkgver}"        -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-glvkspirv.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib32/vdpau"
    
    # nvidia-tls library
    install -D -m755 "libnvidia-tls.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # CUDA
    install -D -m755 "libcuda.so.${pkgver}"    -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvcuvid.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # Fat (multiarchitecture) binary loader
    install -D -m755 "libnvidia-fatbinaryloader.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # Optical flow
    install -D -m755 "libnvidia-opticalflow.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    _create_links
    
    # license
    install -D -m644 "${srcdir}/${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
