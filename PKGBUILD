# Maintainer RetardedOnion@archlinux-irc
pkgbase=linux-mainline-vfio
_srcname=linux-4.17
pkgver=4.17
pkgrel=1
pkgdesc="The Linux-vfio kernel and modules but mainline."
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'kmod' 'inetutils' 'bc' 'libelf')
options=('!strip')
source=(
  https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.{xz,sign}
  https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.{xz,sign}
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk
  add-acs-overrides.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)

_kernelname=${pkgbase#linux}
: ${_kernelname:=-ARCH}

prepare() {
  cd ${_srcname}
  yes "" | make oldconfig # using old config from previous kernel version and assume defaults
  # add upstream patch if needed
  if ! [[ ${_srcname} == *${pkgver} ]]; then
    patch -p1 -i ../patch-${pkgver}
  fi
  patch -p1 -i "${srcdir}/add-acs-overrides.patch"


  # set extraversion to pkgrel and empty localversion
  sed -e "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" \
      -e "/^EXTRAVERSION =/aLOCALVERSION =" \
      -i Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh


  make prepare
}

build() {
  cd ${_srcname}

  make bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

  cd ${_srcname}

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

  cd ${_srcname}
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

  cd ${_srcname}
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
md5sums=('5bb13a03274b66b56c85b26682e407d7'
         'SKIP'
         'a77acb828d3d3426b137ea6b8cebb064'
         'SKIP'
         'ce6c81ad1ad1f8b333fd6077d47abdaf'
         'a85bfae59eb537b973c388ffadb281ff'
         'a329f9581060d555dc7358483de9760a'
         '061d4fee7caa96621dbfd572b0bf79fc')
sha1sums=('82826f02dd6d5bae5ccb802cc319a605b65111dc'
          'SKIP'
          'a9feb4997a41d562dfca788d143cf15757ae9a4d'
          'SKIP'
          '050233d8d5cd77bebb53c44db12020abce6aaeeb'
          '78742e190018788988b12a1144e752a8c5a086f8'
          'ba225afa5c979c819482d4f0585ab6d270ea9d4d'
          '45d54cd6a8ac1d95dc4e7bbd200d50aa5254b89c')
sha256sums=('9faa1dd896eaea961dc6e886697c0b3301277102e5bc976b2758f9a62d3ccd13'
            'SKIP'
            '91e7d0ebe6bdbe66a5b523e0181b34b59e1a1c04c4428fb7f84b512fd84bbb08'
            'SKIP'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            'abe269c6596b54a412bd8415472153f419026d4f367fa3ee1ebc8693ac66915d')
sha224sums=('b12b268f556da5200ca508f5ec310edf3c1311beddbdcfcb4f6a09d7'
            'SKIP'
            '56bd86bfbc8a75b564626411861626dc2687f0cad67788a8f7d2cc6e'
            'SKIP'
            '29921b96b2b0f537a4dd29589164c7f53e8061cf376139b20c9628ed'
            '4eae57626b7475f0df31a04386e94cefc2cd8e8e1f30bd1a4a10e5bf'
            '64e4629766367d8c5419e592921746bc1f1d262c11c6817bef26ef1e'
            '9f1d570a415b19713e3b392cd51a093ce08353f473b6b5c8992b5fff')
sha384sums=('aeb79c6553f2913cb3f7e5a95e67d512ea5a063ef12a4dba8da264ed3f4c1885b059553e1c004415ae95cad87414a146'
            'SKIP'
            '9ceaa30acab1b0426f781ef1695768f7b9a8e77c9c4c33cbff3d27c92e8903014a41bc484122e10cf47fc693757ac214'
            'SKIP'
            'f7c95513e185393a526043eb0f5ecf1f800840ab3b2ed223532bb9d40ddcce44c5fab5f4b528cfd2a89bf67ad764751d'
            'dc9ff30c2501d14675e8ef21a7c86eebf752700c216cb6c5034ca0b16a17465e41392772757b1551bbf7bf0f177cd6af'
            '8cb9bd89319b3f7631d2947bd8e33e68cfe8159bb35d4213e1e0eb3a16611950e9e239202741b319781fbc3cf6163ff2'
            '07f815e56c32b0bae28e3a6d250f507f7db098135d21302cb73114d47432e7d3e3fb232aae0656ef15d01d776393a12d')
sha512sums=('4d9de340a26155a89ea8773131c76220cc2057f2b5d031b467b60e8b14c1842518e2d60a863d8c695f0f7640f3f18d43826201984a238dade857b6cef79837db'
            'SKIP'
            '8a44e961cc1e3d236e2fc0ccceea6d1544b75caa2278507b4afba076850dd0185f07b64d1367a6469eb67b4fe03cfb76cd58c19fd825d64eec5a18cc0f79fea6'
            'SKIP'
            '7ad5be75ee422dda3b80edd2eb614d8a9181e2c8228cd68b3881e2fb95953bf2dea6cbe7900ce1013c9de89b2802574b7b24869fc5d7a95d3cc3112c4d27063a'
            '4a8b324aee4cccf3a512ad04ce1a272d14e5b05c8de90feb82075f55ea3845948d817e1b0c6f298f5816834ddd3e5ce0a0e2619866289f3c1ab8fd2f35f04f44'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            '42025ed8ec4c6ccca7f83f59e75cbeb9c5b342854d54117362d39c3000f6c4e46b10ec70641e4fb716d437f864fcc00321f57234cec6766c51939ffe5aeb8952')
