# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=nvidia-pae
pkgver=355.11
_extramodules=extramodules-4.2-pae
pkgrel=1
pkgdesc="NVIDIA drivers for linux-pae"
arch=('i686')
url="http://www.nvidia.com/"
depends=('linux-pae>=4.2' 'linux-pae<4.3' 'nvidia-libgl' "nvidia-utils=${pkgver}")
makedepends=('linux-pae-headers>=4.2' 'linux-pae-headers<4.3')
conflicts=('nvidia-96xx' 'nvidia-173xx')
license=('custom')
install=nvidia.install
options=(!strip)

source=("nv-drm.patch" "ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
md5sums=('2365f1405f0c7bbb8f8cd7ebd5e4e301'
         '16d143ccafe99328a2ca8e5a396fd4bc')
_pkg="NVIDIA-Linux-x86-${pkgver}"

prepare() {
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}"
  # patches here
  #patch -Np0 -i "$srcdir/nv-drm.patch"
}

build() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cd "${_pkg}/kernel"
  make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
  install -d -m755 "${pkgdir}/etc/modprobe.d"
  echo "blacklist nouveau" >> "${pkgdir}/etc/modprobe.d/nouveau_blacklist-pae.conf"
  sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia.install"
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
}
