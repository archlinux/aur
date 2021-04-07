# Based on the file created for Arch Linux by:
# Tobias Powalowski <tpowa@archlinux.org>
# Thomas Baechler <thomas@archlinux.org>

# Contributor: Tk-Glitch <ti3nou at gmail dot com>
# Contributor: Hyper-KVM <hyperkvmx86 at gmail dot com>

_where="$PWD" # track basedir as different Arch based distros are moving srcdir around
_ispkgbuild="true"

source "$_where"/customization.cfg # load default configuration from file
source "$_where"/prepare

if [ -e "$_EXT_CONFIG_PATH" ]; then
  msg2 "External configuration file $_EXT_CONFIG_PATH will be used and will override customization.cfg values."
  source "$_EXT_CONFIG_PATH"
fi

_tkg_initscript

if [[ "$_sub" = rc* ]]; then
  _srcpath="linux-${_basekernel}-${_sub}"
  kernel_site="https://git.kernel.org/torvalds/t/linux-${_basekernel}-${_sub}.tar.gz"
else
  _srcpath="linux-${_basekernel}"
  kernel_site="https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_basekernel}.tar.xz"
  patch_site="https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-${_basekernel}.${_sub}.xz"
fi

#_srcpath="bcachefs"
#kernel_site="git+https://github.com/koverstreet/bcachefs.git"
#patch_site="https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-${_basekernel}.${_sub}.xz"

if [ -n "$_custom_pkgbase" ]; then
  pkgbase="${_custom_pkgbase}"
else
  pkgbase=linux"${_basever}"-tkg-"${_cpusched}"${_compiler_name}
