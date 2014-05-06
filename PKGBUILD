# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# tracks: https://projects.archlinux.org/svntogit/packages.git/log/trunk?h=packages/linux

pkgname=linux-linode
_basekernel=3.14
_kernelname=${pkgname#linux}
_srcname=linux-${_basekernel}
pkgver=${_basekernel}.3
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yardenac/linux-linode"
license=(GPL2)
makedepends=(xmlto docbook-xsl kmod inetutils bc)
options=('!strip')
source=("https://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
        'config'
        'config.x86_64'
        'menu.lst'
        "preset"
        'fsid-0.patch::https://projects.archlinux.org/svntogit/packages.git/plain/linux/trunk/0004-fs-Don-t-return-0-from-get_anon_bdev.patch'
        'https://projects.archlinux.org/svntogit/packages.git/plain/linux/trunk/change-default-console-loglevel.patch')
sha512sums=('5730d83a7a81134c1e77c0bf89e42dee4f8251ad56c1ac2be20c59e26fdfaa7bea55f277e7af156b637f22e1584914a46089af85039177cb43485089c74ac26e'
            '1da62f5140965befb39f9565564cb00de189dd83b279632be50d8b1b4a9c59279907435b5d7f3c2fd47c13ba92468b23187f2d0433c7fbb5578f12359ed5584a'
            '77c8d0cb8fd2d5346620780ff5481a6e5143563a3560f520e353836287d0dfbe22e3beac23126c27d42d7c27261b8638bf415abcf2ede347fb5abbcbe55ad5c8'
            '577c650e06bf4891b66894fb613edd6ae37b276dbd899a2b863a98a2a89eeceeb71e4cdb0e140049fdd21bcce3ba13ab4482aedf1bb50c108bd7754a53b08105'
            'f4191d63f71920a4c366c6c291205a780b7ddca952b4420dfb52b9e6d33c818b431830afe990df3ef3601458959a1b39b88c084b416a814cb7a957187670b733'
            'a0a78831075336edef0a8faa34fa550986c3c4d89a89f4f39d798da0211129dc90257d162bec2cdefabef2eb5886a710e70c72074b2f3016788861d05d1e2a1f'
            '61addb73b2811a369b72ea097e310c63853f219d1384ea0e2cd2bc7b8389163e2e5679a9a198fe0977017658c18a90be0f73aaf72e9b829cc4a802a4fe7cfba0'
            '502192b5ce94c8254205f5ddb85bf50c5f1e78c768817b10dca3a7716a8c59d5e093842631acb51e3805cbf85522e0a9200942656f11bbb4ea1b7d61e24ddd78')
pkgdesc="Kernel for Linode servers"
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
provides=(linux)
conflicts=(grub grub-legacy)
backup=(etc/mkinitcpio.d/${pkgname}.preset boot/grub/menu.lst)
install=install

prepare() {
  cd "${srcdir}/${_srcname}"
  patch -p1 -i "${srcdir}/patch-${pkgver}"
  patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"
  patch -Np1 -i "${srcdir}/fsid-0.patch"
  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" > ./.config
  else
    cat "${srcdir}/config" > ./.config
  fi
  sed -i '2iexit 0' scripts/depmod.sh
  sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|g" ./.config
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile
  make prepare
}

build() {
  cd "${srcdir}/${_srcname}"
  CFLAGS=${CFLAGS}" -march=corei7 -mtune=corei7 -mcpu=corei7 "
  CXXFLAGS=${CXXFLAGS}" -march=corei7 -mtune=corei7 -mcpu=corei7 "
  [[ "$MAKEFLAGS" =~ -j[0-9]* ]] || MAKEFLAGS+=" -j$(nproc)"
  ionice -c 3 nice -n 16 make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-linode() {
  KARCH=x86
  cd "${srcdir}/${_srcname}"
  _kernver="$(make LOCALVERSION= kernelrelease)"
  mkdir -p "${pkgdir}"/{lib/{modules,firmware},boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  rm -rf "${pkgdir}"/lib/{firmware,modules/${_kernver}/{source,build}}
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgname}"
  install -D -m644 vmlinux "${pkgdir}/lib/modules/${_kernver}/build/vmlinux"
  install -D -m644 "${srcdir}/preset" "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -i "${startdir}/install"
  sed \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgname}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgname}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgname}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;

  emdir="extramodules-${_basekernel}${_kernelname:--ARCH}"
  mkdir -p "${pkgdir}/lib/modules/${emdir}"
  ln -s "../${emdir}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  echo "${_kernver}" >| "${pkgdir}/lib/modules/${emdir}/version"
  depmod -b "${pkgdir}" -F System.map "${_kernver}"
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/"{lib,usr/}

  mkdir -p ${pkgdir}/boot/grub
  sed "s/%VER%/${pkgver}-${pkgrel}/ig" ${srcdir}/menu.lst > ${pkgdir}/boot/grub/menu.lst
}
