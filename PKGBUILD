# Maintainer: Leonidas Spyropoulos <artafinde AT archlinux DOT org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Credit to graysky for shamelessly copying PKGBUILD from linux-ck

### BUILD OPTIONS
# Any/all of the next three variables may be set to ANYTHING
# that is not null to enable their respective build options

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Only compile select modules to reduce the number of modules built
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD reads the database kept if it exists
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Compile using clang rather than gcc
_clangbuild=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-prjc
pkgver=6.13.8
pkgrel=1
pkgdesc='Linux'
url="https://gitlab.com/alfredchen/linux-prjc"
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  bc
  cpio
  gettext
  git
  libelf
  pahole
  python
  perl
  tar
  xz
)
[[ -n "$_clangbuild" ]] && makedepends+=(clang llvm lld)
options=(
  !debug
  !strip
)
_srcname=linux-${pkgver}
_kernel_base_commit=d3e0fa65e7032031c67094741accda846a9c8bd2
_kernel_arch_tag=${pkgver}-arch1
_arch_config_commit=8cad09d4786a46d86edba609c34bd2558e0c67fc
_prjc_version=6.13-r0
_prjc_patch="prjc_v${_prjc_version}.patch"
_gcc_more_v=20241001
source=(
  "https://www.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar".{xz,sign}
  "${pkgbase}-${pkgver}-config::https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/raw/${_arch_config_commit}/config"
  "${_prjc_patch}::https://gitlab.com/alfredchen/projectc/raw/master/${_prjc_version%-*}/${_prjc_patch}"
  "more-uarches-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/$_gcc_more_v.tar.gz"
  "0001-${pkgbase}-${pkgver}-v${_kernel_arch_tag}.patch::https://github.com/archlinux/linux/compare/${_kernel_base_commit}..v${_kernel_arch_tag}.patch"
  "sched_numa_hop_mask.patch::https://gitlab.com/alfredchen/linux-prjc/-/commit/58a9cabf63a961c5fc501cf1ade12e1dc6029642.patch"
)

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
b2sums=('c20916a44a07d355ba8337229f102cd507deae92c88576040965e909fa89c09f98611746a8c8f249bc3dcf492238ce3f08c48f523670ccad4bd7ec21622806af'
        'SKIP'
        'a32ded4819b0fe212136a976435b58aa1305ad8ff1e2644d11c996a066241c5479bd144897044f3e71dffcd395f38ed1adf6a105a18d920751bfa052548dea8f'
        'fd1fe0cd3a2103d5f8bd08f7b83c165ee97228bde69e44481c7cbc74ee3d8aacbf28a3d7961bbd09266fa0a91f6117af3b41a0d93e0403b916bc8be00ebac48f'
        '11c6a4b815cd456e0f314b9695890fc5a1c393171d4443a673dc826fb2445359b9678850d17bbd948a294ec9c7757a582faa58a812a888c65f1467bcda63ae60'
        'e361139ec80edaf83e610527f9bc29d666434a49e8257fa994d4fe0dfc8b3b68cfc7f6dd73112ace18fac7344a26a016dece0ce8e452b4bb9b20b73d9b7bd49a'
        '07318d94a39ffe5fd252836a7a0d872c217bf57da25cab0411f04676273027763237b9eb8c83bf808c77e2f1b211469f740baf28fe8b6b739dcaf556b54a4ddb')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-prjc}
export EXTRAVERSION=""
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

_make() {
  test -s version
  make KERNELRELEASE="$(<version)" "$@"
}

prepare() {
  cd $_srcname

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname
  make defconfig
  make -s kernelrelease > version
  make mrproper

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 0*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../${pkgbase}-${pkgver}-config .config

  # https://bbs.archlinux.org/viewtopic.php?pid=1824594#p1824594
  scripts/config --enable CONFIG_PSI_DEFAULT_DISABLED

  # https://bbs.archlinux.org/viewtopic.php?pid=1863567#p1863567
  scripts/config --disable CONFIG_LATENCYTOP
  scripts/config --disable CONFIG_SCHED_DEBUG

  # FS#66613
  # https://bugzilla.kernel.org/show_bug.cgi?id=207173#c6
  scripts/config --disable CONFIG_KVM_WERROR

  echo "Applying patch ${_prjc_patch}..."
  patch -Np1 -i "$srcdir/${_prjc_patch}"

  # https://gitlab.com/alfredchen/linux-prjc/-/merge_requests/33
  #patch -Np1 -i "$srcdir/sched_numa_hop_mask.patch"

  if [[ -n "$_clangbuild" ]]; then
    scripts/config -e LTO_CLANG_THIN
    export _LLVM=1
    export _LLVM_IAS=$_LLVM
  fi

  # EXTRAVERSION is set by arch patch, we reset it to empty
  sed -ri 's/^(EXTRAVERSION\s=\s)(\-[a-z0-9]+)$/\1/' Makefile

  # non-interactively apply prjc default options
  # this isn't redundant if we want a clean selection of subarch below
  _make LLVM=$_LLVM LLVM_IAS=$_LLVM olddefconfig
  # diff -u ../${pkgbase}-${pkgver}-config .config || :

  # https://github.com/graysky2/kernel_gcc_patch
  # make sure to apply after olddefconfig to allow the next section
  echo "Patching to enable GCC optimization for other uarchs..."
  #patch -Np1 -i "$srcdir/kernel_compiler_patch-$_gcc_more_v/more-ISA-levels-and-uarches-for-kernel-6.8-rc4+.patch"

  # since there are multiple options in the above patch (uarch + ISA setting), the yes method that worked
  # in the past will no long work so remove it
  make LLVM=$_LLVM LLVM_IAS=$_LLVM olddefconfig

  # @@@ this is a sed target for repo-ck build script


  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
  if [ -n "$_localmodcfg" ]; then
    if [ -f $HOME/.config/modprobed.db ]; then
      echo "Running Steven Rostedt's make localmodconfig now"
      _make LLVM=$_LLVM LLVM_IAS=$_LLVM LSMOD="$HOME/.config/modprobed.db" localmodconfig
    else
      echo "No modprobed.db data found"
      exit
    fi
  fi

  echo "Prepared ${pkgbase} version $(<version)"

  [[ -z "$_makenconfig" ]] || _make LLVM=$_LLVM LLVM_IAS=$_LLVM nconfig

  # uncomment if you want to build with distcc
  ### sed -i '/HAVE_GCC_PLUGINS/d' arch/x86/Kconfig
}

build() {
  cd $_srcname
  _make LLVM=$_LLVM LLVM_IAS=$_LLVM all EXTRAVERSION=""
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the Project C patch set"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(_make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 _make LLVM=$_LLVM LLVM_IAS=$_LLVM INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build and source links
  rm "$modulesdir"/build
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the ${pkgbase/linux/Linux} kernel"
  depends=('linux-prjc')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  echo "Installing headers..."
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

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
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

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

}

pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
