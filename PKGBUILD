# Maintainer : Bjoern Bidar - theodorstormgrade@gmail.com
     
pkgname=nvidia-pf
pkgver=495.46
pkgrel=2
_goodkver=5.15
_badkver=5.16
_modver=${_goodkver}-pf
_extramodules=extramodules-$_modver
#_pf_headers=$(pacman -Qqo ${_SYSSRC})

pkgdesc="NVIDIA drivers for linux-pf."
arch=('x86_64')
url="http://www.nvidia.com/"
makedepends=("linux-pf-headers>=${_goodkver}" "linux-pf-headers<${_badkver}" 'pahole')
depends=("linux-pf>=${_goodkver}" "linux-pf<${_badkver}" "nvidia-utils=${pkgver}")

conflicts=( 'nvidia-96xx' 'nvidia-173xx' 'nvidia-pf-core2' 'nvidia-pf-k8'
  'nvidia-pf-atom' 'nvidia-pf-psc' 'nvidia-pf-p4' 'nvidia-pf-p3'
 'nvidia-pf-pm' 'nvidia-pf-k7')
provides=('NVIDIA-MODULE')
license=('custom')
options=(!strip)
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
       )
md5sums=('2b483f1741707c868e1c5c05e4401aa7')





[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare()
{
  cd "${srcdir}"
  [[ -d "${_pkg}" ]] && rm -rf "${_pkg}"
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"
  # patches here
}

build() {
  _kernver="$(</usr/src/linux-pf/version)"
  cd "${_pkg}"/kernel
  make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}


package() {
  _kernver="$(</usr/src/linux-pf/version)"
  _extradir="/usr/lib/modules/${_kernver}/extramodules"
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
          "${pkgdir}/${_extradir}/nvidia.ko"
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
          "${pkgdir}/${_extradir}/nvidia-modeset.ko"
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-drm.ko" \
          "${pkgdir}/${_extradir}/nvidia-drm.ko"


  if [[ "$CARCH" = "x86_64" ]]; then
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
            "${pkgdir}/${_extradir}/nvidia-uvm.ko"
  fi

  # compress each module individually
  find "$pkgdir" -name '*.ko' -exec xz -T1 {} +
  install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
  
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-pf.conf"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}

