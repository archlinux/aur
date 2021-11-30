# Maintainer: Arglebargle < arglebargle at arglebargle dot dev>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Yoshi2889 <rick.2889 at gmail dot com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# --
# shellcheck disable=SC2034,SC2164

## The following variables can be customized at build time. Use env or export to change at your wish
##
##   Example: env _microarchitecture=98 use_numa=n use_tracers=n makepkg -sc

##
## Xanmod-ROG options:
##
## 'amd_pstate' - Setting this variable to 'n' will disable amd-pstate
##                unset/default enables the driver
if [ -z ${amd_pstate+x} ]; then
  amd_pstate=y
fi

## 'no_makeflags_check' - If /etc/makepkg.conf MAKEFLAGS is null or unset we'll throw a big warning
##                        and pause long enough for the user to cancel their build.
##                        Set "no_makeflags_check" to anything to skip this.
if [ -z ${no_makeflags_check+x} ]; then
  makeflags_check=y
fi

## '_O3' -  Enable -O3 optimization - this isn't generally worth much, especially in the face of
##          -march=native (or -march=x86-64-v3) and clang ThinLTO; set _O3 to anything to enable
if [ -n "${_O3+x}" ]; then
  _O3=y
fi

##
## Xanmod options:
##
## Look inside 'choose-gcc-optimization.sh' to choose your microarchitecture
## Valid numbers between: 0 to 99
## Default is: 0 => generic
## Good option if your package is for one machine: 98 (Intel native) or 99 (AMD native)
if [ -z ${_microarchitecture+x} ]; then
  _microarchitecture=93
fi

## Disable NUMA since most users do not have multiple processors. Breaks CUDA/NvEnc.
## Archlinux and Xanmod enable it by default.
## Set variable "use_numa" to: n to disable (possibly increase performance)
##                             y to enable  (stock default)
if [ -z ${use_numa+x} ]; then
  use_numa=y
fi

## For performance you can disable FUNCTION_TRACER/GRAPH_TRACER. Limits debugging and analyzing of the kernel.
## Stock Archlinux and Xanmod have this enabled.
## Set variable "use_tracers" to: n to disable (possibly increase performance)
##                                y to enable  (stock default)
if [ -z ${use_tracers+x} ]; then
  use_tracers=y
fi

## Choose between GCC and CLANG config (default is GCC)
case "${_compiler,,}" in
  "clang" | "gcc") _compiler=${_compiler,,} ;; # tolower, simplifes later checks
                *) _compiler=gcc            ;; # default to GCC
esac

## Compress modules with ZSTD (to save disk space)
#if [ -z ${_compress_modules+x} ]; then
#  _compress_modules=y
#fi

# Compile ONLY used modules to VASTLY reduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
if [ -z ${_localmodcfg+x} ]; then
  _localmodcfg=n
fi

# Tweak kernel options prior to a build via nconfig
_makenconfig=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-xanmod-rog
xanmod=5.15.5-xanmod1
pkgver=${xanmod//-/.}
#pkgver=5.15.5.prexan0
#  NOTE: version sort is important here, pick something that sorts 'before' .xanmodY to avoid downgrade warnings
pkgrel=1
pkgdesc='Linux Xanmod'
url="http://www.xanmod.org/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf pahole cpio perl tar xz zstd
  "gcc>=11.0"
)
if [ "$_compiler" = "clang" ]; then
  pkgver="${pkgver}+clang"
  makedepends+=(clang llvm lld python)
  _LLVM=1
