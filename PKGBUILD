# $Id$
# Maintainer: shmilee <shmilee.zju@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

# last/latest "longterm maintenance" kernel releases
# https://www.kernel.org/category/releases.html
# 5.4 Greg Kroah-Hartman & Sasha Levin 2019-11-24 Dec, 2025
_LLL_VER=5.4
_LLL_SUBVER=87

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
_UKSM_COMMIT=9b68301484619b60af2515f782160cdfe6c168f3
_UKSM_PATCH_SRC="https://github.com/dolohow/uksm/raw/${_UKSM_COMMIT}/v5.x/uksm-${_LLL_VER}.patch"
_UKSM_PATCH_PATCH=(
    'uksm-patch-for-5.4.33+.patch'
    'uksm-patch-for-5.4.69+.patch'
)

# CJKTTY patch 
# https://github.com/Gentoo-zh/linux-cjktty
_CJKTTY_PATCH_URL="https://github.com/torvalds/linux/compare/v${_LLL_VER}...Gentoo-zh:${_LLL_VER}-utf8.patch"
_CJKTTY_PATCH_SRC="cjktty-${_LLL_VER}.patch::${_CJKTTY_PATCH_URL}"
# https://github.com/zhmars/cjktty-patches
#_CJKTTY_COMMIT=0acfa3fdfe900ad15e56b513be70061f86cfe606
#_CJKTTY_PATCH_SRC="https://github.com/zhmars/cjktty-patches/raw/${_CJKTTY_COMMIT}/v5.x/cjktty-${_LLL_VER}.patch"
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
makedepends=(
    'bc' 'kmod' 'libelf' 'pahole' 'cpio' 'perl' 'tar' 'xz'
    'xmlto' 'python-sphinx' 'python-sphinx_rtd_theme' 'graphviz' 'imagemagick')
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
        ${_CJKTTY_PATCH_SRC}
        ${_CJKTTY_PATCH_PATCH[@]}
        'sphinx-workaround.patch'
        'config'         # the main kernel config file
)
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman 
)
# https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
sha256sums=('bf338980b1670bca287f9994b7441c2361907635879169c64ae78364efc5f491'
            'SKIP'
            'cb107fecf0606a87f46694f0afbb80011190b47cd99c9063d98284012811bb83'
            'f445eea4d0ec2015a25f1ad625c848f4f2252099795966fa4105e0aa29674c5c'
            'a10a4848c7a9842c0c7760b087ea38a4356dc1a2c2e26334cb0106c25785554f'
            '0334391900f31d6aaedaa68e8917f93262ba3e523f2654774b289e9b18c1a923'
            '961ed94b8d905f1e901cacb08d253c4170af0a25828111b7558d9c874e923558'
            '81d34bf02e771a126af5cb382d44a86dcc759c88b7c89fc7e5b7737731b9130e'
            '6826624f65276927de012f040e77b02231fe6345b9da7c702deacd9372ea001e'
            'cdcd0e0ebd24d9b66c216df01b02da23760a44fe2a451137190f89d18a4c7f59'
            '50213f3270499fceb452946252d61f5471571c77baf3dd510fbb00cfa9831c9a'
            'fa7950b5763a592ca2a04c423842451ac79633deebf77c730fc8ee35dfac2d45'
            '81bb112fed28c8ef22d7e02eb4150a76c8d549c72775e65cd3ecf10fa5fe1b4e'
            '7b3eea4462811a26c3c32721009a807dcaee5b8fbf1ad3e0cdad851679c9246e'
            '0c6385f8d5a61b09d046babe5351ca638ccb5a263e0f167d2b311f57054bc8d1'
            'b7c814c8183e4645947a6dcc3cbf80431de8a8fd4e895b780f9a5fd92f82cb8e'
            '7ce388e429d8df479a721285e445e116c5ee41e3126a702862e59056460b655e')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

