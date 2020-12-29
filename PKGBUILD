# Maintainer: Fabian Bornschein <plusfabi-cat-gmail-dog-com>

pkgbase="preconf-intel-nvidia-prime-render-offloading"
pkgname=("preconf-intel-nvidia-prime-render-offloading-common"
        "preconf-intel-nvidia-prime-render-offloading-linux"
        "preconf-intel-nvidia-prime-render-offloading-linux-dkms"
        "preconf-intel-nvidia-prime-render-offloading-linux-lts"
        "preconf-intel-nvidia-prime-render-offloading-linux-zen"
)
pkgver=1.1
pkgrel=1
makedepends=("git")
url="https://gitlab.com/fabis_cafe/preconf-intel-nvidia-prime-render-offloading"
arch=('x86_64')
license=('GPL3')
_commit=cb1fc7cfc9704f49549a97a34ce9c55c9ff8c1b8  # tags/1.1
source=("git+https://gitlab.com/fabis_cafe/preconf-intel-nvidia-prime-render-offloading.git/#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
    cd preconf-intel-nvidia-prime-render-offloading
    git describe --tags | sed 's/-/+/g'
}

package_preconf-intel-nvidia-prime-render-offloading-common(){
    pkgdesc="common files for an intel-nvidia prime system"
    depends=("nvidia-prime" "nvidia-settings" "nvidia-utils" "opencl-nvidia" "lib32-nvidia-utils" "lib32-opencl-nvidia")
    optdepends=(
        "preconf-intel-nvidia-prime-render-offloading-linux: Configuration for default Arch Kernel"
        "preconf-intel-nvidia-prime-render-offloading-linux-zen: Configuration for ZEN Kernel"
        "preconf-intel-nvidia-prime-render-offloading-linux-lts: Configuration for LTS Kernel"
        "preconf-intel-nvidia-prime-render-offloading-linux-dkms: Generic Kernel, DKMS Configuration")

    cd "${srcdir}/${pkgbase}"
    ## Drivers load up on boot
    install -Dm 644 "${srcdir}/${pkgbase}/71-kmod-intel.conf" "${pkgdir}/usr/lib/modules-load.d/71-kmod-intel.conf"
    install -Dm 644 "${srcdir}/${pkgbase}/71-kmod-nvidia.conf" "${pkgdir}/usr/lib/modules-load.d/71-kmod-nvidia.conf"
    ## Blacklist and PWM options
    install -Dm 644 "${srcdir}/${pkgbase}/71-kmod-nouveau-blacklist.conf" "${pkgdir}/usr/lib/modprobe.d/71-kmod-nouveau-blacklist.conf"
    install -Dm 644 "${srcdir}/${pkgbase}/71-kmod-nvidia-pwm.conf" "${pkgdir}/usr/lib/modprobe.d/71-kmod-nvidia-pwm.conf"
    ## udev rules
    install -Dm 644 "${srcdir}/${pkgbase}/90-nvidia-prime-powermanagement.rules" "${pkgdir}/usr/lib/udev/rules.d/90-nvidia-prime-powermanagement.rules"
    ## ALPM Hook
    install -Dm 644 "${srcdir}/${pkgbase}/71-nvidia-mkinitcpio.hook" "${pkgdir}/usr/share/libalpm/hooks/71-nvidia-mkinitcpio.hook"
}

package_preconf-intel-nvidia-prime-render-offloading-linux(){
    pkgdesc="configures an intel-nvidia prime system for linux"
    depends=("linux" "nvidia" "preconf-intel-nvidia-prime-render-offloading-common")
    install=install_kernel
}

package_preconf-intel-nvidia-prime-render-offloading-linux-dkms(){
    pkgdesc="configures an intel-nvidia prime system with dkms"
    depends=("nvidia-dkms" "preconf-intel-nvidia-prime-render-offloading-common")
    install=install_dkms
}

package_preconf-intel-nvidia-prime-render-offloading-linux-lts(){
    pkgdesc="configures an intel-nvidia prime system for linux-lts"
    depends=("linux-lts" "nvidia-lts" "preconf-intel-nvidia-prime-render-offloading-common")
    install=install_kernel
}

package_preconf-intel-nvidia-prime-render-offloading-linux-zen(){
    pkgdesc="configures an intel-nvidia prime system for linux-zen"
    depends=("linux-zen" "linux-zen-headers" "nvidia-dkms" "preconf-intel-nvidia-prime-render-offloading-common")
    install=install_kernel
}
