# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# tracks: https://projects.archlinux.org/svntogit/packages.git/log/trunk?h=packages/linux

pkgname=linux-linode
_basekernel=5.19.14
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
sha512sums=('19e584735009f0cedd08c94b2cc75cb6b0706a5aacd13a57995cab4f4a304bec42e9f0151bac1712d117b88c211fb84092b6eda723f9ab06289f37930ce1079a' 'SKIP'
            'e0edd0efa0e0543b1ae9a0e753636d1605fabc7d0269394d2da22ac26fa18fccb84dc77d4461f42d570e9ccac348d2e4c730bb2a99c86c2946f060d1c61e108e' 'SKIP'
            '41e0262211e48e8316ebbb3cb185d0ec6756c9d23c5b98b621f10ec64e42b7540a811b8ba795d0cd0dee700728dacf5c74a2ade5dc6ed39962fa2b95cb7b877e'
            '1e901b8894743e9dcb04046a5fa58e14b19095b3295abae679dcbbf309bd79ddf1716dcd07ae8a71e7cdc9361216c0c9da12a76edb45e9388c512b07df7759e7'
            'db9080b2548e4dcd61eaaf20cd7d37cbbc8c204ce85a2e3408d0671f6b26010f77a61affd2c77e809768714eca29d3afb64765a3f2099317a2c928eff3feb4cf'
            '1a17f83747ebd2dbe8d57996a1234f9e72de0754f8907c984477d761c2d99753490b72d80e2c801b85ded705818d530401f6377e3312937d72d1e4052007ce30'
            'a0a78831075336edef0a8faa34fa550986c3c4d89a89f4f39d798da0211129dc90257d162bec2cdefabef2eb5886a710e70c72074b2f3016788861d05d1e2a1f')
sha256sums=('1ded27e1c4a8b51df5f93f2f772827183b805d9ab4771071307c13ee86cd1ac1' 'SKIP'
            'd1e00399f6595676632f97b0a4a5f34764ed814d4adf52d3e0a99c1a5d312368' 'SKIP'
            '0f5b7eb609b59646d9364364a21b4b2427e2275e0a8afc050e18513f547b9826'
            'a2295cee5ae8c8d9c3efb0483e5e842f6bd9753f851c7433465b242264738546'
            '368fb58e7aa465f597e9a72da4b6eea4183c1a85242173412d54ad18d10d8fb3'
            'df9f20f818bf6c11296e5ac58c5fdd664ba17f3d80cf301eef9309ddb528741d'
            '33d9f913e4aed9f41bf263ff784921ab7d69597732079cbd06ff05b9adb32f44')
md5sums=('82ae4f2e0b6b2698bb0bf6999dd8844e' 'SKIP'
         '05cf0753e1a48816f41938850c0e46cf' 'SKIP'
         'dd93e15b96d7c226e78caff14f7e8903'
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