fi
options=('!strip')
_major=${xanmod%\.*\-*}           # 5.15
_branch=${xanmod%%\.*\-*}.x       # 5.x
_localversion=${pkgver##*\.}      # xanmod1

source=("https://cdn.kernel.org/pub/linux/kernel/v${_branch}/linux-${_major}.tar."{xz,sign}
        "https://github.com/xanmod/linux/releases/download/${xanmod}/patch-${xanmod}.xz"
        "choose-gcc-optimization.sh"
        "sphinx-workaround.patch"

        # apply incremental kernel updates ahead of official Xanmod release
        #"https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-5.15.1.xz"
        #"https://cdn.kernel.org/pub/linux/kernel/v5.x/incr/patch-5.15.4-5.xz"
        #"Linux-5.15.4-rc1.patch"

        # Arch: misc hotfixes
        "staging-r8188eu-Fix-breakage-introduced-when-5G-code.patch"
        "PCI-Add-more-NVIDIA-controllers-to-the-MSI-masking-q.patch"
        "iommu-intel-do-deep-dma-unmapping-to-avoid-kernel-fl.patch"
        "cpufreq-intel_pstate-ITMT-support-for-overclocked-sy.patch"
        "Bluetooth-btintel-Fix-bdaddress-comparison-with-garb.patch"
        "lg-laptop-Recognize-more-models.patch"

        # amd-pstate v4 included in Xanmod
        # multigenerational lru v5 included in Xanmod
        # 5.17 TCP Optimizations included in Xanmod
        # 5.17 TCP csum optimization included in Xanmod

        # -- amd-pstate v5
        "Revert-amd-pstate-v4.patch"
        "squashed-amd-pstate-v5-on-5.15.y.patch"

        # 5.16: zstd 1.4.10 update stack size regression fixes
        "zstd-udpate-fixes.patch"

        # 5.16: don't drop shared caches on C3 state transitions
        "x86-ACPI-State-Optimize-C3-entry-on-AMD-CPUs.patch"

        # 5.16 spectre defaults
        "x86-change-default-to-spec_store_bypass_disable-prct.patch"

        # -- patch from Chromium developers; more accurately report battery state changes
        "acpi-battery-Always-read-fresh-battery-state-on-update.patch"

        # -- squelch overzealous 802.11 regdomain not set warnings
        "cfg80211-dont-WARN-if-a-self-managed-device.patch"

        # ASUS ROG patches
        "HID-asus-Reduce-object-size-by-consolidating-calls.patch"
        "v16-asus-wmi-Add-support-for-custom-fan-curves.patch"

        # mediatek mt7921 bt/wifi patches
        "mt76-mt7921-Add-mt7922-support.patch"
        "1-2-mt76-mt7915-send-EAPOL-frames-at-lowest-rate.patch"
        "2-2-mt76-mt7921-send-EAPOL-frames-at-lowest-rate.patch"
        "mt76-mt7921-enable-VO-tx-aggregation.patch"
        "1-2-mt76-mt7921-robustify-hardware-initialization-flow.patch"
        "1-2-Bluetooth-btusb-Add-Mediatek-MT7921-support-for-Foxconn.patch"
        "2-2-Bluetooth-btusb-Add-Mediatek-MT7921-support-for-IMC-Network.patch"
        "Bluetooth-btusb-Add-support-for-IMC-Networks-Mediatek-Chip.patch"
        "Bluetooth-btusb-Add-support-for-Foxconn-Mediatek-Chip.patch"
        "Bluetooth-btusb-Add-support-for-IMC-Networks-Mediatek-Chip-MT7921.patch"

        # squashed s0ix enablement
        "9001-v5.15-s0ix-patch-2021-11-19.patch"
        )
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

sha256sums=('57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8'
            'SKIP'
            'd1b3e3aae70eae207d473214b33c088f646105fdbc52d8a7df71fbbdeede83b3'
            '5b8eddb90671f3e8469a023b7ed0d3c5a9521f662affa1d541063e273b64dba8'
            '52fc0fcd806f34e774e36570b2a739dbdf337f7ff679b1c1139bee54d03301eb'
            'ce50ee3c64f6865234f6ec79fcbd87704494b0fbb7d3cc124f97244c731f9e61'
            '20c0926964a4286486c3ae1dd05014767f42388316a7d60b4f52639536fbd615'
            '6c48a3e96b49ddb6ece78f3abb1a8a889a77c097f93b14ab052f1e19eda05076'
            '54f161457cc4de4ebd5770c16f14f7a47f1dbbc4f1af83dec651e6a8b1eaad56'
            '802e9f8d5c98088946b8ad5629e0732350b4b0fd91c24e12af31935791fcd556'
            '80538b0f529ed32118dac933d50599c6e843ae31882361fd88cd40a1dc7d21f9'
            '75d9270564fd861083a71632bbd1110791b53c862956c8f393b40cf6bb16974e'
            '26cb23bc212e8d8d6a18dd2ffa96dd2943170cb9572ce6aed36b5257de54df3a'
            'd636bd74a71b2d898b20246e3c013b853fd1a462ed622e7e90302d53b4157428'
            '923230ed8367e28adfdeed75d3cdba9eec6b781818c37f6f3d3eb64101d2e716'
            'cc401107f1bf7b7d8e8a78ee594f9db4b6fa252b7239b6aa88f678aef84d935c'
            'f7a4bf6293912bfc4a20743e58a5a266be8c4dbe3c1862d196d3a3b45f2f7c90'
            '3d8961438b5c8110588ff0b881d472fc71a4304d306808d78a4055a4150f351e'
            '544464bf0807b324120767d55867f03014a9fda4e1804768ca341be902d7ade4'
            '0c422d8f420c1518aab1b980c6cdb6e029a4fa9cde1fd99a63670bb105a44f36'
            'a01cf700d79b983807e2285be1b30df6e02db6adfd9c9027fe2dfa8ca5a74bc9'
            '4bfbff4eba07fc9de2ce78097a4a269509468ba0e24c15a82905cd94e093ad55'
            '021f8539ab2fb722b46937b95fdab22a2308236a24ecc1a9ea8db4853721dd39'
            '1ce9fd988201c4d2e48794c58acda5b768ec0fea1d29555e99d35cd2712281e4'
            'c368cc4eefff20b7ae904eec686b7e72b46ff02b32c8a4fbd6bd4039f087e7ba'
            '236cdadf0b1472945c0d7570caeed7b95929aabed6872319c9d0969a819689e9'
            'cc2aa580d69801aa1afb0d72ecf094fe13c797363d3d5928c868d3a389910b7b'
            '292a7e32b248c7eee6e2f5407d609d03d985f367d329adb02b9d6dba1f85b44c'
            '7dbfdd120bc155cad1879579cb9dd1185eb5e37078c8c93fef604a275a163812'
            '1444af2e125080934c67b6adb4561fd354a72ce47d3de393b24f53832ee492ac'
            'b628dbd723b837ee89d0832174b762da61415d276e827646b9bad3e770be2898')

export KBUILD_BUILD_HOST=${KBUILD_BUILD_HOST:-archlinux}
export KBUILD_BUILD_USER=${KBUILD_BUILD_USER:-"$pkgbase"}
export KBUILD_BUILD_TIMESTAMP=${KBUILD_BUILD_TIMESTAMP:-$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})}

