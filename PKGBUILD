# $Id$
# Maintainer: shmilee <shmilee.zju@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

# last/latest "longterm maintenance" kernel releases
# https://www.kernel.org/category/releases.html
# 5.4 Greg Kroah-Hartman & Sasha Levin 2019-11-24 Dec, 2021
_LLL_VER=5.4
_LLL_SUBVER=86

# Bisect debug, v5.4.47 -> v5.4.48
_Bisect_debug=off # on, test, off
if [ "$_Bisect_debug" == "on" ]; then
  _burlbase=https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
  _bcommit=f7757368e0f0b3e108088ca7b5b8abda6faa7ebc #Peter, 8 x
# _bcommit=2e256dd5b05561b051e895121530d2a0062c7a0f #Jann, 10 v
# _bdiff="$_burlbase/diff/?h=linux-${_LLL_VER}.y&id2=v${_LLL_VER}.${_LLL_SUBVER}&id=$_bcommit"
  _bpatch="$_burlbase/rawdiff/?h=linux-${_LLL_VER}.y&id2=v${_LLL_VER}.${_LLL_SUBVER}&id=$_bcommit"
  msg "Bisect debug on: v${_LLL_VER}.${_LLL_SUBVER} --> $_bcommit"
  msg "Bisect debug patch: $_bpatch"
fi

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU can actually run slower with NUMA enabled.
# Most users can disable NUMA.
# see, https://bugs.archlinux.org/task/31187
_NUMA_disable=y

# Add ck patch set
# http://ck.kolivas.org/patches/5.0/
# https://wiki.archlinux.org/index.php/Linux-ck
_CK_VER=1
_CK_PATCH_SRC="http://ck.kolivas.org/patches/5.0/${_LLL_VER}/${_LLL_VER}-ck${_CK_VER}/patch-${_LLL_VER}-ck${_CK_VER}.xz"
_CK_PATCH_PATCH=(
    'ck-patch-for-5.4.57+.patch'
    'ck-patch-for-5.4.62+.patch'
)

# Ultra Kernel Samepage Merging
_UKSM_VER=0.1.2.6
_UKSM_COMMIT=150e27c4e7f66e4519c89573305eca8c42091f4d
_UKSM_PATCH_SRC="https://raw.githubusercontent.com/dolohow/uksm/${_UKSM_COMMIT}/v5.x/uksm-${_LLL_VER}.patch"
_UKSM_PATCH_PATCH=(
    'uksm-patch-for-5.4.33+.patch'
    'uksm-patch-for-5.4.69+.patch'
)

# CJKTTY patch 
# https://github.com/Gentoo-zh/linux-cjktty
# https://github.com/torvalds/linux/compare/v5.4...Gentoo-zh:5.4-utf8.patch
_CJKURL_C='https://github.com/Gentoo-zh/linux-cjktty/commit'
_CJKTTY_PATCH=(
    "cjktty-10-fix-255-glyph-limit-prepare-for-CJK-font-support.patch"
    "cjktty-20-diable-setfont-if-we-have-cjk-font-in-kernel.patch"
    "cjktty-30-add-cjk-font-that-has-65536-chars.patch"
    "cjktty-40-fix-depend-issue.patch"
)
_CJKTTY_PATCH_SRC=(
    "cjktty-10-fix-255-glyph-limit-prepare-for-CJK-font-support.patch::${_CJKURL_C}/345872b7b6ef67e59e26d45d2a1c8fda6b88f106.patch"
    "cjktty-20-diable-setfont-if-we-have-cjk-font-in-kernel.patch::${_CJKURL_C}/71ce685ec1f606831b74d7bad8731545a0f37829.patch"
    "cjktty-30-add-cjk-font-that-has-65536-chars.patch::${_CJKURL_C}/531825eef130af268a2b144a70d852cf56de346e.patch"
    "cjktty-40-fix-depend-issue.patch::${_CJKURL_C}/52bee61535169e59522f450201112d2f4fdfbeb5.patch"
)
_CJKTTY_PATCH_PATCH=(
    'cjktty-11-patch-for-5.4.36+.patch'
    'cjktty-11-patch-for-5.4.54+.patch'
    'cjktty-11-patch-for-5.4.62+.patch'
    'cjktty-12-patch-for-5.4.66+.patch'
)

_PATHSET_DESC="ck${_CK_VER} uksm-${_UKSM_VER} and cjktty"

pkgbase=linux-shmilee
pkgname=("${pkgbase}" "${pkgbase}-headers")
if [ "$_Bisect_debug" == "off" ]; then
  pkgname+=("${pkgbase}-docs")
