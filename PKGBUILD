# Maintainer: Vasiliy Stelmachenok <cabopust@yandex.ru>
# Contributor: Pavel Priluckiy <gerallitluis2@gmail.com>

# Sets the "Prefer Maximum Performance" mode in the NVIDIA Settings at system startup.
_pref_maximum_performance=

pkgname=nvidia-dkms-performance
pkgver=460.32.03
pkgrel=2
pkgdesc='NVIDIA driver sources for linux with some optimizations'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom')
provides=("nvidia=${pkgver}" "nvidia-dkms=${pkgver}" 
          "nvidia-dkms-performance=${pkgver}" 'NVIDIA-MODULE')
conflicts=('nvidia' 'nvidia-dkms')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        'nvidia.hook'
        'multithreaded-optimizations-opengl'
        'nvidia-settings-performance.desktop'
        'nvidia-dkms-conf.patch'
        'linux-rt.patch'
        'nvidia-drm-modeset.patch'
        'NVreg.patch')
sha256sums=('45aa9d75e8d463d87dcf7ea78a1ea046b9ddc2e159dfab6e861cbf833e6b14cf'
            '717920f48b4d7ec50b83d2d096bab36449b30f1b5d144f0fe586627025367293'
            '1237c8270cd4e3ae64f83642fe49f230190c247e5bd0ec0783183fc51c015382'
            '28635a9b0808beebff7e7905ee3e664d895fe23e149d462397c0b429c6f7d091'
            'c84a4158083600191da80c22da146505f89d03374b3e0a5f71f8f2df6ad88004'
            'f1da48d4e1aa2854f33d181ea56357cf0a88788a051d4b65afab14cdbbebedfa'
            'a9465149c336c8f0bded15a4d473f16156d6da3a9fe4965ebe8a9afba5519c9f'
            'd24e341f9a0e38f03f4e425e5f59e407604463fc3daee36009ecbd0fefa8b801')

prepare() {
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    
    patch -Np1 -i "${srcdir}/nvidia-dkms-conf.patch"
    # Fixing compatibility with the RT (Real-Time) kernel
    patch -Np1 -i "${srcdir}/linux-rt.patch"
    # This patch edits the default values of the NVIDIA kernel module parameters, 
    # and makes the following changes:
    #
    # NVreg_UsePageAttributeTable=1 (Default 0) - Activating the better memory management method (PAT). 
    # The PAT method creates a partition type table at a specific address mapped inside the register
    # and utilizes the memory architecture and instruction set more efficiently and faster.
    # If your system can support this feature, it should improve CPU performance. 
    #
    # NVreg_EnablePCIeGen3=1 (Default 0) - Enable PCIe Gen 3.x support. 
    # If the system supports this 8GT high speed bus then enable it with this module option flag.
    # By default the Nvidia driver is set to use PCIe Gen 2.x for compatibility reasons.
    #
    # NVreg_InitializeSystemMemoryAllocations=0 (Default 1) - Disables clearing system memory allocation
    # before using it for the GPU. Potentially improves performance, but at the cost of increased security risks.
    # Write "options nvidia NVreg_InitializeSystemMemoryAllocations=1" in /etc/modprobe.d/nvidia.conf, 
    # if you want to return the default value.
    #
    # NVreg_EnableStreamMemOPs=1 (Default 0) - Activates the support for CUDA Stream Memory Operations in user-mode applications.
    # Note: May be disabled in future versions.
    # 
    # If you want to learn more about the NVIDIA driver module parameters, 
    # you can go to the Gentoo Wiki or view the source code of the nv-reg.h file.
    patch -Np1 -i "${srcdir}/NVreg.patch"
    # Enable nvidia-drm.modeset=1 (DRM KMS) by default.
    # This is necessary for NVIDIA PRIME to work correctly.
    # Note: May cause problems with scaling in console mode.
    patch -Np1 -i "${srcdir}/nvidia-drm-modeset.patch"
}

package() {
    depends=('dkms' "nvidia-utils>=${pkgver}" 'nvidia-settings' 'libglvnd')

    # Nvidia hook for update initramfs after an NVIDIA driver upgrade
    install -D -m644 "${srcdir}/nvidia.hook" -t "${pkgdir}/usr/share/libalpm/hooks"

    mkdir -p "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_pkg}/kernel" "${pkgdir}/usr/src/nvidia-${pkgver}"

    # Block Nouveau
    install -D -m644 <(printf '%s\n%s\n' 'blacklist nouveau' 'options nouveau modeset=0') \
        "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"

    # Enable multi-threaded OpenGL optimizations (env __GL_THREADED_OPTIMIZATIONS=1) by default for all applications.
    # Note: If you encounter an application that is incompatible with these optimizations,
    # please use the __GL_THREADED_OPTIMIZATIONS=0 environment variable.
    install -D -m644 "${srcdir}/multithreaded-optimizations-opengl" -t "${pkgdir}/etc/nvidia/nvidia-application-profiles-rc.d"

    if [ -n "$_pref_maximum_performance" ]; then
    	install -D -m644 "${srcdir}/nvidia-settings-performance.desktop" -t "${pkgdir}/etc/xdg/autostart"
    fi

    # license
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}