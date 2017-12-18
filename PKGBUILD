# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# tracks: https://projects.archlinux.org/svntogit/packages.git/log/trunk?h=packages/linux

pkgname=linux-linode
_basekernel=4.14
_kernelname=${pkgname#linux}
_srcname=linux-${_basekernel}
pkgver=${_basekernel}.7
pkgrel=1
arch=('x86_64')
url="https://github.com/yardenac/linux-linode"
license=(GPL2)
makedepends=(xmlto docbook-xsl kmod inetutils bc libelf)
options=('!strip')
source=("https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar."{xz,sign}
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}."{xz,sign}
        'config'
        '08_linux_linode'
        '98-linux-linode.hook'
        '99-grub-ll.hook'
        'menu.lst'
        'preset')
sha512sums=('77e43a02d766c3d73b7e25c4aafb2e931d6b16e870510c22cef0cdb05c3acb7952b8908ebad12b10ef982c6efbe286364b1544586e715cf38390e483927904d8' 'SKIP'
            '7a0aa00af73fbac34a0f96ebbd977688275538f8f2f3e0ba32ac3f9eb0d02498dd75d4d6481cfdd1236d45616231dd376a453ce8c04663ceaeb5ccc553996251' 'SKIP'
            '3d11cc1eabbd5f36561dadd4ecbe14b00b347921bf2499776a88d1e10cc45cd9a9ba5502689b5a2fc29f27a7a682a6080850d063b1d78cc6f56fb3b3ef6d6011'
            '7a80f858c32a9dd62f43aba0b7119a1196869216117164bcde24ab46022e8a1bbe27821faa26ca690a1633a5a9fe324e98e5cdf14f37591d569cbc71f542482d'
            'c57a6c8d9978cb6a1034bed33ba5e06bef9b134f22113761798d4fa46e8091e7b0bd26f3a14d79122ba780b2f7a93ca26850f4da6a654f81b34cc79c242f683f'
            'db9080b2548e4dcd61eaaf20cd7d37cbbc8c204ce85a2e3408d0671f6b26010f77a61affd2c77e809768714eca29d3afb64765a3f2099317a2c928eff3feb4cf'
            '73cb4c064d8942fddaac48158b7e77d19afc1cb61f83936f21832ba7d7266ccfd3021114252edd5cec5542096204f48cf30544fd6bffff79bc94d96fabe74f52'
            '62870a08f000abfe8eb1f50271afdf04686af108554f7629dc5e1d7610ad14bdc9cd14d2609270b83f9edb745a520b81fa7bfb92ebcc28a146df040c895b549b')
sha256sums=('f81d59477e90a130857ce18dc02f4fbe5725854911db1e7ba770c7cd350f96a7' 'SKIP'
            '5c286695439b4a1a2c7a112cf41aae0441b03ef41dfe83a0d61161c16dc265f5' 'SKIP'
            'dfb1b62d52606cff048c74dd02aa4da37512a75e278aea27204598feffc2e5e3'
            '7d56a81083d1468d90ebec97a44ec44f80f8cb87bd506ed1918d6664d6309ad5'
            '3efa91fcb4698bde0598678bbf9a4a747c011823af82704eed2c146ed7cd9734'
            '368fb58e7aa465f597e9a72da4b6eea4183c1a85242173412d54ad18d10d8fb3'
            'a055b6005a324240b35c416d9d08fba21c5f614eefb46f244035d04bf085224f'
            '29fa2c1ea75f55a61276496507b788b1a8bde1d7c16bee4f525651db34076e46')
md5sums=('bacdb9ffdcd922aa069a5e1520160e24' 'SKIP'
         '52dd6d42dd8e3c4735f23e404cbc4ae8' 'SKIP'
         '3af6845ad0813ee6b962b869a79b6542'
         'bc30565cf444b710c252675cf65fb46e'
         'c52c29a8502f6c75e309208f0afab11f'
         '625481f015365febcd65aa136ee555f9'
         '15fae1e2da901b937d284890fd91cfab'
         'e1b5255cfbf5f8ca79b4b4568feec801')
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
pkgdesc="Kernel for Linode servers"
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7' 'grub')
provides=(linux)
conflicts=(grub-legacy)
backup=(etc/mkinitcpio.d/${pkgname}.preset boot/grub/menu.lst)
install=install

prepare() {
  cd "${srcdir}/${_srcname}"
  patch -p1 -i "${srcdir}/patch-${pkgver}"
  cat "${srcdir}/config" > ./.config
  sed -i '2iexit 0' scripts/depmod.sh
  sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|g" ./.config
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile
  make prepare
}

build() {
  cd "${srcdir}/${_srcname}"
  [[ "$MAKEFLAGS" =~ -j[0-9]* ]] || MAKEFLAGS+=" -j$(nproc)"
  ionice -c 3 nice -n 16 make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-linode() {
  cd "${srcdir}/${_srcname}"
  _kernver="$(make LOCALVERSION= kernelrelease)"
  emdir="extramodules-${_basekernel}${_kernelname:--ARCH}"
  mkdir -p "${pkgdir}"/{usr/lib/modules/"$emdir",boot/grub}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}
  cp arch/x86/boot/bzImage "${pkgdir}/boot/vmlinuzll-${pkgname}"
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
  install -D -m644 "${srcdir}/preset" "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"
  install -D -m644 "${srcdir}/98-linux-linode.hook" "${pkgdir}/usr/share/libalpm/hooks/98-linux-linode.hook"
  install -D -m644 "${srcdir}/99-grub-ll.hook"      "${pkgdir}/usr/share/libalpm/hooks/99-grub-ll.hook"
  install -D -m755 "${srcdir}/08_linux_linode" "${pkgdir}/etc/grub.d/08_linux_linode"
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -i "${startdir}/install"
  sed \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuzll-${pkgname}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgname}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgname}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"
  ln -s "../${emdir}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"
  echo "${_kernver}" >| "${pkgdir}/usr/lib/modules/${emdir}/version"
  depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"
  sed "s/%VER%/${pkgver}-${pkgrel}/ig" "${srcdir}/menu.lst" > "${pkgdir}/boot/grub/menu.lst"
}
