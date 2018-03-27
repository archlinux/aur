# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com> PGP-Key: BDB26C5A
# Contributor: shivik <> PGP-Key: 761E423C
# Contributor: Michael Duell <mail@akurei.me> PGP-Key: 6EE23EBE
# A special thanks to Steven Barrett for very important sugestions 

###########################################################################################################
#                                          Patch and Build Options
###########################################################################################################
_custom="no"		# "m":	custom config via menuconfig
			# "n":	custom config via nconfig
			# "x":	custom config via xconfig
			# "no":	nothing

_config="pkg"		# "local":	compile only probed modules(https://aur.archlinux.org/packages/modprobed-db/)
			# "nomod":	don't use modules(make localyesconfig)
			# "old":	make with old config (/proc/config.gz)
			# "pkg":	use this package's config

_akcs=""		# Append Kernel Custom String.Not working on some systems.
			# Use if you wnat to append a custom string to kernel version.
			# No risc if you have a backup kernel in case of boot failure.

_use_MUQSS="yes"		# "yes":	Use MUQSS cpu scheduler.
			        # "no":		Use CFS cpu scheduler.

_use_KSM="no"		# "yes":	Enable Kernel SamePage Merging (KSM).
			# "no":		Don't use Kernel SamePage Merging (KSM).

###########################################################################################################

pkgdesc='A desktop oriented kernel and modules with Liquorix patches'
__basekernel=4.15
_minor=13
pkgver=${__basekernel}.${_minor}
pkgrel=1
lqxrel=1
pkgbase=linux-lqx
# pkgname=('linux-lqx' 'linux-lqx-headers' 'linux-lqx-docs')
_lqxpatchname="${pkgver}-${lqxrel}.patch"
arch=('x86_64')
license=('GPL2')
url="http://liquorix.net/"

if [ "$_custom" = "x" ]; then
   makedepends=('qt5-base' 'kmod' 'inetutils' 'bc' 'libelf')
else
   makedepends=('kmod' 'inetutils' 'bc' 'libelf')
fi

options=(!strip)
install='linux.install'
source=("https://www.kernel.org/pub/linux/kernel/v4.x/linux-${__basekernel}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${__basekernel}.tar.sign"
        "https://liquorix.net/sources/${_lqxpatchname}.gz"
        "https://liquorix.net/sources/${__basekernel}/config.amd64"
         # pacman hook for depmod
        '60-linux.hook'
         # pacman hook for initramfs regeneration
        '90-linux.hook'
         # pacman hook for remove initramfs
        '99-linux.hook'
         # standard config files for mkinitcpio ramdisk
        'linux.preset')

sha512sums=('c00d92659df815a53dcac7dde145b742b1f20867d380c07cb09ddb3295d6ff10f8931b21ef0b09d7156923a3957b39d74d87c883300173b2e20690d2b4ec35ea'
            'SKIP'
            'b15efb2068ccb675eb8752276d2c6aa786757a25da57ff220c3c39eb05dd431b63d0e930873f2b5f412b50d7540b5a8654d4af582af53554564bd3418797db50'
            '2aa8c86962a13df5e513132aee3c21dd3daeb5d10c94e1af44f261f3a2b3ba3ba201aea418fc253ecfc77aab9d54835a7b5b9fe051ce0795dfbc9adf344c3734'
            '7ad5be75ee422dda3b80edd2eb614d8a9181e2c8228cd68b3881e2fb95953bf2dea6cbe7900ce1013c9de89b2802574b7b24869fc5d7a95d3cc3112c4d27063a'
            '4a8b324aee4cccf3a512ad04ce1a272d14e5b05c8de90feb82075f55ea3845948d817e1b0c6f298f5816834ddd3e5ce0a0e2619866289f3c1ab8fd2f35f04f44'
            '6346b66f54652256571ef65da8e46db49a95ac5978ecd57a507c6b2a28aee70bb3ff87045ac493f54257c9965da1046a28b72cb5abb0087204d257f14b91fd74'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf')
            
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
             )

