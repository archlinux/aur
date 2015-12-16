# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=nvidia-think
pkgver=355.11
_extramodules=extramodules-4.3-think
pkgrel=2
pkgdesc="NVIDIA drivers for linux-think kernel"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-think>=4.3' 
	 'linux-think<4.4'
   	 'nvidia-utils>=355.11' 
	 'libgl')
makedepends=('linux-think-headers>=4.3')
license=('custom')
install=nvidia.install
options=(!strip)
source=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
        "ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
	"linux-4.3.patch")

md5sums=('16d143ccafe99328a2ca8e5a396fd4bc'
         '30133d89690f4683c4e289ec6c0247dc'
	 'aa67d0687c8ce2de5adda8d0faae32f3')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    # patches here
    pwd
    patch -p1 -i "linux-4.3.patch"
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
    #if [[ "$CARCH" = "x86_64" ]]; then
    #    cd uvm
    #    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
    #fi	
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
    #echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
}
