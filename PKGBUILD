# Maintainer: Arglebargle < arglebargle at arglebargle dot dev>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Yoshi2889 <rick.2889 at gmail dot com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

# shellcheck disable=SC2034,SC2164

##
## Xanmod-ROG options:
##
## 'amd_pstate' - Setting this variable to 'n' will disable amd-pstate
##                unset/default enables the driver
if [ -z ${amd_pstate+x} ]; then
  amd_pstate=y
fi

## Xanmod options:
##
## The following variables can be customized at build time. Use env or export to change at your wish
##
##   Example: env _microarchitecture=98 use_numa=n use_tracers=n makepkg -sc
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
if [ -z ${_compiler+x} ]; then
  _compiler=gcc
fi

# Compress modules with ZSTD (to save disk space)
if [ -z ${_compress_modules+x} ]; then
  _compress_modules=y
fi

# Compile ONLY used modules to VASTLY reduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
if [ -z "${_localmodcfg}" ]; then
  _localmodcfg=n
fi

# Tweak kernel options prior to a build via nconfig
_makenconfig=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-xanmod-rog
xanmod=5.14.15-xanmod1
#pkgver=${xanmod//-/.}
pkgver=5.14.16.xanpre0     # NOTE: start 4th position with 'xan...', we parse for this pattern later
pkgrel=1
pkgdesc='Linux Xanmod'
url="http://www.xanmod.org/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf pahole cpio perl tar xz zstd
  "gcc>=11.0"
)
if [ "${_compiler}" = "clang" ]; then
  makedepends+=(clang llvm lld python)
fi
options=('!strip')
_major=$(echo $xanmod | cut -d'.' -f1,2)
_patchver=$(echo $pkgver | cut -d'.' -f3)
_branch="$(echo $xanmod | cut -d'.' -f1).x"
_localversion=$(echo $pkgver | cut -d'.' -f4)

source=("https://cdn.kernel.org/pub/linux/kernel/v${_branch}/linux-${_major}.tar."{xz,sign}
        "https://github.com/xanmod/linux/releases/download/${xanmod}/patch-${xanmod}.xz"
        "choose-gcc-optimization.sh"
        "sphinx-workaround.patch"

        # incremental kernel.org patch ahead of official Xanmod release
        #"https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-5.14.1.xz"
        "https://cdn.kernel.org/pub/linux/kernel/v5.x/incr/patch-5.14.15-16.xz"
        #"Linux-5.14.5-rc1.patch"

        # amd-pstate update
        "amd-pstate-v3.diff"

        # don't drop shared caches on C3 state transitions
        "x86-ACPI-State-Optimize-C3-entry-on-AMD-CPUs.patch"                            # landing in 5.15

        # patch from Chromium developers; more accurately report battery state changes
        "acpi-battery-Always-read-fresh-battery-state-on-update.patch"                  # awaiting ack ...

        # k10temp support for Zen3 APUs
        #"x86-amd_nb-Add-AMD-family-19h-model-50h-PCI-ids.patch"                        # included in 5.14
        "hwmon-k10temp-support-Zen3-APUs.patch"                                         # landing in 5.15

        # 5.16 spectre defaults
        "x86-change-default-to-spec_store_bypass_disable-prct.patch"

        # squelch overzealous 802.11 regdomain not set warnings
        "cfg80211-dont-WARN-if-a-self-managed-device.patch"

        # r8152 s0i3 wake fix
        "r8152-fix-spurious-wakeups-from-s0i3.patch"

        # r8169 hwIDs for the G14?/G15
        "r8169-Add-device-10ec-8162-to-driver-r8169.patch"

        # ASUS ROG enablement
        "asus-wmi-Add-panel-overdrive-functionality.patch"                              # landing in 5.15
        "asus-wmi-Add-dgpu-disable-method.patch"                                        # "
        "asus-wmi-Add-egpu-enable-method.patch"                                         # "
        "HID-asus-Prevent-Claymore-sending-suspend-event.patch"                         # "
        "HID-asus-Reduce-object-size-by-consolidating-calls.patch"                      # awaiting ack ...
        "v5-asus-wmi-Add-support-for-platform_profile.patch"                            # landing in 5.15
        "v16-asus-wmi-Add-support-for-custom-fan-curves.patch"                          # -next

        # mediatek mt7921 bt/wifi patches
        "mt76-mt7921-Fix-out-of-order-process-by-invalid-even.patch"
        "mt76-mt7921-Add-mt7922-support.patch"
        "1-1-Bluetooth-btusb-Enable-MSFT-extension-for-Mediatek-Chip-MT7921.patch"
        "1-2-mt76-mt7915-send-EAPOL-frames-at-lowest-rate.patch"
        "2-2-mt76-mt7921-send-EAPOL-frames-at-lowest-rate.patch"
        "mt76-mt7921-enable-VO-tx-aggregation.patch"
        "mt76-mt7921-fix-dma-hang-in-rmmod.patch"
        "mt76-mt7921-fix-firmware-usage-of-RA-info-using-legacy-rates.patch"
        "mt76-mt7921-fix-the-inconsistent-state-between-bind-and-unbind.patch"
        "mt76-mt7921-report-HE-MU-radiotap.patch"
        "v2-mt76-mt7921-fix-kernel-warning-from-cfg80211_calculate_bitrate.patch"
        "1-2-mt76-mt7921-robustify-hardware-initialization-flow.patch"
        "2-2-mt76-mt7921-fix-retrying-release-semaphore-without-end.patch"
        "1-2-Bluetooth-btusb-Add-Mediatek-MT7921-support-for-Foxconn.patch"
        "2-2-Bluetooth-btusb-Add-Mediatek-MT7921-support-for-IMC-Network.patch"
        "Bluetooth-btusb-Add-support-for-IMC-Networks-Mediatek-Chip.patch"
        "Bluetooth-btusb-Add-support-for-Foxconn-Mediatek-Chip.patch"
        "Bluetooth-btusb-Add-support-for-IMC-Networks-Mediatek-Chip-MT7921.patch"

        # squashed s0ix enablement
        "9001-v5.14.16-s0ix-patch-2021-11-02.patch"
        )
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

sha256sums=('7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2'
            'SKIP'
            'e3999a9e5957b425656bcda2a6d938175478ae9b17d15d38010e486ffbcf2076'
            '1ac18cad2578df4a70f9346f7c6fccbb62f042a0ee0594817fdef9f2704904ee'
            '52fc0fcd806f34e774e36570b2a739dbdf337f7ff679b1c1139bee54d03301eb'
            '3c7ae911838cda30992d5a7fdf34b40494d31ba5765b834549aa276b1fa833e3'
            'deffeac14f6d9393e82595f6b6ec0e2a71f3b873a1996159577aa2522d6207c4'
            '923230ed8367e28adfdeed75d3cdba9eec6b781818c37f6f3d3eb64101d2e716'
            'f7a4bf6293912bfc4a20743e58a5a266be8c4dbe3c1862d196d3a3b45f2f7c90'
            'de8c9747637768c4356c06aa65c3f157c526aa420f21fdd5edd0ed06f720a62e'
            'cc401107f1bf7b7d8e8a78ee594f9db4b6fa252b7239b6aa88f678aef84d935c'
            '3d8961438b5c8110588ff0b881d472fc71a4304d306808d78a4055a4150f351e'
            'f47a5a5e329e410a0ae7d46b450707d5575a4deda5b3b58281f5eca14938fb21'
            'e4e55dd548c7689596a7c5c42e49c8f072bd2613bd416c6910b5c6410120eb1d'
            '1ab75535772c63567384eb2ac74753e4d5db2f3317cb265aedf6151b9f18c6c2'
            '8cc771f37ee08ad5796e6db64f180c1415a5f6e03eb3045272dade30ca754b53'
            'f3461e7cc759fd4cef2ec5c4fa15b80fa6d37e16008db223f77ed88a65aa938e'
            'ec317cc2c2c8c1186c4f553fdd010adc013c37600a499802473653fd8e7564df'
            '544464bf0807b324120767d55867f03014a9fda4e1804768ca341be902d7ade4'
            '4ef12029ea73ca924b6397e1de4911e84d9e77ddaccdab1ef579823d848524e8'
            '0c422d8f420c1518aab1b980c6cdb6e029a4fa9cde1fd99a63670bb105a44f36'
            '2163cb2e394a013042a40cd3b00dae788603284b20d71e262995366c5534e480'
            'a01cf700d79b983807e2285be1b30df6e02db6adfd9c9027fe2dfa8ca5a74bc9'
            '9f6b8c3ea6e1c285e0a7efda4d743dbae343bc6ee7ad599a4ab7d380c750bc83'
            '4bfbff4eba07fc9de2ce78097a4a269509468ba0e24c15a82905cd94e093ad55'
            '021f8539ab2fb722b46937b95fdab22a2308236a24ecc1a9ea8db4853721dd39'
            '1ce9fd988201c4d2e48794c58acda5b768ec0fea1d29555e99d35cd2712281e4'
            'e7e37c7c433c58e2f5a79e2a7724823bef1dccaa01e857584397b4e3c837d991'
            'f075ac354acfd65dff4db49dc9798747cb9b7a3dd9839987bc46495bdbbd22dc'
            '1770fec49335bc93194e9e55ced49e1cb67f2df4bf6948e80712a0b2ba50fa49'
            '6da4010f86a74125969fd3dbc953da7b45209d33ff3d216474c3399e82e893ff'
            'eb391b6d1ebf7ef99ece00b23609b94180a1f3c0149bcf05f6bbeb74d0b724c7'
            'c368cc4eefff20b7ae904eec686b7e72b46ff02b32c8a4fbd6bd4039f087e7ba'
            '1a8639167a1ee1b66f580c0c6f8304e6ef359a68cfa3eb869d9200a9f0234098'
            '236cdadf0b1472945c0d7570caeed7b95929aabed6872319c9d0969a819689e9'
            'cc2aa580d69801aa1afb0d72ecf094fe13c797363d3d5928c868d3a389910b7b'
            '292a7e32b248c7eee6e2f5407d609d03d985f367d329adb02b9d6dba1f85b44c'
            '7dbfdd120bc155cad1879579cb9dd1185eb5e37078c8c93fef604a275a163812'
            '1444af2e125080934c67b6adb4561fd354a72ce47d3de393b24f53832ee492ac'
            '67421174b6dfd18beb9e6f06a54c15e425a9568cd9412cd0625d11fee65d3ab7')

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
  if [[ ${xanmod%-xanmod?} != "${pkgver%%\.xan*}" ]]; then
    msg2 "(Monkey)ing with kernel, rewriting localversion xanmod to $_localversion ..."
    sed -Ei "s/xanmod[0-9]+/${_localversion}/" localversion
  fi

  # Applying configuration
  cp -vf CONFIGS/xanmod/${_compiler}/config .config
  # enable LTO_CLANG_THIN
  if [ "${_compiler}" = "clang" ]; then
    scripts/config --disable LTO_CLANG_FULL
    scripts/config --enable LTO_CLANG_THIN
    _LLVM=1
  fi

  # CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team
  scripts/config --enable CONFIG_STACK_VALIDATION

  # Enable IKCONFIG following Arch's philosophy
  scripts/config --enable CONFIG_IKCONFIG \
                 --enable CONFIG_IKCONFIG_PROC

  # User set. See at the top of this file
  if [ "$use_tracers" = "n" ]; then
    msg2 "Disabling FUNCTION_TRACER/GRAPH_TRACER only if we are not compiling with clang..."
    if [ "${_compiler}" = "gcc" ]; then
      scripts/config --disable CONFIG_FUNCTION_TRACER \
                     --disable CONFIG_STACK_TRACER
    fi
  fi

  if [ "$use_numa" = "n" ]; then
    msg2 "Disabling NUMA..."
    scripts/config --disable CONFIG_NUMA
  fi

  # Compress modules by default (following Arch's kernel)
  if [ "$_compress_modules" = "y" ]; then
    scripts/config --disable CONFIG_MODULE_COMPRESS_NONE \
                   --enable CONFIG_MODULE_COMPRESS_ZSTD
  fi

  if [ "$amd_pstate" = "n" ]; then
    msg2 "Disabling amd-pstate driver..."
    scripts/config --disable CONFIG_X86_AMD_PSTATE
  else
    scripts/config --enable CONFIG_X86_AMD_PSTATE
  fi

  # let user choose microarchitecture optimization target;
  sh "${srcdir}/choose-gcc-optimization.sh" $_microarchitecture

  # This is intended for the people that want to build this package with their own config
  # Put the file "myconfig" at the package folder (this will take preference) or "${XDG_CONFIG_HOME}/linux-xanmod/myconfig"
  # If we detect partial file with scripts/config commands, we execute as a script
  # If not, it's a full config, will be replaced
  for _myconfig in "${startdir}/myconfig" "${HOME}/.config/linux-xanmod/myconfig" "${XDG_CONFIG_HOME}/linux-xanmod/myconfig" ; do
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

  make LLVM=$_LLVM LLVM_IAS=$_LLVM olddefconfig

  ## bake in s0ix debugging parameters
  scripts/config  --enable CONFIG_CMDLINE_BOOL \
                  --set-str CONFIG_CMDLINE "makepkgplaceholderyolo" \
                  --disable CMDLINE_OVERRIDE

  ## HACK: forcibly fixup CONFIG_CMDLINE as scripts/config mangles quote escapes
  sed -i 's#makepkgplaceholderyolo#pm_debug_messages amd_pmc.enable_stb=1 amd_pmc.dyndbg=\\"+p\\" acpi.dyndbg=\\"file drivers/acpi/x86/s2idle.c +p\\"#' .config

# note the double escaped quotes above, sed strips one; the final result in .config needs to contain
# single slash escaped quotes (eg: `CONFIG_CMDLINE="foo.dyndbg=\"+p\""`) to avoid dyndbg parse errors
# at boot. this is impossible with the kernel config script.

  make -s kernelrelease > version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

  [[ -z "$_makenconfig" ]] || make LLVM=$_LLVM LLVM_IAS=$_LLVM nconfig

  # save configuration for later reuse or inspection
  cat .config > "${SRCDEST}/config.last"
}

build() {
  cd "linux-${_major}"
  make LLVM=$_LLVM LLVM_IAS=$_LLVM all
}

# shellcheck disable=SC2154,SC2155
_package() {
  pkgdesc="The Linux kernel and modules with Xanmod and ASUS ROG laptop patches (Zephyrus G14, G15, etc)"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides+=(linux-rog)

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
  provides+=(linux-rog-headers)

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
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
