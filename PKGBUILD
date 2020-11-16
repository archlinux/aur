#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org> ---> For the base PKGBUILD, config file, sphinx-workaround.patch
#and 0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch
#Credits: Andreas Radke <andyrtr@archlinux.org> ---> For the base PKGBUILD, config file and sphinx-workaround.patch
#Credits: Bartłomiej Piotrowski <bpiotrowski@archlinux.org> ---> For the base api-headers package
#Credits: Linus Torvalds ---> For the linux kernel
#Credits: Joan Figueras <ffigue at gmail dot com> ---> For the base PKFBUILD, choose-gcc-optimization.sh and how to enable features

#Choose CPU microarchtectures

#Available CPU microarchitectures:
#0) Generic (default)
#1) AMD K6/K6-II/K6-III
#2) AMD Athlon/Duron/K7
#3) AMD Opteron/Athlon64/Hammer/K8
#4) AMD Opteron/Athlon64/Hammer/K8 with SSE3
#5) AMD 61xx/7x50/PhenomX3/X4/II/K10
#6) AMD Family 10h (Barcelona)
#7) AMD Family 14h (Bobcat)
#8) AMD Family 16h (Jaguar)
#9) AMD Family 15h (Bulldozer)
#10) AMD Family 15h (Piledriver)
#11) AMD Family 15h (Steamroller)
#12) AMD Family 15h (Excavator)
#13) AMD Family 17h (Zen)
#14) AMD Family 17h (Zen 2)
#15) Transmeta Crusoe
#16) Transmeta Efficeon
#17) IDT Winchip C6
#18) Winchip-2/Winchip-2A/Winchip-3
#19) AMD Elan
#20) Geode GX1 (Cyrix MediaGX)
#21) AMD Geode GX and LX
#22) Cyrix III or C3
#23) VIA C3 "Nehemiah"
#24) VIA C7
#25) Intel Pentium 4, Pentium D and older Nocona/Dempsey Xeon CPUs with Intel 64bit
#26) Intel Atom
#27) Intel Core 2 and newer Core 2 Xeons (Xeon 51xx and 53xx)
#28) Intel 1st Gen Core i3/i5/i7-family (Nehalem)
#29) Intel 1.5 Gen Core i3/i5/i7-family (Westmere)
#30) Intel Silvermont
#31) Intel Goldmont (Apollo Lake and Denverton)
#32) Intel Goldmont Plus (Gemini Lake)
#33) Intel 2nd Gen Core i3/i5/i7-family (Sandybridge)
#34) Intel 3rd Gen Core i3/i5/i7-family (Ivybridge)
#35) Intel 4th Gen Core i3/i5/i7-family (Haswell)
#36) Intel 5th Gen Core i3/i5/i7-family (Broadwell)
#37) Intel 6th Gen Core i3/i5/i7-family (Skylake)
#38) Intel 6th Gen Core i7/i9-family (Skylake X)
#39) Intel 8th Gen Core i3/i5/i7-family (Cannon Lake)
#40) Intel 8th Gen Core i7/i9-family (Ice Lake)
#41) Xeon processors in the Cascade Lake family
#42) Native optimizations autodetected by GCC

if [ -z ${_microarchitecture+x} ]; then
  _microarchitecture=0
fi

#Disable/enable NUMA

## Disable NUMA since most users do not have multiple processors. Breaks CUDA/NvEnc.
## Archlinux and Xanmod enable it by default.
## Set variable "use_numa" to: n to disable (possibly increase performance)
##                             y to enable  (stock default)
# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.

if [ -z ${use_numa+x} ]; then
  use_numa=n
fi

#Disable/enable FUNCTION_TRACER/GRAPH_TRACER

## For performance you can disable FUNCTION_TRACER/GRAPH_TRACER. Limits debugging and analyzing of the kernel.
## Stock Archlinux and Xanmod have this enabled. 
## Set variable "use_tracers" to: n to disable (possibly increase performance)
##                                y to enable  (stock default)

if [ -z ${use_tracers+x} ]; then
  use_tracers=n
fi

