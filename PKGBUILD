# Maintainer: nemesys <nemstar AT zoho DOT com>
# Contributor: wuyingren <keitaroh@gmail.com>
# Contributor : Thomas Baechler <thomas@archlinux.org>
# Adapted for fbcondecor by: Conrad Nelson

pkgname=nvidia-fbcondecor
pkgver=349.16
_extramodules=extramodules-3.18-fbcondecor
pkgrel=2
pkgdesc="NVIDIA drivers for linux-fbcondecor."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-fbcondecor>=4.0' 'linux-fbcondecor<4.1' "nvidia-libgl" "nvidia-utils=${pkgver}")
makedepends=('linux-fbcondecor-headers>=4.0' 'linux-fbcondecor-headers<4.1')
conflicts=('nvidia-340xx-ck' 'nvidia-304xx-ck' 'nvidia-275xx-ck' 'nvidia-319-ck' 'nvidia-96xx-ck' 'nvidia-beta-ck' 'nvidia-ck' 'nvidia-ck-atom' 'nvidia-ck-barcelona' 'nvidia-ck-bulldozer' 'nvidia-ck-corex' 'nvidia-ck-core2' 'nvidia-ck-haswell' 'nvidia-ck-ivybridge' 'nvidia-ck-kx' 'nvidia-ck-k10' 'nvidia-ck-nehalem' 'nvidia-ck-p4' 'nvidia-ck-piledriver' 'nvidia-ck-pentm' 'nvidia-ck-sandybridge' 'nvidia-304xx-ck-atom' 'nvidia-304xx-ck-barcelona' 'nvidia-304xx-ck-corex' 'nvidia-304xx-ck-core2' 'nvidia-304xx-ck-haswell' 'nvidia-304xx-ck-ivybridge' 'nvidia-304xx-ck-kx' 'nvidia-304xx-ck-k10' 'nvidia-304xx-ck-nehalem' 'nvidia-304xx-ck-p4' 'nvidia-304xx-ck-piledriver' 'nvidia-304xx-ck-pentm' 'nvidia-304xx-ck-sandybridge' 'nvidia-340xx-ck-atom' 'nvidia-340xx-ck-barcelona' 'nvidia-340xx-ck-bulldozer' 'nvidia-340xx-ck-core2' 'nvidia-340xx-ck-haswell' 'nvidia-340xx-ck-ivybridge' 'nvidia-340xx-ck-kx' 'nvidia-340xx-ck-k10' 'nvidia-340xx-ck-nehalem' 'nvidia-340xx-ck-p4' 'nvidia-340xx-ck-piledriver' 'nvidia-340xx-ck-pentm' 'nvidia-340xx-ck-sandybridge')
# conflicts=('nvidia-96xx' 'nvidia-173xx')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=nvidia-fbcondecor.install
options=(!strip)
source=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
        "ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums=('59597d5dfaaf0fc83a5e78d29a97ccac'
         '3e04208affde8c35a8b96975eec0486b')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
}

build() {
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	cd "${_pkg}"/kernel
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module

    if [[ "$CARCH" = "x86_64" ]]; then
	cd uvm
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
fi
}

package() {
	install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
}
