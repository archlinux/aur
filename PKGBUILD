# Maintainer : Bjoern Bidar - theodorstormgrade@gmail.com
     
pkgname=nvidia-pf
pkgver=440.82
pkgrel=6
_goodkver=5.7
_badkver=5.8
_modver=${_goodkver}-pf
_extramodules=extramodules-$_modver
#_pf_headers=$(pacman -Qqo ${_SYSSRC})

pkgdesc="NVIDIA drivers for linux-pf."
arch=('x86_64')
url="http://www.nvidia.com/"
makedepends=("linux-pf-headers>=${_goodkver}" "linux-pf-headers<${_badkver}")
depends=("linux-pf>=${_goodkver}" "linux-pf<${_badkver}" "nvidia-utils=${pkgver}")

conflicts=( 'nvidia-96xx' 'nvidia-173xx' 'nvidia-pf-core2' 'nvidia-pf-k8'
  'nvidia-pf-atom' 'nvidia-pf-psc' 'nvidia-pf-p4' 'nvidia-pf-p3'
 'nvidia-pf-pm' 'nvidia-pf-k7')
provides=('NVIDIA-MODULE')
license=('custom')
options=(!strip)
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
       'nvidia-kernel-5.7.patch')
md5sums=('abc45d506515bde8f9efad90bf54f796'
         '8b0b4fd32275a4745d55ea391f23a43e')



[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare()
{
  cd "${srcdir}"
  [[ -d "${_pkg}" ]] && rm -rf "${_pkg}"
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"
  # patches here
  patch -Np1 -i "${srcdir}/nvidia-kernel-5.7.patch"
}

build() {
  _kernver="$(</usr/src/linux-pf/version)"
  cd "${_pkg}"/kernel
  make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}


package() {
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
          "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
          "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-modeset.ko"
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-drm.ko" \
         "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-drm.ko"


  if [[ "$CARCH" = "x86_64" ]]; then
      install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
              "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
  fi

  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
  install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
 
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-pf.conf"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

