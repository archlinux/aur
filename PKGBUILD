# Maintainer: Vasiliy Stelmachenok <cabopust@yandex.ru>
# Contributor: Pavel Priluckiy <gerallitluis2@gmail.com>

# Includes application of the Powermizer-max-performance.patch
# USE AT YOUR OWN RISK!
_pref_maximum_performance=

pkgname=nvidia-dkms-performance
pkgver=465.24.02
pkgrel=1
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
        '0001-nvidia-dkms-conf.patch'
        '0002-linux-rt.patch'
        '0003-nvidia-drm-modeset.patch'
        '0004-NVreg.patch'
        '0005-Powermizer-max-performance.patch')
sha256sums=('a1f6c50de475a5b9dda10285d9ff1eaafe921c640038e47249ac7839ee94ad6d'
            '717920f48b4d7ec50b83d2d096bab36449b30f1b5d144f0fe586627025367293'
            '94066f2ed8c8ba9cfc74e8f12a167a84d641f10e01c0d63106f4fa97f7b17c37' 
            '18b7e1cf21834a646d5b6a7cf49daae5d55bc7e1f23fd5a96e05a8aa4a74de57'
            'a9465149c336c8f0bded15a4d473f16156d6da3a9fe4965ebe8a9afba5519c9f'
            'b33bae527d7e8e1056151ddf0afb6c0c934092b2faad0fe053e363cb349c2a9e'
            '16e4d4349f2cb2684900bdf7ddcbbc543be2760c0e42efab92d429b2204def6c')

prepare() {
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    
    patch -Np1 -i "${srcdir}/0001-nvidia-dkms-conf.patch"
    # Fixing compatibility with the RT (Real-Time) kernel
    sed -i -e 's|PREEMPT_RT_PRESENT=1|PREEMPT_RT_PRESENT=0|g' kernel/conftest.sh
    patch -Np1 -i "${srcdir}/0002-linux-rt.patch"
    # Enable nvidia-drm.modeset=1 (DRM KMS) by default.
    # This is necessary for NVIDIA PRIME to work correctly.
    # Note: May cause problems with scaling in console mode.
    patch -Np1 -i "${srcdir}/0003-nvidia-drm-modeset.patch"
    # This patch edits the default values of the NVIDIA kernel module
    # parameters, and makes the following changes:
    #
    # NVreg_UsePageAttributeTable=1 (Default 0) - Activating the better
    # memory management method (PAT). The PAT method creates a partition type table
    # at a specific address mapped inside the register and utilizes the memory architecture
    # and instruction set more efficiently and faster.
    # If your system can support this feature, it should improve CPU performance.
    #
    # NVreg_EnablePCIeGen3=1 (Default 0) - Enable PCIe Gen 3.x support.
    # If the system supports this 8GT high speed bus then enable it with this module option flag.
    # By default the Nvidia driver is set to use PCIe Gen 2.x for compatibility reasons.
    #
    # NVreg_InitializeSystemMemoryAllocations=0 (Default 1) - Disables
    # clearing system memory allocation before using it for the GPU.
    # Potentially improves performance, but at the cost of increased security risks.
    # Write "options nvidia NVreg_InitializeSystemMemoryAllocations=1" in /etc/modprobe.d/nvidia.conf,
    # if you want to return the default value.
    #
    # NVreg_EnableStreamMemOPs=1 (Default 0) - Activates the support for
    # CUDA Stream Memory Operations in user-mode applications.
    # 
    # If you want to learn more about the NVIDIA driver module parameters,
    # you can go to the Gentoo Wiki or view the source code of the nv-reg.h file.
    patch -Np1 -i "${srcdir}/0004-NVreg.patch"
    # Sets the default power plan in preference to maximum
    # performance. This is similar to the power plan settings in nvidia-
    # settings. The advantage of this method is that it controls the power
    # plan for each power source, i.e. the driver will be set for maximum
    # performance when running from the mains and for the battery it
    # will be set for optimal power savings. It also does not require nvidia-
    # settings as a dependency and does not use it in any way.
    if [ -n "$_pref_maximum_performance" ]; then
        patch -Np1 -i "${srcdir}/0005-Powermizer-max-performance.patch"
    fi
}

package() {
    depends=('dkms' "nvidia-utils=${pkgver}" 'libglvnd')

    # Nvidia hook for update initramfs after an NVIDIA driver upgrade
    install -D -m644 "${srcdir}/nvidia.hook" -t "${pkgdir}/usr/share/libalpm/hooks"

    mkdir -p "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_pkg}/kernel" "${pkgdir}/usr/src/nvidia-${pkgver}"

    # Block Nouveau
    install -D -m644 <(printf '%s\n%s\n' 'blacklist nouveau' 'options nouveau modeset=0') \
        "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

    # license
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
