# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# tracks: https://projects.archlinux.org/svntogit/packages.git/log/trunk?h=packages/linux

pkgname=linux-linode
_basekernel=6.1.31
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
source=("https://www.kernel.org/pub/linux/kernel/v${_basekernel%%.*}.x/${_srcname}.tar."{xz,sign}
        "https://github.com/anthraxx/${_patchname}/releases/download/${pkgver_}/${_patchname}-${pkgver_}.patch"{,.sig}
        'https://gitlab.archlinux.org/archlinux/packaging/packages/linux-hardened/-/raw/main/gcc13-compat.patch'
        'config'
        '08_linux_linode'
        '99-grub-ll.hook'
        'menu.lst'
        'preset')
sha512sums=('1202a47f29eb17ee074ce22289c6cd488acc381a59968728aedb6070874917cf331a2535629775f5ed3c442b5a82ceb17ed41804e719c2d3f81bcf249261bc7b' 'SKIP'
            'c946e62eaff550a897244bc3c82e8c4713e438d25db28bffb5287e8ba41913f4ee80930fd952d1b32074a6b58c0860a37ccd67fe366543f8db79d1e6e0d9c794' 'SKIP'
            'ba5ecf6e5e3f70ef6d0bbd2b929542b0247c8efedef4f2e1de28ca1644452c24a2124fcdcf958f2dc7121f0ab673b64dc3bd6529e26e552c5184a4857818b9bd'
            '4ea8a6c4e773b17e1ab55005aa46ccb56973aef1bc05bc0fe56643f168c75c46d43260baf199aeba989922ef40f4a80f92eb7b74220a7712587525ecb0b4e679'
            '1e901b8894743e9dcb04046a5fa58e14b19095b3295abae679dcbbf309bd79ddf1716dcd07ae8a71e7cdc9361216c0c9da12a76edb45e9388c512b07df7759e7'
            'db9080b2548e4dcd61eaaf20cd7d37cbbc8c204ce85a2e3408d0671f6b26010f77a61affd2c77e809768714eca29d3afb64765a3f2099317a2c928eff3feb4cf'
            '1a17f83747ebd2dbe8d57996a1234f9e72de0754f8907c984477d761c2d99753490b72d80e2c801b85ded705818d530401f6377e3312937d72d1e4052007ce30'
            'a0a78831075336edef0a8faa34fa550986c3c4d89a89f4f39d798da0211129dc90257d162bec2cdefabef2eb5886a710e70c72074b2f3016788861d05d1e2a1f')
sha256sums=('e86917bba1990e967943645484182a64ba325f98b114a1906cc1d50992e073c1' 'SKIP'
            '7f4e37effb3585ff438a1a6d2039762872b40e79f406696d948e4c9b7ee16a11' 'SKIP'
            'c6c5f6be7ae0ef5a8bdfea0a5578f096db38113774e08dc7b78fc48034c7b211'
            '5eda6af949bc31c4dd762eea6bd4dd3515f9071e4184a675a743827423ec8839'
            'a2295cee5ae8c8d9c3efb0483e5e842f6bd9753f851c7433465b242264738546'
            '368fb58e7aa465f597e9a72da4b6eea4183c1a85242173412d54ad18d10d8fb3'
            'df9f20f818bf6c11296e5ac58c5fdd664ba17f3d80cf301eef9309ddb528741d'
            '33d9f913e4aed9f41bf263ff784921ab7d69597732079cbd06ff05b9adb32f44')
md5sums=('72ac33b766704899f0a0d4d5e5fb02a9' 'SKIP'
         'e6d981cd8cfab5d0b7e03195cfb50e02' 'SKIP'
         '142e3e26901861047e5dfa5c5bd7509c'
         '7a8413c1c42841e38596d87cee00e456'
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
  patch -Np1 -i "${srcdir}/gcc13-compat.patch"
  patch -Np1 -i "${srcdir}/${_patchname}-${pkgver_}.patch"
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
