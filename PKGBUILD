# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# tracks: https://projects.archlinux.org/svntogit/packages.git/log/trunk?h=packages/linux

pkgname=linux-linode
_basekernel=5.14.14
_hardenedver=1
pkgrel=1
_kernelname=${pkgname#linux}
_srcname=linux-${_basekernel}
_patchname=linux-hardened
pkgver_=${_basekernel}-hardened${_hardenedver}
pkgver=${pkgver_/-/.}
arch=('x86_64')
url="https://github.com/yardenac/linux-linode"
license=(GPL2)
makedepends=(xmlto docbook-xsl kmod inetutils bc libelf)
options=('!strip')
source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar."{xz,sign}
        "https://github.com/anthraxx/${_patchname}/releases/download/${pkgver_}/${_patchname}-${pkgver_}.patch"{,.sig}
        'config'
        '08_linux_linode'
        '99-grub-ll.hook'
        'menu.lst'
        'preset')
sha512sums=('bd21aee0d84e213c4ed387a9da825594d2d576690d0b82ad6aaf123a1d8340b9804d4e99f909ba39f927c524409e35d26ed175c50d5236a8f3f66c7f5837e4a1' 'SKIP'
            '9e024372ded079fcdaf88344da61f04991f77d91617553d7cb3409b6c5eef94bb7accd0c7f296b0dc55f506162fab7c3516b633d4d6c6d05360f14e56f24b36f' 'SKIP'
            'afdc3a9b361d781483b6f278f93ce45b418a16e126ad3a3425a245bd623de082ec6bfea6afb5a0701896de9e417920cc67a4d50c4997f9525c7e6efe79c93dd9'
            '1e901b8894743e9dcb04046a5fa58e14b19095b3295abae679dcbbf309bd79ddf1716dcd07ae8a71e7cdc9361216c0c9da12a76edb45e9388c512b07df7759e7'
            'db9080b2548e4dcd61eaaf20cd7d37cbbc8c204ce85a2e3408d0671f6b26010f77a61affd2c77e809768714eca29d3afb64765a3f2099317a2c928eff3feb4cf'
            '1a17f83747ebd2dbe8d57996a1234f9e72de0754f8907c984477d761c2d99753490b72d80e2c801b85ded705818d530401f6377e3312937d72d1e4052007ce30'
            'a0a78831075336edef0a8faa34fa550986c3c4d89a89f4f39d798da0211129dc90257d162bec2cdefabef2eb5886a710e70c72074b2f3016788861d05d1e2a1f')
sha256sums=('4dff4e96d4052195002538027f8a810411ba6116a41bff5575952702d509d06a' 'SKIP'
            '7229a75fa59b93963610e7189995c433a5db41336ccf9858cadd6289a8f2a5c3' 'SKIP'
            '8f7d84cbb8366c690ba2b7c1c45ebe46668f2646fb35e7ce47d443f0c7027651'
            'a2295cee5ae8c8d9c3efb0483e5e842f6bd9753f851c7433465b242264738546'
            '368fb58e7aa465f597e9a72da4b6eea4183c1a85242173412d54ad18d10d8fb3'
            'df9f20f818bf6c11296e5ac58c5fdd664ba17f3d80cf301eef9309ddb528741d'
            '33d9f913e4aed9f41bf263ff784921ab7d69597732079cbd06ff05b9adb32f44')
md5sums=('9646d53502447936773c65cac149572c' 'SKIP'
         'b29a4584f73a307466a2690844867b10' 'SKIP'
         '27ae148a4585af88176c1e82fe4050e7'
         'b24775bcf1d7a04c1d489af73c6e74b0'
         '625481f015365febcd65aa136ee555f9'
         '901c03c685c65119b50666cb31a080be'
         '3d6427cc412dbc226b5d058c82ba7c66')
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              'E240B57E2C4630BA768E2F26FC1B547C8D8172C8' # Levente Polyak
)
pkgdesc="Kernel for Linode servers"
depends=(coreutils linux-firmware kmod mkinitcpio grub)
conflicts=(grub-legacy)
backup=(etc/mkinitcpio.d/${pkgname}.preset boot/grub/menu.lst)

prepare() {
  cd "${srcdir}/${_srcname}"
  patch -p1 -i "${srcdir}/${_patchname}-${pkgver_}.patch"
  sed -e "/^EXTRAVERSION =/s/=.*/= .hardened${_hardenedver}/" -i Makefile
  scripts/setlocalversion --save-scmversion
  cp "${srcdir}/config" .config
  make oldconfig
  make -s kernelrelease > ../version
}

build() {
  cd "${srcdir}/${_srcname}"
  [[ "$MAKEFLAGS" =~ -j[0-9]* ]] || MAKEFLAGS+=" -j$(nproc)"
  ionice -c 3 nice -n 16 make ${MAKEFLAGS} bzImage modules
}

package() {
  cd "${srcdir}/${_srcname}"
  local _kernver="$(<${srcdir}/version)"
  local modulesdir="$pkgdir"/usr/lib/modules/$_kernver
  mkdir -p "$modulesdir" "${pkgdir}"/boot/grub
  make INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  rm -rf "$modulesdir"/{source,build}
  echo "$pkgname" | install -Dm644 /dev/stdin  "$modulesdir/pkgbase"
  install -D -m644 "$(make -s image_name)"     "$modulesdir/vmlinuz"
  install -D -m644 "${srcdir}/preset"          "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"
  install -D -m755 "${srcdir}/08_linux_linode" "${pkgdir}/etc/grub.d/08_linux_linode"
  install -D -m644 "${srcdir}/99-grub-ll.hook" "${pkgdir}/usr/share/libalpm/hooks/99-grub-ll.hook"
  sed "s/%VER%/${pkgver}-${pkgrel}/ig" "${srcdir}/menu.lst" > "${pkgdir}/boot/grub/menu.lst"
  chmod -Rc u=rwX,go=rX "$pkgdir"
}
