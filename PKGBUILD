pkgname=nvidia-e531
groups=('ThinkPad-E531')
pkgver=352.21
_extramodules=extramodules-4.1-e531
pkgrel=4
pkgdesc="NVIDIA drivers for linux-E531"
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('linux-e531>=4.1' "nvidia-utils=$pkgver" 'libgl')
makedepends=('linux-e531-headers>=4.1')
provides=('nvidia')
license=('custom')
install=nvidia-e531.install
options=(!strip)
source=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('cfccf25135bf5c33f68eb892e341b35126f6561f257b32893ccd055d624964eb')

[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh ${_pkg}.run --extract-only
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}/kernel"
    make SYSSRC=/usr/lib/modules/${_kernver}/build module

    cd uvm
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
      "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/nvidia.ko"

    install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
  
    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/kernel/drivers/video/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-E531.conf"
    echo "blacklist nvidiafb" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-E531.conf"
    install -D -m644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/nvidia-E531/LICENSE"
}
