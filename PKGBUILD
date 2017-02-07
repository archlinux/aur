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

_use_32bit_pae="no"	# "yes": Use the PAE config for 32-bit
			# "no": Use normal 32-bit config
###########################################################################################################

pkgdesc='A desktop oriented kernel and modules with Liquorix patches'
__basekernel=4.9
_minor=8
pkgver=${__basekernel}.${_minor}
pkgrel=1
lqxrel=1
pkgbase=linux-lqx
# pkgname=('linux-lqx' 'linux-lqx-headers' 'linux-lqx-docs')
_lqxpatchname="${pkgver}-${lqxrel}.patch"
arch=('i686' 'x86_64')
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
        "https://liquorix.net/sources/${__basekernel}/config.i386"
        "https://liquorix.net/sources/${__basekernel}/config.i386-pae"
        "https://liquorix.net/sources/${__basekernel}/config.amd64"
        "linux.preset"
        "99-linux.hook")

sha512sums=('bf67ff812cc3cb7e5059e82cc5db0d9a7c5637f7ed9a42e4730c715bf7047c81ed3a571225f92a33ef0b6d65f35595bc32d773356646df2627da55e9bc7f1f1a'
            'SKIP'
            'd659e617b15998a3f033ded58e4cd825b500e20414625bb5b6f45b0560bd9bdb14d9e07d4f86033bf5b7a0b199b0a6bb08cdfd63f03c0e1bcd95e2827fd25a0a'
            'c96a9a944e99e099e37b72be65d652b0a28fad8cdf71504173b94fd3bb7c78131bd78ddb664200f2522870c2da4f07fedf05029d363bfb89ea17f17748a43293'
            '65a9baa74bb8290d049e9b9053317c17b9f784c5aaa130a4c7da1eaef814f454a3a7ac6b47090b57563fd26debfdcb5e75c0925be02761d6db42cdff00fafd1a'
            'b05d11b18ea0b57cb3e8ef0bd1387ca50cb25eb586a4530ac02b2ff4135d90f675417505e5d206aabfa9a83707104240c825dab6ff0aef2f3e18d1876a5d9b2a'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            'd6faa67f3ef40052152254ae43fee031365d0b1524aa0718b659eb75afc21a3f79ea8d62d66ea311a800109bed545bc8f79e8752319cd378eef2cbd3a09aba22')
            
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
             )

