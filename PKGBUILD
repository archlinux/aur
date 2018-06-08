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
  config         # the main kernel config file
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk
  0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  0002-ACPI-watchdog-Prefer-iTCO_wdt-on-Lenovo-Z50-70.patch
  0003-Revert-drm-i915-edp-Allow-alternate-fixed-mode-for-e.patch
  # patches for pci passthrough
  add-acs-overrides.patch
  i915-vga-arbiter.patch
  PCI-Add-Intel-7th-8th-Gen-mobile-to-ACS-quirks.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)

_kernelname=${pkgbase#linux}
: ${_kernelname:=-ARCH}

prepare() {
  cd ${_srcname}

  # add upstream patch
  patch -p1 -i ../patch-${pkgver}

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # disable USER_NS for non-root users by default
  patch -Np1 -i ../0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch

  # https://bugs.archlinux.org/task/56780
  patch -Np1 -i ../0002-ACPI-watchdog-Prefer-iTCO_wdt-on-Lenovo-Z50-70.patch

  # https://bugs.archlinux.org/task/56711
  patch -Np1 -i ../0003-Revert-drm-i915-edp-Allow-alternate-fixed-mode-for-e.patch

  # patches for vga arbiter fix in intel systems
  patch -p1 -i "${srcdir}/i915-vga-arbiter.patch"

  # Overrides for missing acs capabilities
  patch -p1 -i "${srcdir}/add-acs-overrides.patch"

  # patches for specific intel cpus
  patch -p1 -i "${srcdir}/PCI-Add-Intel-7th-8th-Gen-mobile-to-ACS-quirks.patch"

  cat ../config - >.config <<END
CONFIG_LOCALVERSION="${_kernelname}"
CONFIG_LOCALVERSION_AUTO=n
END

  # set extraversion to pkgrel and empty localversion
  sed -e "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" \
      -e "/^EXTRAVERSION =/aLOCALVERSION =" \
      -i Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  # rewrite configuration
  yes "" | make config >/dev/null
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
         'b4b09bc3bbb1f4e2fd3d24ac1ee11dd7'
         'ce6c81ad1ad1f8b333fd6077d47abdaf'
         'a85bfae59eb537b973c388ffadb281ff'
         'a329f9581060d555dc7358483de9760a'
         'edc79137d09dc4396de44ef009d25692'
         '0665a787df7da49cba13e33ff7082d7a'
         '9fe12a31652a2b535219228580bc2e28'
         '061d4fee7caa96621dbfd572b0bf79fc'
         '41e09a7a635499f620e11947ecfe1ef8'
         '3a8d860cf50f58a9cf8f7667c2fd42e2')
sha1sums=('82826f02dd6d5bae5ccb802cc319a605b65111dc'
          'SKIP'
          'a9feb4997a41d562dfca788d143cf15757ae9a4d'
          'SKIP'
          '8da67e402225273f5cdb1066f62a05030788d46b'
          '050233d8d5cd77bebb53c44db12020abce6aaeeb'
          '78742e190018788988b12a1144e752a8c5a086f8'
          'ba225afa5c979c819482d4f0585ab6d270ea9d4d'
          '229cf6327c6bce59ac43ec41fb070e8ce2bea406'
          'c1f6c4e5ee069fc2b12ee69fd8ebc731975557a0'
          '711315943cdb3a5d5c37745d1676d13797948bcc'
          '45d54cd6a8ac1d95dc4e7bbd200d50aa5254b89c'
          'ff23de5cc18f738105c45b5c17a4a58ea6e12ff9'
          '50ce5ef64865ae7c2de7bc8ada1b1b291a81fa1d')
sha256sums=('9faa1dd896eaea961dc6e886697c0b3301277102e5bc976b2758f9a62d3ccd13'
            'SKIP'
            '91e7d0ebe6bdbe66a5b523e0181b34b59e1a1c04c4428fb7f84b512fd84bbb08'
            'SKIP'
            '8566a49997faf3f8678440c52578a7a0ee901e598d3b67d3bee3799fb92e8f86'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65'
            '8d6a5f34b3d79e75b0cb888c6bcf293f84c5cbb2757f7bdadafee7e0ea77d7dd'
            '2454c1ee5e0f5aa119fafb4c8d3b402c5e4e10b2e868fe3e4ced3b1e2aa48446'
            '8114295b8c07795a15b9f8eafb0f515c34661a1e05512da818a34581dd30f87e'
            'abe269c6596b54a412bd8415472153f419026d4f367fa3ee1ebc8693ac66915d'
            'fe3d47fe6f54d4a82c869fd29484d3f097b5906ef4d456409961a8dd647daad0'
            '429ed1161b9b178df97e53dc6439f770e5198b5544f7421d0e48a3dd77fe371f')
sha224sums=('b12b268f556da5200ca508f5ec310edf3c1311beddbdcfcb4f6a09d7'
            'SKIP'
            '56bd86bfbc8a75b564626411861626dc2687f0cad67788a8f7d2cc6e'
            'SKIP'
            'ef32c88d304884ef16ea2840d1f6f6ea0771a1a7a52b3cdaf384e5f6'
            '29921b96b2b0f537a4dd29589164c7f53e8061cf376139b20c9628ed'
            '4eae57626b7475f0df31a04386e94cefc2cd8e8e1f30bd1a4a10e5bf'
            '64e4629766367d8c5419e592921746bc1f1d262c11c6817bef26ef1e'
            '1e05bf3311ff90e39f2bdb8566ee9b0e0425c4f4b4c000d1efdb2ddd'
            '5ec4e12bf1a478654068ad87d8989ca228e408853573880670042be4'
            '069d7f1b3c2e7db1c52d59ebadc7eff17bd2cdfe8782990fe0ee7cce'
            '9f1d570a415b19713e3b392cd51a093ce08353f473b6b5c8992b5fff'
            '9f73647bc1c878808d3463eb84a7a426b263c5717fced1ebe9b9c412'
            'dae3f3ba37fb8024117c4bd83ec47ba910761b9fc652a723fdc2a6ec')
sha384sums=('aeb79c6553f2913cb3f7e5a95e67d512ea5a063ef12a4dba8da264ed3f4c1885b059553e1c004415ae95cad87414a146'
            'SKIP'
            '9ceaa30acab1b0426f781ef1695768f7b9a8e77c9c4c33cbff3d27c92e8903014a41bc484122e10cf47fc693757ac214'
            'SKIP'
            '73f8c1d03e47278bd20e144210572a80a152c5ea1ad5f486d134b5cfec3ab2d0a6c76e917b2b7cdc10799a1182fe1903'
            'f7c95513e185393a526043eb0f5ecf1f800840ab3b2ed223532bb9d40ddcce44c5fab5f4b528cfd2a89bf67ad764751d'
            'dc9ff30c2501d14675e8ef21a7c86eebf752700c216cb6c5034ca0b16a17465e41392772757b1551bbf7bf0f177cd6af'
            '8cb9bd89319b3f7631d2947bd8e33e68cfe8159bb35d4213e1e0eb3a16611950e9e239202741b319781fbc3cf6163ff2'
            'daa8d8e66647ee9a8a3c93f4d4d80266aad327cb1dbe5c5dbcc9847c70db4241f2cb8a59ba97ed93242252fd68168217'
            'b25cf32c199a890e78ad449816da0dde33cc5cde547843aff6cdea6e73df2e965cb958cfb187d1e84eb0fe4cf99332ca'
            'eab6b2d210e69cea76b7d4edc1f5b89c77674b5022018e5d9c2526a27a5d4b61c75e6c566ef7b749d0e107658ddc4392'
            '07f815e56c32b0bae28e3a6d250f507f7db098135d21302cb73114d47432e7d3e3fb232aae0656ef15d01d776393a12d'
            'a3456148ef9479a3edc0a978377914d3f81441b4c565cfabb225d8dfe147505343b96dd5fe854bb3863fd42225b39eb3'
            '546356376d35c9654df085b0b71eb2788588c0d145dd313a8e75af7d4a473d04dba7f914133b606c2c3192bb5892f83a')
sha512sums=('4d9de340a26155a89ea8773131c76220cc2057f2b5d031b467b60e8b14c1842518e2d60a863d8c695f0f7640f3f18d43826201984a238dade857b6cef79837db'
            'SKIP'
            '8a44e961cc1e3d236e2fc0ccceea6d1544b75caa2278507b4afba076850dd0185f07b64d1367a6469eb67b4fe03cfb76cd58c19fd825d64eec5a18cc0f79fea6'
            'SKIP'
            'c6971a707db4941ab6121c27c0a031fee03f229e511d7451d0f814a1f692ab534a178ee0af3a962780a0fc823bee0864c1efcd3e5d855c766cfe4fa66ea7f675'
            '7ad5be75ee422dda3b80edd2eb614d8a9181e2c8228cd68b3881e2fb95953bf2dea6cbe7900ce1013c9de89b2802574b7b24869fc5d7a95d3cc3112c4d27063a'
            '4a8b324aee4cccf3a512ad04ce1a272d14e5b05c8de90feb82075f55ea3845948d817e1b0c6f298f5816834ddd3e5ce0a0e2619866289f3c1ab8fd2f35f04f44'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            '26619b938a47c841f0c480a113cfbb1ee6f1121c21dfecbe246c1f7af7697f86cfb8253f09966eab2e386734ce4ad156159babdba4365c2f199c369c3d7e8ee8'
            'f6aed92697c35e7919a0d784185e7af15b6be2762e3dd235267ca9744a826ac693d0ffcb07b9d1cc8571f57d518c1ce1c276cf7677e8375188f05f71d4added0'
            'cc8852b089aa24f588ad1af726503ecd1012ad7e1cbc47ea77f03a5f7aecd25306d40f2e16b8a1afeafe7e2e97b6b6840c9f462ed7be358090117e2e024df1bd'
            '42025ed8ec4c6ccca7f83f59e75cbeb9c5b342854d54117362d39c3000f6c4e46b10ec70641e4fb716d437f864fcc00321f57234cec6766c51939ffe5aeb8952'
            'db1c4f246f514b955e3a10d5c7d7568819239439a57f965b424a8b76d167e8552226c6595e6bb1411ac0c28f5f8d80a31f73b9f4f79f53f412a7a2a2396c38ed'
            '77f05a4b317c246823847b1afa07a13868e44b6a8016632e10a68057e09ef3b04deffabf60b1c9ce22be290dd40dcffb14bea428127300174af6d8afcad5f3d9')
