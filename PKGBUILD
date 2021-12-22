# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
#
# Integration of the nvidia-patch from keylase.
#
# This patch removes restriction on maximum number of simultaneous NVENC video encoding sessions imposed by Nvidia to consumer-grade GPUs.
# You can read more about it here: https://github.com/keylase/nvidia-patch
#
# Note: Even if you do not enable this option, the package will still install nvidia-patch
# and you can accept it at any time using the corresponding commands: nvidia-patch-nvenc and nvidia-patch-fbc.
#
# WARNING: In extreme cases, this can damage the NVENC and NvFBC libraries.
_nvidia_patch=

# This setting has a setting option for NVIDIA PowerMizer power management technology, and it is used by default even if you have not configured it.
#
# This technology supports two modes of frequency management: Adaptive Strategy and Static Strategy.
# Adaptive frequency management is used by default by the driver, and implies that if the GPU is not tasked, it is in power saving mode.
# If the GPU power becomes necessary, then it increases it to the required performance level.
# In other words, it jumps between performance levels. Within this technology, there are three levels (also called modes):
# 1 (0x1 bit) - Maximum performance
# 2 (0x2 bit) - Balance between performance and power saving
# 3 (0x3 bit) - Powersaving
# You can fix the frequencies at a certain performance level only with a static strategy.
# Now that we have the theory sorted out, you can choose what you want depending on your configuration:
#
# Possible values:
# 1 - Static strategy with maximum performance for AC operation and maximum power savings for the battery
# 2 - Static strategy with maximum performance for AC operation, but an adaptive strategy for battery operation.
# 3 - Adaptive strategy for AC operation, but static strategy with maximum power saving for the battery.
#
# Note: Setting up the PowerMizer circuitry is not overclocking the GPU and assumes safe use for your hardware.
# However, you can reassign the behavior of the power scheme through the Xorg option "RegistryDwords".
#
# Refrences: https://wins911.blogspot.com/2012/06/etcx11xorg.html
_powermizer_scheme=

# Enforces applying a certain performance level
# (see description of _powermizer_scheme option above for details),
# while activating some GPU overclocking possibilities, such as:
# controlling GPU fan speed via nvidia-settings.
#
# Possible values:
# 1 - Force a balance between performance and powersaving
# 2 - Force max performnace (recommended for gaming)
#
# These settings apply to all power sources,
# and cannot be configured for each one individually
# as _powermizer_scheme does.
#
# Warning: Works only for laptops.
_override_max_perf=

pkgname=nvidia-tweaks
pkgdesc="A collection of tweaks and improvements to the NVIDIA driver"
pkgver=495
pkgrel=3
license=('custom')
url='https://www.nvidia.com/'
depends=('NVIDIA-MODULE' 'nvidia-utils')
optdepends=('nvlax-git: alternative nvidia-patch'
            'nvidia-fake-powerd: Fix new bug in 495')
arch=('any')
source=('nvidia.conf'
        'nvidia-tweaks.hook'
        'nvidia-patch.install'
        'nvidia-patch.remove'
        '60-nvidia.rules'
        'https://raw.githubusercontent.com/keylase/nvidia-patch/master/patch-fbc.sh'
        'https://raw.githubusercontent.com/keylase/nvidia-patch/master/patch.sh')
sha256sums=('038b1170ac750b0dbcd59f2758e8fa12bc807e87b39c079c0396e33d0f83b37f'
            'e4a738f89b28d24283d65a04c975a863af88ea9caba90f80dd71e485d682170b'
            '81464bfeda86b9683a6f739a1cec1a2fe37717af5480671be70fe43f51fba420'
            'b4bde9eecd90fc9498a8d47c7bb7edfe877ae64ea9e7069c405710a76c749144'
            'c8fd71e3885b18c88c800cc9693112846d1889a008ae7dc6cbc9bb6fadd67ec6'
            'SKIP'
            'SKIP')

prepare() {
    registrydwords='EnableBrightnessControl=1'
    if [ ! -z $_powermizer_scheme ] && [ -z $_override_max_perf ]; then
        echo "You have selected the powermizer scheme: $_powermizer_scheme"
        echo "If you don't like it in time you can change it with the Xorg "RegistryDwords" option (in the bit value)"
        echo "or rebuild it with the new value."
        if [ "$_powermizer_scheme" = "1" ]; then
            registrydwords+=';PowerMizerEnable=0x1;PerfLevelSrc=0x2222;PowerMizerDefault=0x3;PowerMizerDefaultAC=0x1'
        elif [ "$_powermizer_scheme" = "2" ]; then
            registrydwords+=';PowerMizerEnable=0x1;PerfLevelSrc=0x2233;PowerMizerDefault=0x3'
        elif [ "$_powermizer_scheme" = "3" ]; then
            registrydwords+=';PowerMizerEnable=0x1;PerfLevelSrc=0x2233;PowerMizerDefault=0x3'
	else
            echo "You have selected the wrong powermizer scheme, please reread the option description in PKGBUILD."
        fi
    fi

    if [ ! -z $_override_max_perf ] && [ -z $_powermizer_scheme ]; then
        echo "You have selected the forced performance level: $_override_max_perf"
        echo "If you don't like it in time you can change it with the Xorg "OverrideMaxPerf" option (in the bit value)"
        echo "or rebuild it with the new value."
        if [ "$_override_max_perf" = "1" ]; then
	    registrydwords+=';OverrideMaxPerf=0x2'
        elif [ "$_override_max_perf" = "2" ]; then
	    registrydwords+=';OverrideMaxPerf=0x3'
        else
            echo "You selected the wrong value for the performance level forcing. Please reread the option description in PKGBUILD."
        fi
    fi

    sed -i "s/__REGISTRYDWORDS/\"${registrydwords}\"/" "${srcdir}/nvidia.conf"
}

package() {
    install -Dm644 nvidia.conf "${pkgdir}/usr/lib/modprobe.d/90-${pkgname}.conf"
    install -Dm644 nvidia-tweaks.hook -t "${pkgdir}/usr/share/libalpm/hooks"
    install -Dm755 patch.sh "${pkgdir}/usr/bin/nvidia-patch-nvenc"
    install -Dm755 patch-fbc.sh "${pkgdir}/usr/bin/nvidia-patch-fbc"

    if [ ! -z $_nvidia_patch ]; then
      install -Dm644 nvidia-patch.install "${pkgdir}/usr/share/libalpm/hooks/nvidia-patch-install.hook"
      install -Dm644 nvidia-patch.remove "${pkgdir}/usr/share/libalpm/hooks/nvidia-patch-remove.hook"
    fi

    # Potentially fixes the loading of the nvidia-uvm module
    install -Dm644 <(printf '%s' 'nvidia-uvm') \
        "${pkgdir}/etc/modules-load.d/${pkgname}.conf"

    # udev rules for node presence and runtime PM
    # Fixes https://github.com/HansKristian-Work/vkd3d-proton/issues/711
    install -Dm644 60-nvidia.rules "${pkgdir}/usr/lib/udev/rules.d/71-nvidia.rules"
}