#Enable/disable CONFIG_USER_NS_UNPRIVILEGED

## Enable CONFIG_USER_NS_UNPRIVILEGED flag
## Set variable "use_ns" to: n to disable (stock Xanmod)
##                           y to enable (stock Archlinux)

if [ -z ${use_ns+x} ]; then
  use_ns=n
fi

#use env _microarchitecture=(0-42) use_numa=(y/n) use_tracers=(y/n) use_ns=(y/n) makepkg -s ---> to overwrite the default variables

pkgbase=mainline-kernel
pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
pkgver=5.10_rc
pkgrel=1
versiontag=5.10-rc4
modulestag=5.10.0-rc4
pkgdesc="Mainline linux kernel, modules, headers, api-headers and docs"
arch=(x86_64)
url="https://www.kernel.org/"
license=(GPL-2.0)
makedepends=("bison" "flex" "valgrind" "git" "cmake" "make" "extra-cmake-modules" "libelf" "elfutils"
            "python" "python-appdirs" "python-mako" "python-evdev" "python-sphinx_rtd_theme" "python-graphviz" "python-sphinx"
            "clang" "lib32-clang" "bc" "gcc" "gcc-libs" "lib32-gcc-libs" "glibc" "lib32-glibc" "pahole" "patch" "gtk3" 
            "kmod" "libmikmod" "lib32-libmikmod" "xmlto" "xmltoman" "graphviz" "imagemagick" "imagemagick-doc" "rsync" "cpio" "inetutils")
source=("https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-${versiontag}.tar.gz"
        "${pkgbase}.preset"
        "config"
        "choose-gcc-optimization.sh"
        "0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch")
md5sums=("SKIP"
        "SKIP"
        "SKIP"
        "SKIP"
        "SKIP")

prepare(){
  cd linux-${versiontag}
  
  # Apply any patch
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  
  # cpopy the config file first
  # Copy "${srcdir}"/config to linux-${pkgver}/.config
  msg2 "Copy "${srcdir}"/config to linux-${versiontag}/.config"
  cp "${srcdir}"/config .config
  
  # CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team
  msg2 "enable CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team"
  scripts/config --enable CONFIG_STACK_VALIDATION

  # Enable IKCONFIG following Arch's philosophy
  msg2 "Enable CONFIG_IKCONFIG CONFIG_IKCONFIG_PROC following Arch's philosophy"
  scripts/config --enable CONFIG_IKCONFIG \
                 --enable CONFIG_IKCONFIG_PROC

  # User set. See at the top of this file
  if [ "$use_tracers" = "n" ]; then
    msg2 "Disabling FUNCTION_TRACER/GRAPH_TRACER..."
    scripts/config --disable CONFIG_FUNCTION_TRACER \
                   --disable CONFIG_STACK_TRACER
  fi

  if [ "$use_numa" = "n" ]; then
    msg2 "Disabling NUMA..."
    scripts/config --disable CONFIG_NUMA
  fi
  
  if [ "$use_ns" = "n" ]; then
    msg2 "Disabling CONFIG_USER_NS_UNPRIVILEGED"
    scripts/config --disable CONFIG_USER_NS_UNPRIVILEGED
  fi
  
  # Let's user choose microarchitecture optimization in GCC
  sh ${srcdir}/choose-gcc-optimization.sh $_microarchitecture

  # Setting version/localversion
  msg2 "Setting localversion..."
  scripts/setlocalversion --save-scmversion
  echo "-${pkgbase}" > localversion

  # config
  msg2 "make nconfig"
  make nconfig
}

build(){
  cd linux-${versiontag}

  # make -j$(nproc) all
  msg2 "make -j$(nproc) all"
  make -j$(nproc) all
}

