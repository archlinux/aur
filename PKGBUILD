# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Contributor: Dan Vratil
# Contributor: Jeremy Sands
# Contributor: Erik Hardesty
# Contributor: josephgbr
# Based on [multilib]'s lib32-nvidia-utils: https://www.archlinux.org/packages/multilib/x86_64/lib32-nvidia-utils/

pkgbase=lib32-nvidia-utils-beta
pkgname=('lib32-nvidia-utils-beta' 'lib32-nvidia-libgl-beta' 'lib32-opencl-nvidia-beta')
pkgver=415.25
pkgrel=1
pkgdesc='NVIDIA driver utilities and libraries (beta version) (32-bit)'
arch=('x86_64')
url='https://www.nvidia.com/'
makedepends=('nvidia-libgl-beta')  # to avoid conflict during installation in the build chroot
license=('custom:NVIDIA')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run")
sha256sums=('64b65b8923d15e2566ed2ab6a4a65b21c45445bdd028ec0091c9b509a51e9349')

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
}

package_lib32-opencl-nvidia-beta() {
    pkgdesc="NVIDIA's OpenCL implemention for 'lib32-nvidia-utils-beta'"
    depends=('lib32-zlib' 'lib32-gcc-libs')
    optdepends=('opencl-headers: headers necessary for OpenCL development')
    provides=("lib32-opencl-nvidia=${pkgver}" 'lib32-opencl-driver')
    conflicts=('lib32-opencl-nvidia')
    
    cd "${_pkg}/32"
    
    # libraries
    install -D -m755 "libnvidia-compiler.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-opencl.so.${pkgver}"   -t "${pkgdir}/usr/lib32"
    _create_links
    
    # license
    cd "${srcdir}/${_pkg}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_lib32-nvidia-libgl-beta() {
    pkgdesc="NVIDIA driver library symlinks for 'lib32-nvidia-utils-beta'"
    depends=('lib32-nvidia-utils-beta' 'nvidia-libgl-beta')
    provides=("lib32-nvidia-libgl=${pkgver}" 'lib32-libgl' 'lib32-libegl' 'lib32-libgles')
    conflicts=('lib32-nvidia-libgl' 'lib32-libgl' 'lib32-libegl' 'lib32-libgles')
    replaces=('lib32-nvidia-utils<=313.26-1')
    
    cd "$_pkg"
    
    mkdir -p "${pkgdir}/usr/lib32/"
    
    # libGL (link)
    ln -s /usr/lib32/nvidia/libGL.so.1.7.0 "${pkgdir}/usr/lib32/libGL.so.1"
    ln -s libGL.so.1 "${pkgdir}/usr/lib32/libGL.so"
    
    # EGL (link)	
    ln -s /usr/lib32/nvidia/libEGL.so.1.1.0 "${pkgdir}/usr/lib32/libEGL.so.1"
    ln -s libEGL.so.1 "${pkgdir}/usr/lib32/libEGL.so"
    
    # OpenGL ES 1 (link)
    ln -s /usr/lib32/nvidia/libGLESv1_CM.so.1.2.0 "${pkgdir}/usr/lib32/libGLESv1_CM.so.1"
    ln -s libGLESv1_CM.so.1 "${pkgdir}/usr/lib32/libGLESv1_CM.so"
    
    # OpenGL ES 2 (link)
    ln -s /usr/lib32/nvidia/libGLESv2.so.2.1.0 "${pkgdir}/usr/lib32/libGLESv2.so.2"
    ln -s libGLESv2.so.2 "${pkgdir}/usr/lib32/libGLESv2.so"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_lib32-nvidia-utils-beta() {
    pkgdesc='NVIDIA driver utilities and libraries (beta version) (32-bit)'
    depends=('lib32-zlib' 'lib32-gcc-libs' 'nvidia-utils-beta' 'lib32-mesa>=17.0.2-1')
    optdepends=('lib32-opencl-nvidia-beta: OpenCL support')
    provides=("lib32-nvidia-utils=${pkgver}" 'lib32-libglvnd' 'lib32-vulkan-driver')
    conflicts=('lib32-nvidia-utils' 'lib32-libglvnd')
    
    cd "${_pkg}/32"
    
    # libGL & OpenGL
    install -D -m755  libGL.so.1.7.0                    -t "${pkgdir}/usr/lib32/nvidia"
    install -D -m755  libGLdispatch.so.0                -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-glcore.so.${pkgver}"    -t "${pkgdir}/usr/lib32"
    install -D -m755  libOpenGL.so.0                    -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-glvkspirv.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # GLX
    install -D -m755  libGLX.so.0                 -t "${pkgdir}/usr/lib32"
    install -D -m755 "libGLX_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    # now in lib32-mesa driver
    #ln -s "libGLX_nvidia.so.${pkgver}" "${pkgdir}/usr/lib32/libGLX_indirect.so.0"
    
    # EGL
    install -D -m755  libEGL.so.1.1.0                 -t "${pkgdir}/usr/lib32/nvidia"
    install -D -m755 "libEGL_nvidia.so.${pkgver}"     -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-eglcore.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # OpenGL ES
    install -D -m755  libGLESv1_CM.so.1.2.0             -t "${pkgdir}/usr/lib32/nvidia"
    install -D -m755 "libGLESv1_CM_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    install -D -m755  libGLESv2.so.2.1.0                -t "${pkgdir}/usr/lib32/nvidia"
    install -D -m755 "libGLESv2_nvidia.so.${pkgver}"    -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-glsi.so.${pkgver}"      -t "${pkgdir}/usr/lib32"
    
    # VDPAU (Video Decode and Presentation API for Unix)
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" -t "${pkgdir}/usr/lib32/vdpau"
    
    # GPU-accelerated video encoding
    install -D -m755 "libnvidia-encode.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # CUDA (Compute Unified Device Architecture) (perform traditional CPU calculations with the GPU)
    install -D -m755 "libcuda.so.${pkgver}"    -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvcuvid.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # PTX JIT Compiler (Parallel Thread Execution (PTX) is a pseudo-assembly language for CUDA)
    install -D -m755 "libnvidia-ptxjitcompiler.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # Fat (multiarchitecture) binary loader
    install -D -m755 "libnvidia-fatbinaryloader.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # TLS (Thread local storage) support for OpenGL libs
    install -D -m755 "libnvidia-tls.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # GPU monitoring and management
    install -D -m755 "libnvidia-ml.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    # helper libs for approved partners GRID remote apps
    install -D -m755 "libnvidia-ifr.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    install -D -m755 "libnvidia-fbc.so.${pkgver}" -t "${pkgdir}/usr/lib32"
    
    _create_links
    
    # license
    cd "${srcdir}/${_pkg}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
