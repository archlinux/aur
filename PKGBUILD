pkgbase=linux
pkgname=linux-linode
_kernelname=${pkgname#linux}
_basekernel=3.3
pkgver=${_basekernel}.5
pkgrel=1
arch=(x86_64)
url="http://www.kernel.org/"
license=(GPL2)
makedepends=(xmlto docbook-xsl)
options=('!strip')
source=("http://www.kernel.org/pub/linux/kernel/v3.x/linux-3.3.tar.xz"
        "http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
        'config.x86_64'
        'menu.lst'
        "${pkgname}.preset"
        'change-default-console-loglevel.patch')
md5sums=('7133f5a2086a7d7ef97abac610c094f5'
         'd346edca5d3de7052f49996b01cef401'
         'f24c511823294d1236f037f1f34a3467'
         '4c45d442db6239f0b3d0008c0a17c76c'
         'ee66f3cd0c5bc0ba0f65499784d19f30'
         '9d3c56a4b999c8bfbd4018089a62f662')
pkgdesc="The Linux Kernel and modules"
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
provides=(kernel26 linux)
conflicts=(kernel26 linux)
replaces=(kernel26 linux)
backup=(etc/mkinitcpio.d/${pkgname}.preset)
install=${pkgname}.install

build() {
  cd "${srcdir}/linux-${_basekernel}"
  patch -p1 -i "${srcdir}/patch-${pkgver}"
  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"
  cp "${srcdir}/config.x86_64" ./.config
  sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile
  make prepare
#  return 1
  CFLAGS=${CFLAGS}" -march=corei7 -mtune=corei7 -mcpu=corei7 "
  CXXFLAGS=${CXXFLAGS}" -march=corei7 -mtune=corei7 -mcpu=corei7 "
  ionice -c 3 nice -n 19 make ${MAKEFLAGS} bzImage modules
}

package_linux-linode() {
  KARCH=x86
  cd "${srcdir}/linux-${_basekernel}"
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

  emdir="extramodules-${_basekernel}${_kernelname:--ARCH}"
  mkdir -p "${pkgdir}/lib/modules/${emdir}"
  ln -s "../${emdir}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  echo "${_kernver}" >| "${pkgdir}/lib/modules/${emdir}/version"

  mkdir -p ${pkgdir}/boot/grub
  sed "s/%VER%/${pkgver}-${pkgrel}/ig" ${srcdir}/menu.lst > ${pkgdir}/boot/grub/menu.lst
}