_kernelname=${pkgbase#linux}

prepare() {
  KARCH=x86

  cd ${srcdir}/linux-${__basekernel}

  # Add Liquorix patches
  patch -Np1 -i ${srcdir}/$_lqxpatchname
  
    # Trying oldcfg if possible and if selected
  if [ "$_config" = "old" ]; then
    if [ -e /proc/config.gz ]; then
      zcat /proc/config.gz > ./.config
    else
      echo "WARNING: There's no /proc/config.gz... You cannot use the old config. Aborting..."
      exit 1
    fi         
  else
    if [ "$CARCH" = "x86_64" ]; then
      cat ../config.amd64 >./.config
    elif [ "${_use_32bit_pae}" = "yes" ]; then
      cat ../config.i386-pae >./.config
    else
      cat ../config.i386 >./.config
    fi
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

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

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

  make ${MAKEFLAGS} LOCALVERSION=${_append_kernel_custom_string} bzImage modules
}

_package() {
pkgdesc="A desktop oriented kernel and modules with Liquorix patches"
depends=('coreutils' 'linux-firmware' 'mkinitcpio>=0.8')
optdepends=('crda: to set the correct wireless channels of your country' 'nvidia-lqx: nVidia drivers for linux-lqx' 'linux-firmware: Firmware files for Linux')
backup=("etc/mkinitcpio.d/${pkgbase}.preset")
install=linux.install

cd "${srcdir}/linux-${__basekernel}"

   KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION=${_append_kernel_custom_string} kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # set correct depmod command for install
  sed -e "s|%PKGBASE%|${pkgbase}|g;s|%KERNVER%|${_kernver}|g" \
    "${startdir}/${install}" > "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  # install mkinitcpio preset file for kernel
  sed "s|%PKGBASE%|${pkgbase}|g" "${srcdir}/linux.preset" |
    install -D -m644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hook for initramfs regeneration
  sed "s|%PKGBASE%|${pkgbase}|g" "${srcdir}/99-linux.hook" |
    install -D -m644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/99-${pkgbase}.hook"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

# Now we call depmod...
depmod -b "$pkgdir" -F System.map "$_kernver"

# move module tree /lib -> /usr/lib
mkdir -p "${pkgdir}/usr"
mv "$pkgdir/lib" "$pkgdir/usr"

install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

_package-headers() {
pkgdesc="Header files and scripts to build modules for linux-lqx."
depends=('linux-lqx')

install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"



cd "${srcdir}/linux-${__basekernel}"


install -D -m644 Makefile \
	"${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
install -D -m644 kernel/Makefile \
	"${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
install -D -m644 .config \
	"${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

for i in acpi asm-generic config crypto drm generated keys linux math-emu \
	media net pcmcia scsi soc sound trace uapi video xen; do
	cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
done

	# copy arch includes for external modules
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
	cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

	# copy files necessary for later builds, like nvidia and vmware
	cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
	cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

	# fix permissions on scripts dir
	chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

	cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

	if [ "${CARCH}" = "i686" ]; then
		cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
	fi

	cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

	# add docbook makefile
	install -D -m644 Documentation/DocBook/Makefile \
	"${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

	# add dm headers
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
	cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

	# add inotify.h
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
	cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

	# add wireless headers
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"
	cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

	# add dvb headers for external modules
	# in reference to:
	# http://bugs.archlinux.org/task/9912
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core"
	cp drivers/media/dvb-core/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core/"
	# and...
	# http://bugs.archlinux.org/task/11194
	###
	### DO NOT MERGE OUT THIS IF STATEMENT
	### IT AFFECTS USERS WHO STRIP OUT THE DVB STUFF SO THE OFFICIAL ARCH CODE HAS A CP
	### LINE THAT CAUSES MAKEPKG TO END IN AN ERROR
	###
	if [ -d include/config/dvb/ ]; then
		mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
		cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
	fi

	# add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
	# in reference to:
	# http://bugs.archlinux.org/task/13146
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
	cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
	cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

	# add dvb headers
	# in reference to:
	# http://bugs.archlinux.org/task/20402
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
	cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
	cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
	cp drivers/media/tuners/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

	# add xfs and shmem for aufs building
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs"
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"

	# copy in Kconfig files
	for i in $(find . -name "Kconfig*"); do
		mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
		cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
	done
	
	  # add objtool for external module building and enabled VALIDATION_STACK option

      if [ -f tools/objtool/objtool ];  then
      mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool"
      cp -a tools/objtool/objtool ${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool/ 
      fi


	chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
	find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

	# strip scripts directory
	find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
	case "$(file -bi "${binary}")" in
	*application/x-sharedlib*) # Libraries (.so)
		/usr/bin/strip ${STRIP_SHARED} "${binary}";;
	*application/x-archive*) # Libraries (.a)
		/usr/bin/strip ${STRIP_STATIC} "${binary}";;
	*application/x-executable*) # Binaries
		/usr/bin/strip ${STRIP_BINARIES} "${binary}";;
	esac
	done
	
	# remove a files already in linux-lqx-docs package
        rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.recursion-issue-01"
        rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.recursion-issue-02"
        rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.select-break"


	 # remove unneeded architectures
	 rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}

_package-docs() {
pkgdesc="Kernel hackers manual - HTML documentation that comes with the linux-lqx kernel"
depends=('linux-lqx' )

 cd "${srcdir}/linux-${__basekernel}"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -al Documentation "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}" -type f -exec chmod 444 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # remove a file already in linux package
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"
}

pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done