_kernelname=${pkgbase#linux}
: ${_kernelname:=-ARCH}

prepare() {
  KARCH=x86

  cd ${srcdir}/linux-${__basekernel}

  # Add Liquorix patches
  patch -Np1 -i ../$_lqxpatchname

    # Trying oldcfg if possible and if selected
  if [ "$_config" = "old" ]; then
    if [ -e /proc/config.gz ]; then
      zcat /proc/config.gz > ./.config
    else
      echo "WARNING: There's no /proc/config.gz... You cannot use the old config. Aborting..."
      exit 1
    fi         
  else
      cat ../config.amd64 >./.config
  fi

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  #Disable MUQSS cpu scheduler in config
  if [ "${_use_MUQSS}" = "no" ]; then
    sed -i -e 's/CONFIG_SCHED_MUQSS=y/# CONFIG_SCHED_MUQSS is not set/' ./.config
  fi

  #Enable KSM (Kernel SamePage Merging)
  if [ "${_use_KSM}" = "yes" ]; then
    sed -i -e 's/# CONFIG_KSM is not set/CONFIG_KSM=y/' ./.config
    sed -i '/CONFIG_KSM=y/a \CONFIG_UKSM=y/n' ./.config
    sed -i '/CONFIG_UKSM=y/a \# CONFIG_KSM_LEGACY is not set' ./.config
  fi

  # set extraversion to pkgrel and empty localversion
  sed -e "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" \
      -e "/^EXTRAVERSION =/aLOCALVERSION =" \
      -i Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # set sublevel to kernel minor version
  sed -ri "s|^(SUBLEVEL =).*|\1 ${_minor}|" Makefile

  msg "Running make prepare"
  make prepare

### Optionally load needed modules for the make localmodconfig
 # See https://aur.archlinux.org/packages/modprobed-db/
 if [ $_config = "local" ]; then
  msg "If you have modprobe-db installed, running it in recall mode now"
  if [ -e /usr/bin/modprobed-db ]; then
    [[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo. Install via pacman -S sudo and configure to work with this user." && exit 1
    sudo /usr/bin/modprobed-db recall
 fi
  msg "Running Steven Rostedt's make localmodconfig now"
  make localmodconfig
 else
  yes "" | make config
 fi

 if [ $_config = "nomod" ]; then
  msg "Running localYESconfig now"
  make localyesconfig
 else
  yes "" | make config
 fi

  if [ $_custom = "m" ]; then
    msg "Running make menuconfig"
    make menuconfig
  fi

  if [ $_custom = "n" ]; then
    msg "Running make nconfig"
    make nconfig
  fi

  if [ $_custom = "x" ]; then
    msg "Running make xconfig"
    make xconfig
  fi
}

build() {
  cd ${srcdir}/linux-${__basekernel}

  make bzImage modules
}

_package() {
pkgdesc="A desktop oriented kernel and modules with Liquorix patches"
depends=('coreutils' 'linux-firmware' 'mkinitcpio>=0.8')
optdepends=('crda: to set the correct wireless channels of your country' 'nvidia-lqx: nVidia drivers for linux-lqx' 'linux-firmware: Firmware files for Linux')
backup=("etc/mkinitcpio.d/${pkgbase}.preset")
install=linux.install

cd "${srcdir}/linux-${__basekernel}"

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
    sed "${_subst}" ../99-linux.hook |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/99-${pkgbase}.hook"     
}


_package-headers() {
pkgdesc="Header files and scripts to build modules for linux-lqx."
depends=('linux-lqx')

cd "${srcdir}/linux-${__basekernel}"


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
  install -Dt "${_builddir}/drivers/media/dvb-core" -m644 drivers/media/dvb-core/*.h

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
pkgdesc="Kernel hackers manual - HTML documentation that comes with the linux-lqx kernel"
depends=('linux-lqx' )

 cd "${srcdir}/linux-${__basekernel}"

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
