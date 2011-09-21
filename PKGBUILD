pkgname=linux-linode
_kernelname=-linode
_basekernel=3.0
pkgver=${_basekernel}.4
pkgrel=2
arch=(x86_64)
url="http://www.kernel.org/"
license=(GPL2)
makedepends=(xmlto docbook-xsl)
options=('!strip')
source=("http://ftp.nluug.nl/pub/os/Linux/system/kernel/v3.0/linux-${pkgver}.tar.bz2"
        'config.x86_64'
        'menu.lst'
        "${pkgname}.preset"
        'change-default-console-loglevel.patch')
md5sums=('dff86c657cabe813bda84c72bfb93ae8'
         'a4ebddd66e0697c30e223ab5040243f1'
			'7fc8bdda8379469552523e9296dc3799'
         'ee66f3cd0c5bc0ba0f65499784d19f30'
         '9d3c56a4b999c8bfbd4018089a62f662')
pkgdesc="The Linux Kernel and modules"
depends=('coreutils' 'linux-firmware' 'module-init-tools>=3.16' 'mkinitcpio>=0.7')
provides=(kernel26 linux)
conflicts=(kernel26 linux)
replaces=(kernel26 linux)
backup=(etc/mkinitcpio.d/${pkgname}.preset)
install=${pkgname}.install

build() {
  cd "${srcdir}/linux-${pkgver}"
  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"
  cp "${srcdir}/config.x86_64" ./.config
  sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  sed -ri 's|^(SUBLEVEL =).*|\1|' Makefile
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  #msg "Stopping build"
#  return 1

#  yes "" | make config
  CFLAGS=${CFLAGS}" -march=corei7 -mtune=corei7 -mcpu=corei7 "
  CXXFLAGS=${CXXFLAGS}" -march=corei7 -mtune=corei7 -mcpu=corei7 "
  ionice -c 3 nice -n 19 make ${MAKEFLAGS} bzImage modules
}

package_linux-linode() {
  KARCH=x86
  cd "${srcdir}/linux-${pkgver}"
  _kernver="$(make kernelrelease)"
  mkdir -p "${pkgdir}"/{lib/{modules,firmware},boot}
  make INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgname}"
  install -D -m644 vmlinux "${pkgdir}/usr/src/linux-${_kernver}/vmlinux"
  install -D -m644 "${srcdir}/${pkgname}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i "${startdir}/${pkgname}.install"
  sed \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgname}\"|g" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgname}.img\"|g" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgname}-fallback.img\"|g" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  rm -rf "${pkgdir}/lib/firmware"
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  mkdir -p ${pkgdir}/boot/grub
  sed "s/%VER%/${pkgver}-${pkgrel}/ig" ${srcdir}/menu.lst > ${pkgdir}/boot/grub/menu.lst
}