fi
pkgname=("${pkgbase}" "${pkgbase}-headers")
pkgver="${_basekernel}"."${_sub}"
pkgrel=144
pkgdesc='Linux-tkg with bcachefs'
arch=('x86_64') # no i686 in here
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('bison' 'xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'libelf' 'pahole' 'patchutils' 'flex' 'python-sphinx' 'python-sphinx_rtd_theme' 'graphviz' 'imagemagick' 'git' 'cpio' 'perl' 'tar' 'xz')
if [ "$_compiler_name" = "-llvm" ]; then
  makedepends+=( 'lld' 'clang' 'llvm')
fi
optdepends=('schedtool')
options=('!strip' 'docs')

	opt_ver="5.8%2B"
    source=("$kernel_site"
        "$patch_site"
        "https://raw.githubusercontent.com/graysky2/kernel_gcc_patch/master/more-uarches-for-kernel-5.8%2B.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-config/5.10/config.x86_64" # stock Arch config
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-config/5.10/config_hardened.x86_64" # hardened Arch config
        90-cleanup.hook
        cleanup
        # ARCH Patches
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch"
        # TkG
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0002-clear-patches.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0003-glitched-base.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0003-glitched-cfs.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0004-glitched-ondemand-muqss.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0004-glitched-muqss.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0004-5.10-ck1.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0005-undead-glitched-ondemand-pds.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0005-undead-glitched-pds.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0005-v5.10_undead-pds099o.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0005-glitched-pds.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0006-add-acs-overrides_iommu.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0007-v5.10-fsync.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0007-v5.10-futex2_interface.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0008-5.10-bcachefs.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0009-glitched-ondemand-bmq.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0009-glitched-bmq.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0009-prjc_v5.10-r2.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0012-linux-hardened.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.10/0012-misc-additions.patch"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-config/ryzen-desktop-profile.cfg"
        "https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-config/generic-desktop-profile.cfg"
    )
    sha256sums=('dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43'
            '9058a5ba820e8a6e76bf0f7e622484b919666447fc266e3ed9b2c3d0d747470e'
            'SKIP'
            '4720ffe4c063ec948918cadf7498e96be8a035717e587b4c949d3c2a4471d5d9'
            'eb1da1a028a1c967222b5bdac1db2b2c4d8285bafd714892f6fc821c10416341'
            '1e15fc2ef3fa770217ecc63a220e5df2ddbcf3295eb4a021171e7edd4c6cc898'
            '66a03c246037451a77b4d448565b1d7e9368270c7d02872fbd0b5d024ed0a997'
            'f6383abef027fd9a430fd33415355e0df492cdc3c90e9938bf2d98f4f63b32e6'
            '35a7cde86fb94939c0f25a62b8c47f3de0dbd3c65f876f460b263181b3e92fc0'
            '1ac97da07e72ec7e2b0923d32daacacfaa632a44c714d6942d9f143fe239e1b5'
            '7058e57fd68367b029adc77f2a82928f1433daaf02c8c279cb2d13556c8804d7'
            'c605f638d74c61861ebdc36ebd4cb8b6475eae2f6273e1ccb2bbb3e10a2ec3fe'
            '2bbbac963b6ca44ef3f8a71ec7c5cad7d66df860869a73059087ee236775970a'
            'e00096244e5cddaa5500d08b5f692fd3f25be9401dfa3b0fc624625ff2f5e198'
            '62496f9ca788996181ef145f96ad26291282fcc3fb95cdc04080dcf84365be33'
            '31b428c464905e44ed61cdcd1f42b4ec157ebe5a44cb5b608c4c99b466df66ba'
            '06e93b57b7a0b96aefc2c0ec12c3be28c6e8dc8506fa8a22c5a2313814a3c7f3'
            'fca63d15ca4502aebd73e76d7499b243d2c03db71ff5ab0bf5cf268b2e576320'
            '19661ec0d39f9663452b34433214c755179894528bf73a42f6ba52ccf572832a'
            'b302ba6c5bbe8ed19b20207505d513208fae1e678cf4d8e7ac0b154e5fe3f456'
            '47c05c6e7e1280dca137ed2139dac7da0d026a27d5590fd386748d1827288a61'
            'c5dd103953b8830640538ba30ff511028bd93310f95e4f5587a6ed5e6414a60d'
            '9fad4a40449e09522899955762c8928ae17f4cdaa16e01239fd12592e9d58177'
            'a557b342111849a5f920bbe1c129f3ff1fc1eff62c6bd6685e0972fc88e39911'
            'e308292fc42840a2366280ea7cf26314e92b931bb11f04ad4830276fc0326ee1'
            '105f51e904d80f63c1421203e093b612fc724edefd3e388b64f8d371c0b3a842'
            '7fb1104c167edb79ec8fbdcde97940ed0f806aa978bdd14d0c665a1d76d25c24'
            'SKIP'
            'SKIP')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  rm -rf $pkgdir # Nuke the entire pkg folder so it'll get regenerated clean on next build

  ln -s "${_where}/customization.cfg" "${srcdir}" # workaround

  cd "${srcdir}/${_srcpath}"

  _tkg_srcprep
}

build() {
  cd "${srcdir}/${_srcpath}"

  # Use custom compiler paths if defined
  if [ "$_compiler_name" = "-llvm" ] && [ -n "${CUSTOM_LLVM_PATH}" ]; then
    PATH=${CUSTOM_LLVM_PATH}/bin:${CUSTOM_LLVM_PATH}/lib:${CUSTOM_LLVM_PATH}/include:${PATH}
  elif [ -n "${CUSTOM_GCC_PATH}" ]; then
    PATH=${CUSTOM_GCC_PATH}/bin:${CUSTOM_GCC_PATH}/lib:${CUSTOM_GCC_PATH}/include:${PATH}
  fi

  if [ "$_force_all_threads" = "true" ]; then
    _force_all_threads="-j$((`nproc`+1))"
  else
    _force_all_threads="${MAKEFLAGS}"
  fi

  # ccache
  if [ "$_noccache" != "true" ] && pacman -Qq ccache &> /dev/null; then
    export PATH="/usr/lib/ccache/bin/:$PATH"
    export CCACHE_SLOPPINESS="file_macro,locale,time_macros"
    export CCACHE_NOHASHDIR="true"
    msg2 'ccache was found and will be used'
  fi

  # document the TkG variables, excluding "_", "_EXT_CONFIG_PATH", "_where", and "_path".
  declare -p | cut -d ' ' -f 3 | grep -P '^_(?!=|EXT_CONFIG_PATH|where|path)' > "${srcdir}/customization-full.cfg"

  # remove -O2 flag and place user optimization flag
  CFLAGS=${CFLAGS/-O2/}
  CFLAGS+=" ${_compileropt}"

  # build!
  _runtime=$( time ( schedtool -B -n 1 -e ionice -n 1 make ${_force_all_threads} ${llvm_opt} LOCALVERSION= bzImage modules 2>&1 ) 3>&1 1>&2 2>&3 ) || _runtime=$( time ( make ${_force_all_threads} ${llvm_opt} LOCALVERSION= bzImage modules 2>&1 ) 3>&1 1>&2 2>&3 )
}