fi
_srcname=linux-${_LLL_VER}
pkgver=${_LLL_VER}.${_LLL_SUBVER}
pkgrel=1
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'kmod' 'inetutils' 'bc' 'libelf' 'python-sphinx' 'graphviz')
options=('!strip')
source=(
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.xz"
        #"https://www.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.sign"
        ${_CK_PATCH_SRC}
        ${_CK_PATCH_PATCH[@]}
        'ck-fix-broken-sleep2ram-5.4.48+.patch' # https://github.com/zen-kernel/zen-kernel/commit/fb7e2cfaf61cf5f9c2336331e73296f455bd2d51.patch
        ${_UKSM_PATCH_SRC}
        ${_UKSM_PATCH_PATCH[@]}
        ${_CJKTTY_PATCH_SRC[@]}
        ${_CJKTTY_PATCH_PATCH[@]}
        'sphinx-workaround.patch'
        'config'         # the main kernel config file
        '60-linux.hook'  # pacman hook for depmod
        '90-linux.hook'  # pacman hook for initramfs regeneration
        'linux.preset'   # standard config files for mkinitcpio ramdisk
)
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman 
)
# https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
sha256sums=('bf338980b1670bca287f9994b7441c2361907635879169c64ae78364efc5f491'
            'SKIP'
            '203ac7aee6f196f8a3ae5e98b214baf79d0d7924477cf3b262b6bb6658d68f05'
            'f445eea4d0ec2015a25f1ad625c848f4f2252099795966fa4105e0aa29674c5c'
            'a10a4848c7a9842c0c7760b087ea38a4356dc1a2c2e26334cb0106c25785554f'
            '0334391900f31d6aaedaa68e8917f93262ba3e523f2654774b289e9b18c1a923'
            '961ed94b8d905f1e901cacb08d253c4170af0a25828111b7558d9c874e923558'
            '81d34bf02e771a126af5cb382d44a86dcc759c88b7c89fc7e5b7737731b9130e'
            '6826624f65276927de012f040e77b02231fe6345b9da7c702deacd9372ea001e'
            'cdcd0e0ebd24d9b66c216df01b02da23760a44fe2a451137190f89d18a4c7f59'
            '1f3c99cfa8c422c11ea139333e4c7da86d994965dee99ae0849e4b85bfd3b269'
            '99e90ec64a933f39182d3e6030708b410eb06072c2e69330e9a38868b4073856'
            '48c6d877bbe0613d407b3ba069edc26b2447a86ea5b5e79f257087986a3731d5'
            '7ec0d906fa5a199cb46e3d6b42b11aca566eb714682e586d3bbf95702f9d9564'
            'fa7950b5763a592ca2a04c423842451ac79633deebf77c730fc8ee35dfac2d45'
            '81bb112fed28c8ef22d7e02eb4150a76c8d549c72775e65cd3ecf10fa5fe1b4e'
            '7b3eea4462811a26c3c32721009a807dcaee5b8fbf1ad3e0cdad851679c9246e'
            '0c6385f8d5a61b09d046babe5351ca638ccb5a263e0f167d2b311f57054bc8d1'
            'b7c814c8183e4645947a6dcc3cbf80431de8a8fd4e895b780f9a5fd92f82cb8e'
            '7ce388e429d8df479a721285e445e116c5ee41e3126a702862e59056460b655e'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65')

_kernelname=${pkgbase#linux}

if [ "$_Bisect_debug" != "off" ]; then
  makedepends+=('wget' 'modprobed-db')
  PKGEXT='.pkg.tar'
fi

prepare() {
  cd ${_srcname}

  # add upstream patch
  patch -p1 -i ../patch-${pkgver}

  # Bisect debug
  if [ "$_Bisect_debug" == "on" ]; then
    msg "Patching upstream v$pkgver --> $_bcommit"
    if [ ! -f "${srcdir}/../v${pkgver}-${pkgrel}-$_bcommit" ]; then
      wget "$_bpatch" -O "${srcdir}/../v${pkgver}-${pkgrel}-$_bcommit"
    fi
    patch -p1 -i "${srcdir}/../v${pkgver}-${pkgrel}-$_bcommit"
  fi

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # fix naming schema in EXTRAVERSION of ck patch set
  sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "../patch-${_LLL_VER}-ck${_CK_VER}"
  # Patch source with ck patch set
  msg "Patching source with ck${_CK_VER} including BFS"
  cp "../patch-${_LLL_VER}-ck${_CK_VER}" "../patch-${_LLL_VER}.${_LLL_SUBVER}-ck${_CK_VER}"
  for p in ${_CK_PATCH_PATCH[@]}; do
    patch -Ni ../$p "../patch-${_LLL_VER}.${_LLL_SUBVER}-ck${_CK_VER}"
  done
  patch -Np1 -i "../patch-${_LLL_VER}.${_LLL_SUBVER}-ck${_CK_VER}"
  # Bisect debug result about ck
  if [ "$_Bisect_debug" != "on" ]; then
    #see https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/patch/?id=f7757368e0f0b3e108088ca7b5b8abda6faa7ebc
    patch -p1 -i "../ck-fix-broken-sleep2ram-5.4.48+.patch"
  fi

  msg "Patching source with uksm ${_UKSM_VER} patches"
  cp "../uksm-${_LLL_VER}.patch" "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"
  for p in ${_UKSM_PATCH_PATCH[@]}; do
    patch -Ni ../$p "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"
  done
  patch -Np1 -i "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"

  msg "Patching source with Gentoo-zh/linux-cjktty patches"
  mkdir ../cjktty-patches
  for p in ${_CJKTTY_PATCH[@]}; do
    cp ../$p ../cjktty-patches/
  done
  cd ../cjktty-patches
  for p in ${_CJKTTY_PATCH_PATCH[@]}; do
    patch -Ni ../$p
  done
  cd ../${_srcname}
  for p in ${_CJKTTY_PATCH[@]}; do
    patch -Np1 -i "../cjktty-patches/$p"
  done

  msg "Patching sphinx extensions for htmldocs"
  patch -Np1 -i ../sphinx-workaround.patch

  cp -Tf ../config .config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # Optionally disable NUMA for 64-bit kernels only
  if [ -n "$_NUMA_disable" ] && [ "${CARCH}" = "x86_64" ]; then
      msg "Disabling NUMA from kernel config..."
      sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
        -i -e '/CONFIG_AMD_NUMA=y/d' \
        -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
        -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
        -i -e '/# CONFIG_NUMA_EMU is not set/d' \
        -i -e '/CONFIG_NODES_SHIFT=6/d' \
        -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
        -i -e '/# CONFIG_MOVABLE_NODE is not set/d' \
        -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
        -i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
  fi

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

  if [ "$_Bisect_debug" != "off" ]; then
    make LSMOD=$HOME/.config/modprobed.db localmodconfig
  fi

  # rewrite configuration
  yes "" | make config >/dev/null
}

build() {
  cd ${_srcname}

  if [ "$_Bisect_debug" == "off" ]; then
    make ${MAKEFLAGS} LOCALVERSION= bzImage modules htmldocs
  else
    make ${MAKEFLAGS} LOCALVERSION= bzImage modules
  fi
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the ${_PATHSET_DESC} patchsets"
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'kmod' 'mkinitcpio')
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

  cd ${_srcname}

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}

  msg2 "Installing boot image..."
  install -Dm644 "$(make -s image_name)" "${pkgdir}/boot/vmlinuz-${pkgbase}"

  msg2 "Installing modules..."
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}/usr" modules_install

  # make room for external modules
  local _extramodules="extramodules-${_basekernel}${_kernelname:--ARCH}"
  ln -s "../${_extramodules}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

  # remove build and source links
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}

  # remove the firmware
  rm -rf "${pkgdir}/usr/lib/firmware"

  # now we call depmod...
  depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"

  msg2 "Installing hooks..."  
  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|${pkgbase}|g
    s|%KERNVER%|${_kernver}|g
    s|%EXTRAMODULES%|${_extramodules}|g
  "

  # hack to allow specifying an initially nonexisting install file
  sed "${_subst}" "${startdir}/${install}" > "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  # install mkinitcpio preset file and pacman hooks
  sed "${_subst}" ../linux.preset | install -Dm644 /dev/stdin \
    "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  sed "${_subst}" ../60-linux.hook | install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" ../90-linux.hook | install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

  cd ${_srcname}
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  msg2 "Installing build files..."
  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers System.map vmlinux
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile
  install -Dt "${_builddir}/arch/x86" -m644 arch/x86/Makefile
  cp -t "${_builddir}" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # ???
  mkdir "${_builddir}/.tmp_versions"

  msg2 "Installing headers..."
  cp -t "${_builddir}" -a include
  cp -t "${_builddir}/arch/x86" -a arch/x86/include
  install -Dt "${_builddir}/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "${_builddir}/{}" \;

  msg2 "Removing unneeded architectures..."
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */x86/ ]] && continue
    rm -r "${_arch}"
  done

  msg2 "Removing files already in linux-docs package..."
  rm -r "${_builddir}/Documentation"

  msg2 "Removing broken symlinks..."
  find -L "${_builddir}" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "${_builddir}" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "${_builddir}" -type f -perm -u+x ! -name vmlinux -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "${_builddir}" "$pkgdir/usr/src/$pkgbase-$pkgver"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"

  cd ${_srcname}
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  msg2 "Installing documentation..."
  mkdir -p "${_builddir}"
  cp -t "${_builddir}" -a Documentation

  msg2 "Removing doctrees..."
  rm -r "${_builddir}/Documentation/output/.doctrees"

  msg2 "Moving HTML docs..."
  local src dst
  while read -rd '' src; do
    dst="${_builddir}/Documentation/${src#${_builddir}/Documentation/output/}"
    mkdir -p "${dst%/*}"
    mv "$src" "$dst"
    rmdir -p --ignore-fail-on-non-empty "${src%/*}"
  done < <(find "${_builddir}/Documentation/output" -type f -print0)

  msg2 "Adding symlink..."
  mkdir -p "${pkgdir}/usr/share/doc"
  ln -sr "${_builddir}/Documentation" "${pkgdir}/usr/share/doc/${pkgbase}"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "${pkgdir}"
}

for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done
