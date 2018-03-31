# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# tracks: https://projects.archlinux.org/svntogit/packages.git/log/trunk?h=packages/linux

pkgname=linux-linode
_basekernel=4.15
_kernelname=${pkgname#linux}
_srcname=linux-${_basekernel}
pkgver=${_basekernel}.15
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
sha512sums=('c00d92659df815a53dcac7dde145b742b1f20867d380c07cb09ddb3295d6ff10f8931b21ef0b09d7156923a3957b39d74d87c883300173b2e20690d2b4ec35ea' 'SKIP'
            '4f3da42c3540b621706b74477e1e1922f5fca295d38e57f323f53a005d6aa8d247f30e19440af052d832ee19f298d108d1f8fc8a0a7d1a7c05470b32d8af07b3' 'SKIP'
            '61e6e47701c30ac5c683b86bf37405e9356177c2d5ef98fb401fc8cd2c2f89d09fa1bd47e8fc40ff24139f5ff1199311a23419abd4adb2a15f35629cf815e7b8'
            '7a80f858c32a9dd62f43aba0b7119a1196869216117164bcde24ab46022e8a1bbe27821faa26ca690a1633a5a9fe324e98e5cdf14f37591d569cbc71f542482d'
            'c57a6c8d9978cb6a1034bed33ba5e06bef9b134f22113761798d4fa46e8091e7b0bd26f3a14d79122ba780b2f7a93ca26850f4da6a654f81b34cc79c242f683f'
            'db9080b2548e4dcd61eaaf20cd7d37cbbc8c204ce85a2e3408d0671f6b26010f77a61affd2c77e809768714eca29d3afb64765a3f2099317a2c928eff3feb4cf'
            '73cb4c064d8942fddaac48158b7e77d19afc1cb61f83936f21832ba7d7266ccfd3021114252edd5cec5542096204f48cf30544fd6bffff79bc94d96fabe74f52'
            '62870a08f000abfe8eb1f50271afdf04686af108554f7629dc5e1d7610ad14bdc9cd14d2609270b83f9edb745a520b81fa7bfb92ebcc28a146df040c895b549b')
sha256sums=('5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769' 'SKIP'
            'd8e7f93e24db5517a1be2030a765431120e07f7cd55e510d0de562c70e45bc00' 'SKIP'
            '05c2b7b4648d9fc6101e7ecfbc66d463dde6fa482f924f455a0aa2c0a62821b8'
            '7d56a81083d1468d90ebec97a44ec44f80f8cb87bd506ed1918d6664d6309ad5'
            '3efa91fcb4698bde0598678bbf9a4a747c011823af82704eed2c146ed7cd9734'
            '368fb58e7aa465f597e9a72da4b6eea4183c1a85242173412d54ad18d10d8fb3'
            'a055b6005a324240b35c416d9d08fba21c5f614eefb46f244035d04bf085224f'
            '29fa2c1ea75f55a61276496507b788b1a8bde1d7c16bee4f525651db34076e46')
md5sums=('0d701ac1e2a67d47ce7127432df2c32b' 'SKIP'
         '41396634a0e194e3ade1205c718cc884' 'SKIP'
         'd677feac9fd958c345255de9391c3442'
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
  cat "${srcdir}/config" - > ./.config <<-EOF
	CONFIG_LOCALVERSION="${_kernelname}"
	CONFIG_LOCALVERSION_AUTO=n
	EOF
  sed -i '2iexit 0' scripts/depmod.sh
  sed -e "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" \
      -e "/^EXTRAVERSION =/aLOCALVERSION =" \
      -i Makefile
  chmod +x tools/objtool/sync-check.sh
  make prepare
}

build() {
  cd "${srcdir}/${_srcname}"
  [[ "$MAKEFLAGS" =~ -j[0-9]* ]] || MAKEFLAGS+=" -j$(nproc)"
  ionice -c 3 nice -n 16 make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-linode() {
  cd "${srcdir}/${_srcname}"
  _kernver="$(make kernelrelease)"
  emdir="extramodules-${_basekernel}${_kernelname}"
  mkdir -p "${pkgdir}"/{usr/lib/modules/"$emdir",boot/grub}
  make INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
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
