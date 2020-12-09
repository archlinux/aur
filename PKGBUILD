# $Id$
# Maintainer: jcstryker <inbox at jasonstryker dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>
# Contributor: Alex Luberg <alex@luberg.me>

pkgbase=nvidia-full-vulkan-all
pkgname=('nvidia-full-vulkan-all' 'nvidia-utils-full-vulkan-all' 'opencl-nvidia-full-vulkan-all'   'lib32-nvidia-utils-full-vulkan-all' 'lib32-opencl-nvidia-full-vulkan-all' 'nvidia-settings-full-vulkan-all')
pkgver=455.46.02
pkgrel=1
pkgdesc="NVIDIA drivers for linux (vulkan developer branch) for all kernels on the system (drivers, utilities and libraries)"
arch=('x86_64')
url="https://developer.nvidia.com/vulkan-driver"
makedepends=('libglvnd' 'linux' 'linux-headers')
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-$pkgver"
source=("$_pkg.run::https://developer.nvidia.com/vulkan-beta-${pkgver//.}-linux"
        'kernel-5.6.patch'
        'kernel-5.7.patch'
        'nvidia-drm-outputclass.conf'
        'nvidia-vulkan-utils.sysusers')
sha512sums=('549b62b7ba66471f00142fe4d02de6d09f480ff05ef33431f33d32bf4a35a2cf349c5b9087e0a0ee028ca6cc10be395238146be4224aa6ab8038768df1c94514'
            'a622f4d784103d58f30c584976060ba499f794a0852c469da202314842495bdfbbcae8a510b534eec4477590a1181cae1b98d239a54a60ef2bd752b6ca8ebd1b'
            'ba5df48ef67285739b3321b6e1f7480b13fa1a3d9b0773acf5973aba7477c7d291f5d2448c9d3af92b51916dd24e2f470535f03979de2010130d6edc0869d06e'
            'c49d246a519731bfab9d22afa5c2dd2d366db06d80182738b84881e93cd697c783f16ee04819275c05597bb063451a5d6102fbc562cd078d2a374533a23cea48'
            '4b3ad73f5076ba90fe0b3a2e712ac9cde76f469cd8070280f960c3ce7dc502d1927f525ae18d008075c8f08ea432f7be0a6c3a7a6b49c361126dcf42f97ec499')

