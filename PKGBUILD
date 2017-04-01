# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# tracks: https://projects.archlinux.org/svntogit/packages.git/log/trunk?h=packages/linux

pkgname=linux-linode
_basekernel=4.10
_kernelname=${pkgname#linux}
_srcname=linux-${_basekernel}
pkgver=${_basekernel}.8
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/yardenac/linux-linode"
license=(GPL2)
makedepends=(xmlto docbook-xsl kmod inetutils bc 'gcc>=4.9.0')
options=('!strip')
source=("https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar."{xz,sign}
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}."{xz,sign}
        'config'
        'config.x86_64'
        '08_linux_linode'
        'hook'
        'preset')
sha512sums=('c3690125a8402df638095bd98a613fcf1a257b81de7611c84711d315cd11e2634ab4636302b3742aedf1e3ba9ce0fea53fe8c7d48e37865d8ee5db3565220d90' 'SKIP'
            '9760254a63fea330e33b514dda457a3bf33da6f8e06c281fc3fb36ba4c022df8200d2a04d49f4acc9ce0c9f86cbfda7edc724431ed378be3288eb299510add2e' 'SKIP'
            '97760061527a9d231b73fcda953289fc532432e30bbd5a73ac972e52bc66eb61b7cbcef1cb97c68d5622a656f1c2c0790994c0aab79b65446eda566a3726d12d'
            'dc76adc365f1fff95a076982b8cfc595fbee5093185b2a298212e59adccb2c12b0f80d79ab0a9038b6efbe265515d55998b6647817ad080dbe1ca74e010f7361'
            'e71181d820d9abfab0c04a4758f9aadd4d2d740a09057a76ed7f47d6c9363ddb5591a1b61d1119c792b08a5a033c67ade902237569d2e670b6f26d269ed184cf'
            'c57a6c8d9978cb6a1034bed33ba5e06bef9b134f22113761798d4fa46e8091e7b0bd26f3a14d79122ba780b2f7a93ca26850f4da6a654f81b34cc79c242f683f'
            '62870a08f000abfe8eb1f50271afdf04686af108554f7629dc5e1d7610ad14bdc9cd14d2609270b83f9edb745a520b81fa7bfb92ebcc28a146df040c895b549b')
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
pkgdesc="Kernel for Linode servers"
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
provides=(linux)
conflicts=(grub-legacy)
backup=(etc/mkinitcpio.d/${pkgname}.preset)
install=install

prepare() {
  cd "${srcdir}/${_srcname}"
  patch -p1 -i "${srcdir}/patch-${pkgver}"
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
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuzll-${pkgname}"
  install -D -m644 vmlinux "${pkgdir}/lib/modules/${_kernver}/build/vmlinux"
  install -D -m644 "${srcdir}/preset" "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"
  install -D -m644 "${srcdir}/hook" "${pkgdir}/usr/share/libalpm/hooks/99-linux-linode.hook"
  install -D -m755 "${srcdir}/08_linux_linode" "${pkgdir}/etc/grub.d/08_linux_linode"
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -i "${startdir}/install"
  sed \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuzll-${pkgname}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgname}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgname}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"

  emdir="extramodules-${_basekernel}${_kernelname:--ARCH}"
  mkdir -p "${pkgdir}/lib/modules/${emdir}"
  ln -s "../${emdir}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  echo "${_kernver}" >| "${pkgdir}/lib/modules/${emdir}/version"
  depmod -b "${pkgdir}" -F System.map "${_kernver}"
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/"{lib,usr/}
}