hackbase() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=('coreutils' 'kmod' 'initramfs')
  optdepends=('linux-docs: Kernel hackers manual - HTML documentation that comes with the Linux kernel.'
              'crda: to set the correct wireless channels of your country.'
              'linux-firmware: Firmware files for Linux'
              'modprobed-db: Keeps track of EVERY kernel module that has ever been probed. Useful for make localmodconfig.'
              'nvidia-tkg: NVIDIA drivers for all installed kernels - non-dkms version.'
              'nvidia-dkms-tkg: NVIDIA drivers for all installed kernels - dkms version.'
              'update-grub: Simple wrapper around grub-mkconfig.')
  if [ -e "${srcdir}/winesync.rules" ]; then
    provides=("linux=${pkgver}" "${pkgbase}" VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE WINESYNC-MODULE winesync-header)
  else
    provides=("linux=${pkgver}" "${pkgbase}" VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  fi
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

  cd "${srcdir}/${_srcpath}"

  # get kernel version
  local _kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$_kernver"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make ${llvm_opt} -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  # install cleanup pacman hook and script
  sed -e "s|cleanup|${pkgbase}-cleanup|g" "${srcdir}"/90-cleanup.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
  install -Dm755 "${srcdir}"/cleanup "${pkgdir}/usr/share/libalpm/scripts/${pkgbase}-cleanup"

  # install customization file, for reference
  install -Dm644 "${srcdir}"/customization-full.cfg "${pkgdir}/usr/share/doc/${pkgbase}/customization.cfg"

  # workaround for missing header with winesync
  if [ -e ""${srcdir}/${_srcpath}"/include/uapi/linux/winesync.h" ]; then
    msg2 "Workaround missing winesync header"
    install -Dm644 "${srcdir}/${_srcpath}"/include/uapi/linux/winesync.h "${pkgdir}/usr/include/linux/winesync.h"
  fi

  # load winesync module at boot
  if [ -e "${srcdir}/winesync.conf" ]; then
    msg2 "Set the winesync module to be loaded at boot through /etc/modules-load.d"
    install -Dm644 "${srcdir}"/winesync.conf "${pkgdir}/etc/modules-load.d/winesync.conf"
  fi

  # install udev rule for winesync
  if [ -e "${srcdir}/winesync.rules" ]; then
    msg2 "Installing udev rule for winesync"
    install -Dm644 "${srcdir}"/winesync.rules "${pkgdir}/etc/udev/rules.d/winesync.rules"
  fi
}

hackheaders() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  provides=("linux-headers=${pkgver}" "${pkgbase}-headers=${pkgver}")
  case $_basever in
    54|57|58|59|510)
    ;;
    *)
      depends=('pahole')
    ;;
  esac

  cd "${srcdir}/${_srcpath}"
  local builddir="${pkgdir}/usr/lib/modules/$(<version)/build"

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
    echo "Removing $(basename "$arch")"
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

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  if [ $_NUKR = "true" ]; then
    rm -rf "$srcdir" # Nuke the entire src folder so it'll get regenerated clean on next build
  fi
}

source /dev/stdin <<EOF
package_${pkgbase}() {
hackbase
}

package_${pkgbase}-headers() {
hackheaders
}
EOF