create_links() {
    # create soname links
    local _lib
    local _soname
    local _base
    find "$pkgdir" -type f -name '*.so*' ! -path '*xorg/*' -print0 | while read -d $'\0' _lib; do
        _soname=$(dirname "$_lib")/$(readelf -d "$_lib" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
        _base=$(echo "$_soname" | sed -r 's/(.*).so.*/\1.so/')
        [[ -e "${_soname}" ]] || ln -s "$(basename "$_lib")" "$_soname"
        [[ -e "${_base}" ]] || ln -s "$(basename "$_soname")" "$_base"
    done
}

prepare() {
    sh "$_pkg.run" -x
    cd "$_pkg"

    bsdtar -xf nvidia-persistenced-init.tar.bz2
    patch -Np1 -i ../kernel-5.6.patch
    patch -Np1 -i ../kernel-5.7.patch

    #linux-rt fox for newer drivers.
    sed -i -e 's|PREEMPT_RT_PRESENT=1|PREEMPT_RT_PRESENT=0|g' kernel/conftest.sh

   # create a build directory for each installed kernel
   local -a _kernel
   local -a _kernels
   mapfile -t _kernels < <(find /usr/lib/modules/*/build/version -exec cat {} +)
   for _kernel in "${_kernels[@]}"
   do
       cp -a kernel "kernel-$_kernel"
   done
}

build() {
    local _kernel
    local -a _kernels
    mapfile -t _kernels < <(find /usr/lib/modules/*/build/version -exec cat {} +)
    
    for _kernel in "${_kernels[@]}"; do
      cd "$srcdir"/$_pkg/kernel-$_kernel

      # Build module
      msg2 "Building Nvidia module for $_kernel..."
      make SYSSRC=/usr/lib/modules/$_kernel/build modules
    done
}

package_nvidia-full-vulkan-all() {
    pkgdesc="full NVIDIA drivers for all kernels on the system (vulkan developer branch)"
    depends=("nvidia-utils-full-vulkan-all=$pkgver" 'libglvnd')
    provides=("nvidia=$pkgver")
    conflicts+=('nvidia')

    local _kernel
    local -a _kernels
    mapfile -t _kernels < <(find /usr/lib/modules/*/build/version -exec cat {} +)

    for _kernel in "${_kernels[@]}"
    do
        install -D -m644 "$_pkg/kernel-$_kernel/"nvidia{,-drm,-modeset,-uvm}.ko -t "$pkgdir/usr/lib/modules/$_kernel/extramodules"

        find "$pkgdir" -name '*.ko' -exec gzip -n {} +
      done
    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"

    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 "$srcdir/$_pkg/LICENSE"
}

package_nvidia-settings-full-vulkan-all() {
    pkgdesc="Tool for configuring the NVIDIA graphics driver for 'nvidia-full-beta-all'"
    depends=("nvidia-utils-full-vulkan-all>=$pkgver" 'gtk3' 'gtk2')
    provides=("nvidia-settings=$pkgver")
    conflicts=('nvidia-settings')

    cd "$_pkg"

    install -D -m755 nvidia-settings         -t "$pkgdir/usr/bin"
    install -D -m644 nvidia-settings.1.gz    -t "$pkgdir/usr/share/man/man1"
    install -D -m644 nvidia-settings.png     -t "$pkgdir/usr/share/pixmaps"
    install -D -m644 nvidia-settings.desktop -t "$pkgdir/usr/share/applications"
    install -D -m755 "libnvidia-gtk3.so.$pkgver" -t "$pkgdir/usr/lib"
    install -D -m755 "libnvidia-gtk2.so.$pkgver" -t "$pkgdir/usr/lib"

    # license
    install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
package_opencl-nvidia-full-vulkan-all() {
    pkgdesc="OpenCL implemention for NVIDIA"
    depends=('zlib')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('opencl-driver' "opencl-nvidia=$pkgver")
    conflicts=('opencl-nvidia')
    cd "$_pkg"

    # OpenCL
    install -D -m644 nvidia.icd "$pkgdir/etc/OpenCL/vendors/nvidia.icd"
    install -D -m755 "libnvidia-compiler.so.$pkgver" "$pkgdir/usr/lib/libnvidia-compiler.so.$pkgver"
    install -D -m755 "libnvidia-opencl.so.$pkgver" "$pkgdir/usr/lib/libnvidia-opencl.so.$pkgver"

    create_links

    mkdir -p "$pkgdir/usr/share/licenses"
    ln -s nvidia "$pkgdir/usr/share/licenses/opencl-nvidia-vulkan"
}

package_nvidia-utils-full-vulkan-all() {
    pkgdesc="NVIDIA drivers utilities and libraries"
    depends=('xorg-server' 'libglvnd' 'egl-wayland')
    optdepends=('nvidia-settings-full-vulkan-all: for the configuration tool'
                'xorg-server-devel: nvidia-xconfig'
                'opencl-nvidia-full-vulkan-all: OpenCL support')
    conflicts=('nvidia-utils' 'nvidia-libgl')
    provides=("nvidia-utils=$pkgver" 'vulkan-driver' 'opengl-driver' 'nvidia-libgl')
    replaces=('nvidia-libgl')
    install="nvidia-vulkan-utils.install"

    cd "$_pkg"

    # X driver
    install -D -m755 nvidia_drv.so "$pkgdir/usr/lib/xorg/modules/drivers/nvidia_drv.so"

    # GLX extension module for X
    install -D -m755 "libglxserver_nvidia.so.$pkgver" "$pkgdir/usr/lib/nvidia/xorg/libglxserver_nvidia.so.$pkgver"
    # Ensure that X finds glx
    ln -s "libglxserver_nvidia.so.$pkgver" "$pkgdir/usr/lib/nvidia/xorg/libglxserver_nvidia.so.1"
    ln -s "libglxserver_nvidia.so.$pkgver" "$pkgdir/usr/lib/nvidia/xorg/libglxserver_nvidia.so"

    install -D -m755 "libGLX_nvidia.so.$pkgver" "$pkgdir/usr/lib/libGLX_nvidia.so.$pkgver"

    # OpenGL libraries
    install -D -m755 "libEGL_nvidia.so.$pkgver" "$pkgdir/usr/lib/libEGL_nvidia.so.$pkgver"
    install -D -m755 "libGLESv1_CM_nvidia.so.$pkgver" "$pkgdir/usr/lib/libGLESv1_CM_nvidia.so.$pkgver"
    install -D -m755 "libGLESv2_nvidia.so.$pkgver" "$pkgdir/usr/lib/libGLESv2_nvidia.so.$pkgver"
    install -D -m644 "10_nvidia.json" "$pkgdir/usr/share/glvnd/egl_vendor.d/10_nvidia.json"

    # OpenGL core library
    install -D -m755 "libnvidia-glcore.so.$pkgver" "$pkgdir/usr/lib/libnvidia-glcore.so.$pkgver"
    install -D -m755 "libnvidia-eglcore.so.$pkgver" "$pkgdir/usr/lib/libnvidia-eglcore.so.$pkgver"
    install -D -m755 "libnvidia-glsi.so.$pkgver" "$pkgdir/usr/lib/libnvidia-glsi.so.$pkgver"

    # misc
    install -D -m755 "libnvidia-ifr.so.$pkgver" "$pkgdir/usr/lib/libnvidia-ifr.so.$pkgver"
    install -D -m755 "libnvidia-fbc.so.$pkgver" "$pkgdir/usr/lib/libnvidia-fbc.so.$pkgver"
    install -D -m755 "libnvidia-encode.so.$pkgver" "$pkgdir/usr/lib/libnvidia-encode.so.$pkgver"
    install -D -m755 "libnvidia-cfg.so.$pkgver" "$pkgdir/usr/lib/libnvidia-cfg.so.$pkgver"
    install -D -m755 "libnvidia-ml.so.$pkgver" "$pkgdir/usr/lib/libnvidia-ml.so.$pkgver"
    install -D -m755 "libnvidia-glvkspirv.so.$pkgver" "$pkgdir/usr/lib/libnvidia-glvkspirv.so.$pkgver"

    # Vulkan ICD
    install -D -m644 "nvidia_icd.json" "$pkgdir/usr/share/vulkan/icd.d/nvidia_icd.json"

    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.$pkgver" "$pkgdir/usr/lib/vdpau/libvdpau_nvidia.so.$pkgver"

    # nvidia-tls library
    install -D -m755 "libnvidia-tls.so.$pkgver" "$pkgdir/usr/lib/libnvidia-tls.so.$pkgver"

    # CUDA
    install -D -m755 "libcuda.so.$pkgver" "$pkgdir/usr/lib/libcuda.so.$pkgver"
    install -D -m755 "libnvcuvid.so.$pkgver" "$pkgdir/usr/lib/libnvcuvid.so.$pkgver"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.$pkgver" "$pkgdir/usr/lib/libnvidia-ptxjitcompiler.so.$pkgver"

    # Fat (multiarchitecture) binary loader
    install -D -m755 "libnvidia-fatbinaryloader.so.$pkgver" "$pkgdir/usr/lib/libnvidia-fatbinaryloader.so.$pkgver"

    # raytracing
    install -D -m755 "libnvoptix.so.$pkgver" "$pkgdir/usr/lib/libnvoptix.so.$pkgver"
    install -D -m755 "libnvidia-rtcore.so.$pkgver" "$pkgdir/usr/lib/libnvidia-rtcore.so.$pkgver"
    install -D -m755 "libnvidia-cbl.so.$pkgver" "$pkgdir/usr/lib/libnvidia-cbl.so.$pkgver"

    # Optical Flow
    install -D -m755 "libnvidia-opticalflow.so.$pkgver" -t "$pkgdir/usr/lib"

    # DEBUG
    install -D -m755 nvidia-debugdump "$pkgdir/usr/bin/nvidia-debugdump"

    # nvidia-xconfig
    install -D -m755 nvidia-xconfig "$pkgdir/usr/bin/nvidia-xconfig"
    install -D -m644 nvidia-xconfig.1.gz "$pkgdir/usr/share/man/man1/nvidia-xconfig.1.gz"

    # nvidia-bug-report
    install -D -m755 nvidia-bug-report.sh "$pkgdir/usr/bin/nvidia-bug-report.sh"

    # nvidia-smi
    install -D -m755 nvidia-smi "$pkgdir/usr/bin/nvidia-smi"
    install -D -m644 nvidia-smi.1.gz "$pkgdir/usr/share/man/man1/nvidia-smi.1.gz"

    # nvidia-cuda-mps
    install -D -m755 nvidia-cuda-mps-server "$pkgdir/usr/bin/nvidia-cuda-mps-server"
    install -D -m755 nvidia-cuda-mps-control "$pkgdir/usr/bin/nvidia-cuda-mps-control"
    install -D -m644 nvidia-cuda-mps-control.1.gz "$pkgdir/usr/share/man/man1/nvidia-cuda-mps-control.1.gz"

    # nvidia-modprobe
    # This should be removed if nvidia fixed their uvm module!
    install -D -m4755 nvidia-modprobe "$pkgdir/usr/bin/nvidia-modprobe"
    install -D -m644 nvidia-modprobe.1.gz "$pkgdir/usr/share/man/man1/nvidia-modprobe.1.gz"

    # nvidia-persistenced
    install -D -m755 nvidia-persistenced "$pkgdir/usr/bin/nvidia-persistenced"
    install -D -m644 nvidia-persistenced.1.gz "$pkgdir/usr/share/man/man1/nvidia-persistenced.1.gz"
    install -D -m644 nvidia-persistenced-init/systemd/nvidia-persistenced.service.template "$pkgdir/usr/lib/systemd/system/nvidia-persistenced.service"
    sed -i 's/__USER__/nvidia-persistenced/' "$pkgdir/usr/lib/systemd/system/nvidia-persistenced.service"

    # application profiles
    install -D -m644 nvidia-application-profiles-"$pkgver"-rc "$pkgdir/usr/share/nvidia/nvidia-application-profiles-$pkgver-rc"
    install -D -m644 nvidia-application-profiles-"$pkgver"-key-documentation "$pkgdir/usr/share/nvidia/nvidia-application-profiles-$pkgver-key-documentation"

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/nvidia-vulkan-utils/LICENSE"
    install -D -m644 README.txt "$pkgdir/usr/share/doc/nvidia/README"
    install -D -m644 NVIDIA_Changelog "$pkgdir/usr/share/doc/nvidia/NVIDIA_Changelog"
    cp -r html "$pkgdir/usr/share/doc/nvidia/"
    ln -s nvidia "$pkgdir/usr/share/doc/nvidia-vulkan-utils"

    # new power management support
    install -D -m644 nvidia-suspend.service "$pkgdir/usr/lib/systemd/system/nvidia-suspend.service"
    install -D -m644 nvidia-hibernate.service "$pkgdir/usr/lib/systemd/system/nvidia-hibernate.service"
    install -D -m644 nvidia-resume.service "$pkgdir/usr/lib/systemd/system/nvidia-resume.service"
    install -D -m755 nvidia "$pkgdir/usr/lib/systemd/system-sleep/nvidia"
    install -D -m755 nvidia-sleep.sh "$pkgdir/usr/bin/nvidia-sleep.sh"

    # distro specific files must be installed in /usr/share/X11/xorg.conf.d
    install -D -m644 "$srcdir/nvidia-drm-outputclass.conf" "$pkgdir/usr/share/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf"

    install -Dm644 "$srcdir/nvidia-vulkan-utils.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

    create_links
}

package_lib32-opencl-nvidia-full-vulkan-all() {
    pkgdesc="OpenCL implemention for NVIDIA (32-bit)"
    depends=('lib32-zlib' 'lib32-gcc-libs')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=('lib32-opencl-driver' "lib32-opencl-nvidia=$pkgver")
    conflicts=('lib32-opencl-nvidia' 'lib32-opencl-nvidia-390xx')

    cd "$_pkg"/32

    # OpenCL
    install -D -m755 "libnvidia-compiler.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-compiler.so.$pkgver"
    install -D -m755 "libnvidia-opencl.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-opencl.so.$pkgver"

    create_links

    mkdir -p "$pkgdir/usr/share/licenses"
    ln -s lib32-nvidia-utils "$pkgdir/usr/share/licenses/lib32-opencl-nvidia-vulkan"
}

package_lib32-nvidia-utils-full-vulkan-all() {
    pkgdesc="NVIDIA drivers utilities (32-bit)"
    depends=('lib32-zlib' 'lib32-gcc-libs' 'lib32-libglvnd' 'nvidia-utils-full-vulkan-all')
    optdepends=('lib32-opencl-nvidia-full-vulkan-all')
    conflicts=('lib32-nvidia-utils' 'lib32-nvidia-libgl')
    provides=("lib32-nvidia-utils=$pkgver" 'lib32-vulkan-driver' 'lib32-opengl-driver' 'lib32-nvidia-libgl')
    replaces=('lib32-nvidia-libgl')

    cd "$_pkg"/32

    install -D -m755 "libGLX_nvidia.so.$pkgver" "$pkgdir/usr/lib32/libGLX_nvidia.so.$pkgver"

    # OpenGL libraries
    install -D -m755 "libEGL_nvidia.so.$pkgver" "$pkgdir/usr/lib32/libEGL_nvidia.so.$pkgver"
    install -D -m755 "libGLESv1_CM_nvidia.so.$pkgver" "$pkgdir/usr/lib32/libGLESv1_CM_nvidia.so.$pkgver"
    install -D -m755 "libGLESv2_nvidia.so.$pkgver" "$pkgdir/usr/lib32/libGLESv2_nvidia.so.$pkgver"

    # OpenGL core library
    install -D -m755 "libnvidia-glcore.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-glcore.so.$pkgver"
    install -D -m755 "libnvidia-eglcore.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-eglcore.so.$pkgver"
    install -D -m755 "libnvidia-glsi.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-glsi.so.$pkgver"

    # misc
    install -D -m755 "libnvidia-ifr.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-ifr.so.$pkgver"
    install -D -m755 "libnvidia-fbc.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-fbc.so.$pkgver"
    install -D -m755 "libnvidia-encode.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-encode.so.$pkgver"
    install -D -m755 "libnvidia-ml.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-ml.so.$pkgver"
    install -D -m755 "libnvidia-glvkspirv.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-glvkspirv.so.$pkgver"

    # Optical Flow
    install -D -m755 "libnvidia-opticalflow.so.$pkgver" -t "$pkgdir/usr/lib32"

    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.$pkgver" "$pkgdir/usr/lib32/vdpau/libvdpau_nvidia.so.$pkgver"

    # nvidia-tls library
    install -D -m755 "libnvidia-tls.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-tls.so.$pkgver"

    # CUDA
    install -D -m755 "libcuda.so.$pkgver" "$pkgdir/usr/lib32/libcuda.so.$pkgver"
    install -D -m755 "libnvcuvid.so.$pkgver" "$pkgdir/usr/lib32/libnvcuvid.so.$pkgver"

    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-ptxjitcompiler.so.$pkgver"

    # Fat (multiarchitecture) binary loader
    install -D -m755 "libnvidia-fatbinaryloader.so.$pkgver" "$pkgdir/usr/lib32/libnvidia-fatbinaryloader.so.$pkgver"

    create_links

    rm -rf "$pkgdir"/usr/{include,share,bin}
    mkdir -p "$pkgdir/usr/share/licenses"
    ln -s lib32-nvidia-utils "$pkgdir/usr/share/licenses/$pkgname"
}