_kernelname=${pkgbase#linux}

if [ "$_Bisect_debug" != "off" ]; then
  makedepends+=('wget' 'modprobed-db')
  PKGEXT='.pkg.tar'
fi

prepare() {
  cd ${_srcname}

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  # add upstream patch
  patch -p1 -i ../patch-${pkgver}

  # Bisect debug
  if [ "$_Bisect_debug" == "on" ]; then
    msg2 "Patching upstream v$pkgver --> $_bcommit"
    if [ ! -f "${srcdir}/../v${pkgver}-${pkgrel}-$_bcommit" ]; then
      wget "$_bpatch" -O "${srcdir}/../v${pkgver}-${pkgrel}-$_bcommit"
    fi
    patch -p1 -i "${srcdir}/../v${pkgver}-${pkgrel}-$_bcommit"
  fi

  # fix naming schema in EXTRAVERSION of ck patch set
  sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "../patch-${_LLL_VER}-ck${_CK_VER}"
  # Patch source with ck patch set
  msg2 "Patching source with ck${_CK_VER} including BFS MuQSS"
  cp "../patch-${_LLL_VER}-ck${_CK_VER}" "../patch-${_LLL_VER}.${_LLL_SUBVER}-ck${_CK_VER}"
  for p in ${_CK_PATCH_PATCH[@]}; do
    patch -Ni ../$p "../patch-${_LLL_VER}.${_LLL_SUBVER}-ck${_CK_VER}"
  done
  patch -Np1 -i "../patch-${_LLL_VER}.${_LLL_SUBVER}-ck${_CK_VER}"

  # Bisect debug result
  if [ "$_Bisect_debug" != "on" ]; then
    #see https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/patch/?id=f7757368e0f0b3e108088ca7b5b8abda6faa7ebc
    patch -p1 -i "../ck-fix-broken-sleep2ram-5.4.48+.patch"
    #:
  fi

  msg2 "Patching source with uksm ${_UKSM_VER} patches"
  cp "../uksm-${_LLL_VER}.patch" "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"
  for p in ${_UKSM_PATCH_PATCH[@]}; do
    patch -Ni ../$p "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"
  done
  patch -Np1 -i "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"

  msg2 "Patching source with Gentoo-zh/linux-cjktty patches"
  cp "../cjktty-${_LLL_VER}.patch" "../cjktty-${_LLL_VER}.${_LLL_SUBVER}.patch"
  for p in ${_CJKTTY_PATCH_PATCH[@]}; do
    patch -Ni ../$p "../cjktty-${_LLL_VER}.${_LLL_SUBVER}.patch"
  done
  patch -Np1 -i "../cjktty-${_LLL_VER}.${_LLL_SUBVER}.patch"

  msg2 "Patching sphinx extensions for htmldocs"
  patch -Np1 -i ../sphinx-workaround.patch

  echo "Setting config..."
  cp -Tf ../config .config

  # Optionally disable NUMA for 64-bit kernels only
  if [ -n "$_NUMA_disable" ] && [ "${CARCH}" = "x86_64" ]; then
      msg2 "Disabling NUMA from kernel config..."
      sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
        -i -e '/CONFIG_AMD_NUMA=y/d' \
        -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
        -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
        -i -e '/# CONFIG_NUMA_EMU is not set/d' \
        -i -e '/CONFIG_NODES_SHIFT=6/d' \
        -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
        -i -e '/# CONFIG_MOVABLE_NODE is not set/d' \
        -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
        -i -e '/CONFIG_ACPI_NUMA=y/d' .config
  fi

  if [ "$_Bisect_debug" != "off" ]; then
    make LSMOD=$HOME/.config/modprobed.db localmodconfig
  fi

  # rewrite configuration
  yes "" | make olddefconfig >/dev/null

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  #sed -i '2iexit 0' scripts/depmod.sh

  make -s kernelrelease >version
  msg2 "Prepared $pkgbase version $(<version)"
}

build() {
  cd ${_srcname}

  if [ "$_Bisect_debug" == "off" ]; then
    make ${MAKEFLAGS} all htmldocs
  else
    make ${MAKEFLAGS} all
  fi
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the ${_PATHSET_DESC} patchsets"
  depends=('coreutils' 'kmod' 'mkinitcpio')
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=('VIRTUALBOX-GUEST-MODULES' 'WIREGUARD-MODULE')
  replaces=('virtualbox-guest-modules-arch' 'wireguard-arch')

  cd ${_srcname}
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

  cd ${_srcname}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  msg2 "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    msg2 "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg2 "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

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
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  msg2 "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-docs() {
  pkgdesc="Documentation that comes with the ${pkgbase/linux/Linux} kernel"

  cd ${_srcname}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}

for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done
