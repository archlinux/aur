pkgbase=linux-linode
pkgname=${pkgbase}
_kernelname=${pkgname#linux}
_basekernel=3.4
pkgver=${_basekernel}.6
pkgrel=4
arch=(x86_64)
url="https://github.com/yardenac/linux-linode"
license=(GPL2)
makedepends=(xmlto docbook-xsl)
options=('!strip')
source=("http://www.kernel.org/pub/linux/kernel/v3.x/linux-3.4.tar.xz"
        "http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
        'config.x86_64'
        'menu.lst'
        "${pkgname}.preset"
        'change-default-console-loglevel.patch')
md5sums=('cba7741056c05ac98277b99909039a7e'
         '14443e53d3ab88e6eac45d954d891e00'
         '9847e0f43fd4a5dfd061bdc966af2440'
         'd01f2350ec9f92e2eabcde0f11be24f2'
         'ee66f3cd0c5bc0ba0f65499784d19f30'
         '9d3c56a4b999c8bfbd4018089a62f662')
pkgdesc="Kernel for Arch Linux on Linode"
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
provides=(kernel26 linux)
conflicts=(kernel26 linux grub grub-legacy)
replaces=(kernel26 linux)
backup=(etc/mkinitcpio.d/${pkgname}.preset)
install=${pkgname}.install

build() {
  cd "${srcdir}/linux-${_basekernel}"
  patch -p1 -i "${srcdir}/patch-${pkgver}"
  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"
  cp "${srcdir}/config.x86_64" ./.config
  sed -i '2iexit 0' scripts/depmod.sh
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
  mv "${pkgdir}/"{lib,usr/}
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  mkdir -p ${pkgdir}/boot/grub
  sed "s/%VER%/${pkgver}-${pkgrel}/ig" ${srcdir}/menu.lst > ${pkgdir}/boot/grub/menu.lst
}