# shellcheck disable=SC2154,SC2155
prepare() {
  cd "linux-${_major}"

  # Apply patches
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    case "$src" in
      patch-${_major}*xanmod*xz)
        # Apply Xanmod patch
        msg2 "Applying Xanmod patch..."
        patch -Np1 -i "../${src%\.xz}"
        ;;
      patch-${_major}*xz)
        # Apply kernel.org point releases if we're building ahead of Xanmod official
        msg2 "Applying kernel.org point release ${src%\.xz} ..."
        patch -Np1 -i "../${src%\.xz}"
        ;;
      *patch|*diff)
        # Apply any other patches
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
        ;;
    esac
  done

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.99-pkgrel
  echo "${pkgbase#linux-xanmod}" > localversion.20-pkgname

  # Monkey patch: rewrite Xanmod release to $_localversion (eg: xanpre0) if we're applying a point release on top of Xanmod
  if [[ ${xanmod%-xanmod?} != "$_localversion" ]]; then
    msg2 "(Monkey)ing with kernel, rewriting localversion ${xanmod%-xanmod?} to $_localversion ..."
    sed -Ei "s/xanmod[0-9]+/${_localversion}/" localversion
  fi

  msg2 "Applying kernel config..."
  # Applying configuration
  cp -vf CONFIGS/xanmod/${_compiler}/config .config
  # enable LTO_CLANG_THIN
  if [ "$_compiler" = "clang" ]; then
    msg2 "Enabling Clang ThinLTO ..."
    scripts/config --disable LTO_CLANG_FULL \
                   --enable LTO_CLANG_THIN
  fi

  if [ "$_O3" = "y" ]; then
    msg2 "Enabling -O3 optimizations ..."
    scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE \
                   --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
  fi

  # CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team
  scripts/config --enable CONFIG_STACK_VALIDATION

  # Enable IKCONFIG following Arch's philosophy
  scripts/config --enable CONFIG_IKCONFIG \
                 --enable CONFIG_IKCONFIG_PROC

  # User set. See at the top of this file
  if [ "$use_tracers" = "n" ]; then
    msg2 "Disabling FUNCTION_TRACER/GRAPH_TRACER only if we are not compiling with clang..."
    if [ "$_compiler" = "gcc" ]; then
      scripts/config --disable CONFIG_FUNCTION_TRACER \
                     --disable CONFIG_STACK_TRACER
    fi
  fi

  if [ "$use_numa" = "n" ]; then
    msg2 "Disabling NUMA..."
    scripts/config --disable CONFIG_NUMA
  fi

  # Compress modules by default (following Arch's kernel)
  scripts/config --disable CONFIG_MODULE_COMPRESS_NONE \
                 --enable CONFIG_MODULE_COMPRESS_ZSTD

  # Toggle AMD pstate if requested
  if [ "$amd_pstate" = "n" ]; then
    msg2 "Disabling amd-pstate driver..."
    scripts/config --disable CONFIG_X86_AMD_PSTATE
  else
    scripts/config --enable CONFIG_X86_AMD_PSTATE
  fi

  # let user choose microarchitecture optimization target;
  sh "${srcdir}/choose-gcc-optimization.sh" $_microarchitecture

  # apply package config customizations
  if [[ -s ${startdir}/xanmod-rog-config ]]; then
    msg2 "Applying package config customization..."
    bash -x "${startdir}/xanmod-rog-config"
  fi

  # This is intended for the people that want to build this package with their own config
  # Put the file "myconfig" at the package folder (this will take precedence) or "${XDG_CONFIG_HOME}/linux-xanmod-rog/myconfig"
  # If we detect partial file with scripts/config commands, we execute as a script
  # If not, it's a full config, will be replaced
  for _myconfig in "${startdir}/myconfig" "${HOME}/.config/linux-xanmod-rog/myconfig" "${XDG_CONFIG_HOME}/linux-xanmod-rog/myconfig" ; do
    # if file exists and size > 0 bytes
    if [ -s "${_myconfig}" ]; then
      if grep -q 'scripts/config' "${_myconfig}"; then
        # myconfig is a partial file. Executing as a script
        msg2 "Applying myconfig..."
        bash -x "${_myconfig}"
      else
        # myconfig is a full config file. Replacing default .config
        msg2 "Using user CUSTOM config..."
        cp -f "${_myconfig}" .config
      fi
      echo
      break
    fi
  done

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
  if [ "$_localmodcfg" = "y" ]; then
    if [ -f "$HOME/.config/modprobed.db" ]; then
      msg2 "Running Steven Rostedt's make localmodconfig now"
      make LLVM=$_LLVM LLVM_IAS=$_LLVM LSMOD="$HOME/.config/modprobed.db" localmodconfig
    else
      msg2 "No modprobed.db data found"
      exit 1
    fi
  fi

  msg2 "Finalizing kernel config..."
  make LLVM=$_LLVM LLVM_IAS=$_LLVM olddefconfig

  make -s kernelrelease > version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

  [[ -z "$_makenconfig" ]] || make LLVM=$_LLVM LLVM_IAS=$_LLVM nconfig

  # save configuration for later reuse or inspection
  cat .config > "${startdir}/config.last"
}

