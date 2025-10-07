# Maintainer: Philippe Schenker <dev@pschenker.ch>

name=ixxat-socketcan
pkgname="${name}-dkms"
pkgver=2.0.520
pkgrel=5
pkgdesc="DKMS SocketCAN driver for IXXAT USB-to-CAN v2"
arch=("i686" "x86_64")
url="https://www.hms-networks.com/support/general-downloads"
license=("GPL2")
optdepends=("can-utils: Linux-CAN / SocketCAN user space applications")
depends=("dkms")
source=("https://hmsnetworks.blob.core.windows.net/nlw/docs/default-source/products/ixxat/monitored/pc-interface-cards/socketcan-linux.gz?sfvrsn=3eb48d7_89&download=true"
        "makefile_use_kernelrelease_variable_insead_of_uname_r.patch"
        "dkms.conf"
        "0001-ixxat_usb-Fix-for-new-can_priv-naming.patch")
sha256sums=("dd34dfb4e1c988693c2b6799c467ba7689758c9757fa8e8e4890fa7715b818b6"
            "ddc8a7d67e9c1490d9dc4c1f434b8832969d84ff6ea796e5b3a2ad196e3cf80d"
            "1a7f4502869171cc1dc617e670f018309af1a7bd0a352108002c75a55bb3016c"
            "526358675a7edad14f84ef0a78c29cf3628e2831a975fd3f709ad0107f2be518")

prepare() {
  local kernel_ver=$(pacman -Q linux | awk '{print $2}' | cut -d- -f1)

  mkdir -p "${srcdir}/${name}-${pkgver}"
  cd "${srcdir}/${name}-${pkgver}"
  tar xzfv "../ix_usb_can_2.0.520-REL.tgz"
  cp ../dkms.conf .
  sed "s/@PKGVER@/${pkgver}/" -i dkms.conf
  sed "s/@PKGNAME@/${name}/" -i dkms.conf
  patch -p 1 -i ../makefile_use_kernelrelease_variable_insead_of_uname_r.patch

  if [[ $(vercmp "$kernel_ver" "6.17") -ge 0 ]]; then
    patch -p 1 -i ../0001-ixxat_usb-Fix-for-new-can_priv-naming.patch
  fi
}

package() {
  dkmsdir="${pkgdir}/usr/src/${name}-${pkgver}/"
  install -d "${dkmsdir}"
  cp -a "${srcdir}/${name}-${pkgver}/." "${dkmsdir}"
}