_package(){
  pkgdesc="Mainline linux kernel and modules witch patch. NUMA disabled, FUNCTION_TRACER/GRAPH_TRACER disabled and CONFIG_USER_NS_UNPRIVILEGED disabled."
  depends=("coreutils" "kmod" "initramfs" "mkinitcpio")
  optdepends=("linux-firmware" "crda")
  install=${pkgbase}.install

  # Create system tree
  msg2 "Create system tree"
  install -dm755 "${pkgdir}"/usr
  install -dm755 "${pkgdir}"/boot
  install -dm755 "${pkgdir}"/etc/mkinitcpio.d

  cd linux-${versiontag}
  
  # Installing modules
  msg2 "Installing modules"
  make INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install

  # Copy bzImage to "${pkgdir}"/boot/vmlinuz-${pkgbase}
  msg2 "Copy bzImage to "${pkgdir}"/boot/vmlinuz-${pkgbase}"
  cp arch/x86/boot/bzImage "${pkgdir}"/boot/vmlinuz-${pkgbase}

  # Copy System.map to "${pkgdir}"/boot/System.map-${pkgbase}
  msg2 "Copy System.map to "${pkgdir}"/boot/System.map-${pkgbase}"
  cp System.map "${pkgdir}"/boot/System.map-${pkgbase}

  # Copy bzImage to "${pkgdir}"/usr/lib/modules/${modulestag}-${pkgbase}/vmlinuz
  msg2 "Copy bzImage to "${pkgdir}"/usr/lib/modules/${modulestag}-${pkgbase}/vmlinuz"
  cp arch/x86/boot/bzImage "${pkgdir}"/usr/lib/modules/${modulestag}-${pkgbase}/vmlinuz

  # Copy mainline-kernel.preset to "${pkgdir}"/etc/mkinitcpio.d/
  msg2 "Copy mainline-kernel.preset to "${pkgdir}"/etc/mkinitcpio.d/"
  cp "${srcdir}"/${pkgbase}.preset "${pkgdir}"/etc/mkinitcpio.d/

  # Remove build dir and source dir
  msg2 "Remove build dir and source dir"
  rm -rf "${pkgdir}"/usr/lib/modules/${modulestag}-${pkgbase}/build
  rm -rf "${pkgdir}"/usr/lib/modules/${modulestag}-${pkgbase}/source
}

_package-headers(){
  pkgdesc="Headers and scripts for building modules for the mainline-kernel package"
  depends=("mainline-kernel")

  # Create system tree
  msg2 "Create system tree"
  install -dm755 "${pkgdir}"/usr/lib/modules/${modulestag}-${pkgbase}/build
  
  cd linux-${versiontag}
  
  local builddir="$pkgdir/usr/lib/modules/${modulestag}-${pkgbase}/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map vmlinux localversion
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

_package-api-headers(){
  pkgdesc="Mainline linux kernel api headers"
  depends=("mainline-kernel")
  
  # Create system tree
  msg2 "Create system tree"
  install -dm755 "${pkgdir}"/usr
  install -dm755 "${pkgdir}"/usr/include
  install -dm755 "${pkgdir}"/usr/include/$pkgbase-api-headers
  
  cd linux-${versiontag}

  # Create fakeinstall dir
  msg2 "Create fakeinstall dir"
  mkdir fakeinstall

  # Installing headers to fakeinstall dir 
  msg2 "Installing headers to fakeinstall dir"
  make INSTALL_HDR_PATH="fakeinstall" -j$(nproc) headers_install

  # Move headers from fakeinstall dir to "${pkgdir}"/usr/include/${pkgbase}-api-headers/
  msg2 "Move headers from fakeinstall dir to "${pkgdir}"/usr/include/${pkgbase}-api-headers/"
  mv fakeinstall/include/* "${pkgdir}"/usr/include/$pkgbase-api-headers/
}

_package-docs() {
  pkgdesc="Documentation for the mainline-kernel package"
  depends=("mainline-kernel")

  # Create system tree
  msg2 "Create system tree"
  install -dm755 "${pkgdir}"/usr/lib/modules/${modulestag}-${pkgbase}/build
  
  cd linux-${versiontag}
  
  # make -j$(nproc) htmldocs
  msg2 "make -j$(nproc) htmldocs"
  make -j$(nproc) htmldocs
  
  local builddir="$pkgdir/usr/lib/modules/${modulestag}-${pkgbase}/build"

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