build() {

  if [[ -z "$MAKEFLAGS" ]] && [[ "$makeflags_check" == "y" ]]; then
    show_makeflags_warning
  fi

  cd "linux-${_major}"
  make LLVM=$_LLVM LLVM_IAS=$_LLVM all
}

# shellcheck disable=SC2154,SC2155
_package() {
  pkgdesc="The Linux kernel and modules with Xanmod and ASUS ROG laptop patches (Zephyrus G14, G15, etc)"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides+=(ASUS-WMI-FAN-CONTROL linux-rog)

  cd "linux-${_major}"
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

# shellcheck disable=SC2154,SC2155
_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  cd "linux-${_major}"
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add resolve_btfids for building out-of-tree modules wth CONFIG_DEBUG_INFO_BTF selected
  [[ -x tools/bpf/resolve_btfids/resolve_btfids ]] &&
    install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

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
        strip -v "$STRIP_SHARED" "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v "$STRIP_STATIC" "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v "$STRIP_BINARIES" "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v "$STRIP_SHARED" "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  msg2 "Stripping vmlinux..."
  strip -v "$STRIP_STATIC" "$builddir/vmlinux"
  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#"$pkgbase"}")
    _package${_p#"$pkgbase"}
  }"
done

# shellcheck disable=SC2059
show_makeflags_warning() {
  echo
  warning "makepkg.conf MAKEFLAGS is not set, your kernel build may take many hours to complete!"
  plainerr ""
  plainerr "See https://wiki.archlinux.org/title/Makepkg#Improving_compile_times for help"
  plainerr "or scan this handy-dandy QR code to go straight to the wiki article:"
  plainerr ""
  if [[ "$(/bin/date +%m%d)" == "0401" ]]; then
    # Happy April 1!
    cat <<-YEET >&2
     ▄▄▄▄▄▄▄ ▄▄    ▄ ▄▄▄▄▄ ▄▄▄▄▄▄▄  
     █ ▄▄▄ █ ▄  ▄▄█▄  ▀█ ▄ █ ▄▄▄ █  
     █ ███ █ ██▄█ █ █▀▀▀█  █ ███ █  
     █▄▄▄▄▄█ ▄▀▄ █▀▄ ▄▀█▀█ █▄▄▄▄▄█  
     ▄▄▄▄  ▄ ▄▀ ▀ ▄▄▀▀███▀▄  ▄▄▄ ▄  
     ▄▄█▄█▀▄▀▄▀   ▄▀ █ ▄▀█ ███ ▄▄▀  
      █▄█▀▄▄▀ ▄ █▀██▄█▄▀▄▀▀▀▀▀▄▄ ▀  
     █▀▄▀██▄ ▀▄█▀▄ █ █▀ ██▄▀█▄ ███  
     █▀▄██ ▄ ▀ ▄▄▀ ▀▀▀ ▄ █▄▀▀█▄ █   
     ▄▀▀▄▀ ▄▀██▄▄█ ▀█▄ ▀ ▀▀ █ ▀█▀   
      ▄▀█▀▀▄▄▄▄▄▄█ █▄▀█▄███▄▄▄▄█    
     ▄▄▄▄▄▄▄ ▀██▄█▄▄   ▀▄█ ▄ ██▀█▀  
     █ ▄▄▄ █  ▀▄ ▄▀██▄▄▀ █▄▄▄█▀▄█▄  
     █ ███ █ █ ▄█▀▄ ▀▀  ▀▀█ ▄▀▀▄ █  
     █▄▄▄▄▄█ █  ▀  █▄█ ▀██  ▀ █ █
YEET
  else
    cat <<-YEET >&2
     ▄▄▄▄▄▄▄  ▄    ▄ ▄  ▄▄▄▄▄  ▄▄▄▄▄▄▄
     █ ▄▄▄ █ ▀█▄█▀ ▀▀█ █ ██▀▄  █ ▄▄▄ █
     █ ███ █ ▀▀▄▀▄█▀▄█▀ █▄ ▀██ █ ███ █
     █▄▄▄▄▄█ █ █ ▄ ▄▀█▀█ █▀▄ ▄ █▄▄▄▄▄█
     ▄▄▄▄▄ ▄▄▄▄▄ █▄██▀▄▀▄ ▀█▀▄▄ ▄ ▄ ▄ 
     █ ██▀ ▄▄▀█ ▄▄▀▄▄▀█▀ ███▀▄ ▀▄▄▄▀█▀
     ▄▀▄█▀▀▄ ▀█▀█ ▄█▀▀▄ ▀ ▀▄▀▀█▀▀▄▄▀  
     █ ▀▀▀█▄▄█▄█ ▀ ▄▄█▄ ▀▄▄▄▀  █    █▀
     ▀█▀▀██▄ ▀█  █▄█▀ ▄▀▀▀▀▄█▄▄ █▄ ▀▄ 
     ▄▀▀ ▀█▄▀▄▀ ▄▄▄▀▄▀▀█▀██▄▀▄▄█▄▄█ █▀
     ▀ ▄▄▀ ▄█▄█ █  ▀█▄▄ █ ▀▀█▄▄ ▄█ ▀▄ 
     █▀▀▀█▄▄▄▄▄▀ ▀█▄▄██▀▀▀ ▄▀█ █▀ █ █▀
     █ ▀ ▀▀▄█▀▄  █▀▄▀▀▄▀ ▄██▄██▄███▀ ▄
     ▄▄▄▄▄▄▄ █▄▄▄▄  ▄█▄▀▀█▄▄██ ▄ ██▀▄▀
     █ ▄▄▄ █ ▄███  ▀ ▀   ▀▀█▀█▄▄▄█▀▀  
     █ ███ █ █▀▄ ▀██▄██ ▀██ ██▀▄▀▀▄▄▄ 
     █▄▄▄▄▄█ █▄▀ █▀▄▄ ▄ █ ▀██▄▀█▄█▀▀▄ 
YEET
  fi
  plainerr ""
  plainerr "Edit your makepkg.conf and set appropriate MAKEFLAGS for your system to remove this warning"
  plainerr "or run makepkg with 'env no_makeflags_check=y makepkg ...'"
  plainerr ""
  printf -- "${ALL_OFF}${BOLD} > ${YELLOW}Pressing CTRL-C now and fixing this before continuing is a very good idea ${ALL_OFF}${BOLD}<\n" >&2
  plainerr ""
  printf -- "-> Continuing in 60s " >&2
  for i in {1..60}; do printf "." >&2 && sleep 1; done
  echo
}

# vim:set ts=8 sts=2 sw=2 et:
