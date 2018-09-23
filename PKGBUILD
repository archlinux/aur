# Maintained by RetardedOnion@archlinux-irc
# Based on https://aur.archlinux.org/packages/linux-mainline/
# acs-patch from https://gitlab.com/Queuecumber/linux-acs-override/tree/master/workspaces
##
## Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
##
## Based on the linux package by:
## Maintainer: Tobias Powalowski <tpowa@archlinux.org>
## Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgbase=linux-mainline-vfio               # Build stock -ARCH kernel
_tag=v4.19-rc5
pkgver=4.19rc5
pkgrel=1
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'kmod' 'inetutils' 'bc' 'libelf' 'git')
options=('!strip')
source=(
  "git+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git#tag=$_tag"
  config         # the main kernel config file
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk
  add-acs-overrides.patch # acs-patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)

_kernelname=${pkgbase#linux}
: ${_kernelname:=-ARCH}

prepare() {
  cd "${srcdir}/linux"

  patch -p1 -i "${srcdir}/add-acs-overrides.patch"

  cat ../config - >.config <<END
CONFIG_LOCALVERSION="${_kernelname}"
CONFIG_LOCALVERSION_AUTO=n
END

  # mainline: Fix LOCALVERSION
  touch .scmversion

  # mainline: we have -rcX in EXTRAVERSION, don't touch it
  # set extraversion to pkgrel and empty localversion
  #sed -e "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" \
  #    -e "/^EXTRAVERSION =/aLOCALVERSION =" \
  #    -i Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # mainline: Disabled here, causes make config to run before olddefconfig
  # get kernel version
  #make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  make olddefconfig
  # ... or manually edit .config

  # mainline: moved here from before make config
  # get kernel version
  make prepare

  # rewrite configuration
  yes "" | make config >/dev/null
}

build() {
  cd "${srcdir}/linux"

  make bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

  cd "${srcdir}/linux"

  # get kernel version
  _kernver="$(make kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  make INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  cp arch/x86/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # make room for external modules
  local _extramodules="extramodules-${_basekernel}${_kernelname}"
  ln -s "../${_extramodules}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

  # remove build and source links
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}

  # now we call depmod...
  depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"

  # add vmlinux
  install -Dt "${pkgdir}/usr/lib/modules/${_kernver}/build" -m644 vmlinux

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|${pkgbase}|g
    s|%KERNVER%|${_kernver}|g
    s|%EXTRAMODULES%|${_extramodules}|g
  "

  # hack to allow specifying an initially nonexisting install file
  sed "${_subst}" "${startdir}/${install}" > "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  # install mkinitcpio preset file
  sed "${_subst}" ../linux.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hooks
  sed "${_subst}" ../60-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" ../90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

  cd "${srcdir}/linux"
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/x86" -m644 arch/x86/Makefile
  install -Dt "${_builddir}/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  cp -t "${_builddir}/arch/x86" -a arch/x86/include

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/9912
  #install -Dt "${_builddir}/drivers/media/dvb-core" -m644 drivers/media/dvb-core/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # copy in Kconfig files
  find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */x86/ ]] && continue
    rm -r "${_arch}"
  done

  # remove files already in linux-docs package
  rm -r "${_builddir}/Documentation"

  # remove now broken symlinks
  find -L "${_builddir}" -type l -printf 'Removing %P\n' -delete

  # Fix permissions
  chmod -R u=rwX,go=rX "${_builddir}"

  # strip scripts directory
  local _binary _strip
  while read -rd '' _binary; do
    case "$(file -bi "${_binary}")" in
      *application/x-sharedlib*)  _strip="${STRIP_SHARED}"   ;; # Libraries (.so)
      *application/x-archive*)    _strip="${STRIP_STATIC}"   ;; # Libraries (.a)
      *application/x-executable*) _strip="${STRIP_BINARIES}" ;; # Binaries
      *) continue ;;
    esac
    /usr/bin/strip ${_strip} "${_binary}"
  done < <(find "${_builddir}/scripts" -type f -perm -u+w -print0 2>/dev/null)
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"

  cd "${srcdir}/linux"
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  mkdir -p "${_builddir}"
  cp -t "${_builddir}" -a Documentation

  # Fix permissions
  chmod -R u=rwX,go=rX "${_builddir}"
}

pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
md5sums=('SKIP'
         '7abf6e18a471519399d3cf45f3b2c457'
         'ce6c81ad1ad1f8b333fd6077d47abdaf'
         '90cd68710e3064d9b65f5549570f7821'
         'a329f9581060d555dc7358483de9760a'
         '2bb524340cf1342e8e7f9ce2bcb83e16')
sha1sums=('SKIP'
          '65f271887d58214b35c40ffc2e7acf4da3eb7b06'
          '050233d8d5cd77bebb53c44db12020abce6aaeeb'
          '6a25b0d67dbee21d2926fe49e2c259f3d7721acb'
          'ba225afa5c979c819482d4f0585ab6d270ea9d4d'
          '1f470f6110ccfa8b8129ba233427675483553649')
sha256sums=('SKIP'
            '0269d9a56f0d0306c9bd5c179a7e32214b0a1c082d3bca581661203b27305f17'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '834bd254b56ab71d73f59b3221f056c72f559553c04718e350ab2a3e2991afe0'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            '6473f29d2ade7c79c00b8dfa440af41c592b3b0e95583e05fd9739fd5c639e96')
sha224sums=('SKIP'
            '32f83c99a59dbd44b8f8b65cafc525567752a17cf20fc20cf0b22281'
            '29921b96b2b0f537a4dd29589164c7f53e8061cf376139b20c9628ed'
            '4b875362dbbc2dad25f85f7e854ff0fd6abd9010f8da408ac341c7ab'
            '64e4629766367d8c5419e592921746bc1f1d262c11c6817bef26ef1e'
            '2c9e80595ee93e5f3ee5ddaaedd63267e65c7e6c32523fac681b28e2')
sha384sums=('SKIP'
            '5ac0a26480797ef98c346ef95fba4bed63d11a257a5c5b22406ddc2728e230ad9f9ae7bc0d7ae620e5a7281a9941d45c'
            'f7c95513e185393a526043eb0f5ecf1f800840ab3b2ed223532bb9d40ddcce44c5fab5f4b528cfd2a89bf67ad764751d'
            '1213db9fc7f9d4fe73f838a32aaed8f4648e28a4bd92ed10b85beb496d9d04b1a3bfe354b4f60a43f8a153ae1c037718'
            '8cb9bd89319b3f7631d2947bd8e33e68cfe8159bb35d4213e1e0eb3a16611950e9e239202741b319781fbc3cf6163ff2'
            'c7ac27b8e7e4573f334a0ad0047be4ecfdba142b61deb50c7e47dcfc4778c5bdd8547493fbb6ee750c644926b7c6fa2f')
sha512sums=('SKIP'
            'a1fdf9c4b235c6b105c1c44488d48ec581b85af3301a2fd97f02132f32b5e197759bd4ebc2c913847eac0cfcebcf3ac1872777abe55d04f1059e1774e700b37d'
            '7ad5be75ee422dda3b80edd2eb614d8a9181e2c8228cd68b3881e2fb95953bf2dea6cbe7900ce1013c9de89b2802574b7b24869fc5d7a95d3cc3112c4d27063a'
            'd6faa67f3ef40052152254ae43fee031365d0b1524aa0718b659eb75afc21a3f79ea8d62d66ea311a800109bed545bc8f79e8752319cd378eef2cbd3a09aba22'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            '1afbff66faa22fafc259cd9bb901e0adeeb01bcb7890fa6397ef36f86309f2ffa68a116f33b82e7f344523e62cf08925d39ef0ecc42770f77a91dd96420428e2')
