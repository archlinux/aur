# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: André Silva <emulatorman@riseup.net>
# Contributor: Márcio Silva <coadde@riseup.net>
# Contributor (Parabola): Nicolás Reynolds <fauno@kiwwwi.com.ar>
# Contributor (Parabola): Sorin-Mihai Vârgolici <smv@yobicore.org>
# Contributor (Parabola): Michał Masłowski <mtjm@mtjm.eu>
# Contributor (Parabola): Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor (Parabola): Luke R. <g4jc@openmailbox.org>

# Based on linux package

_replacesarchkernel=('linux%') # '%' gets replaced with kernel suffix
_replacesoldkernels=() # '%' gets replaced with kernel suffix
_replacesoldmodules=() # '%' gets replaced with kernel suffix

pkgbase=linux-libre
pkgver=5.11.2
pkgrel=1
pkgdesc='Linux-libre'
rcnver=5.11
rcnrel=armv7-x10
url='https://linux-libre.fsfla.org/'
arch=(i686 x86_64 armv7h)
license=(GPL2)
makedepends=(
  bc kmod libelf pahole cpio perl tar xz
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
)
makedepends_armv7h=(uboot-tools vboot-utils dtc) # required by linux-libre-chromebook
options=('!strip')
_srcname=linux-5.11
source=(
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_srcname##*-}-gnu/linux-libre-${_srcname##*-}-gnu.tar.xz"{,.sign}
  "https://linux-libre.fsfla.org/pub/linux-libre/releases/$pkgver-gnu/patch-${_srcname##*-}-gnu-$pkgver-gnu.xz"{,.sign}
  "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_"{clut224.ppm,vga16.ppm,mono.pbm}{,.sig}
  config.i686 config.x86_64 config.armv7h    # the main kernel config files
  linux-armv7h.preset                        # armv7h preset file for mkinitcpio ramdisk
  "kernel"{.its,.keyblock,_data_key.vbprivk} # files for signing Chromebooks kernels

  # maintain the TTY over USB disconnects
  # http://www.coreboot.org/EHCI_Gadget_Debug
  0001-usb-serial-gadget-no-TTY-hangup-on-USB-disconnect-WI.patch
  # fix Atmel maXTouch touchscreen support
  # https://labs.parabola.nu/issues/877
  # http://www.fsfla.org/pipermail/linux-libre/2015-November/003202.html
  0002-fix-Atmel-maXTouch-touchscreen-support.patch
  # Arch Linux patches
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0002-Revert-drm-amd-display-reuse-current-context-instead.patch
  0003-drm-amdgpu-fix-shutdown-with-s0ix.patch
  sphinx-workaround.patch  # Sphinx 3.5 broke the build again
)
source_i686=(
  # avoid using zstd compression in ultra mode (exhausts virtual memory)
  no-ultra-zstd.patch
)
source_armv7h=(
  # RCN patch (CM3 firmware deblobbed and bloatware removed)
  "https://repo.parabola.nu/other/rcn-libre/patches/$rcnver/rcn-libre-$rcnver-$rcnrel.patch"{,.sig}
  # Arch Linux ARM patches
  0001-ARM-atags-add-support-for-Marvell-s-u-boot.patch
  0002-ARM-atags-fdt-retrieve-MAC-addresses-from-Marvell-bo.patch
  0003-SMILE-Plug-device-tree-file.patch
  0004-fix-mvsdio-eMMC-timing.patch
  0005-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch
  0006-set-default-cubietruck-led-triggers.patch
  0007-exynos4412-odroid-set-higher-minimum-buck2-regulator.patch
  0008-ARM-dove-enable-ethernet-on-D3Plug.patch
  0009-USB-Armory-MkII-support.patch
  # ChromiumOS patches
  0001-CHROMIUM-block-partitions-efi-Add-support-for-IGNORE.patch
)
validpgpkeys=(
  '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
  '6DB9C4B4F0D8C0DC432CF6E4227CA7C556B2BA78' # David P.
)
sha512sums=('3a34006add9ea318b0c2863388925ba34d57d342535b00c9ebc61fbfc69ef206b64af21c35b101466508c4308b5da310743c8add74dd703e259612953104ae43'
            'SKIP'
            '64c5a9076b502d3da538e781f3819af24ddb90316c2d181037c0f77e5204ec555aa0464d58fbd0025ee6c4f1b28db33d38ddc8de0bc2a83be9190c900fdf6a2c'
            'SKIP'
            '13cb5bc42542e7b8bb104d5f68253f6609e463b6799800418af33eb0272cc269aaa36163c3e6f0aacbdaaa1d05e2827a4a7c4a08a029238439ed08b89c564bb3'
            'SKIP'
            '7a3716bfe3b9f546da309c7492f3e08f8f506813afeb1c737a474c83313d5c313cf4582b65215c2cfce3b74d9d1021c96e8badafe8f6e5b01fe28d2b5c61ae78'
            'SKIP'
            '267295aa0cea65684968420c68b32f1a66a22d018b9d2b2c1ef14267bcf4cb68aaf7099d073cbfefe6c25c8608bdcbbd45f7ac8893fdcecbf1e621abdfe9ecc1'
            'SKIP'
            'cb15fa2a3fc6de36a58c4473fe886802849bb3bd5e6d93886b9687c79982a5ed857e18240b48c650cc5586581be2b90344d0bed5d9090ecfb9b36054c982ab51'
            'c0b40adc343bf0c400075cfe593564575804723075b46628b0fe88857bad468e0a5c2d9b89a9186c49de6ca754155c66486811ebe338fa48de9231df61e0c19a'
            '51e8b4da770067e8257d292622d865cb16ac57fdfd8967bdfb74efec197dae9eab958e5637a728640ae60885bdde41c06c8076227a4f83db0b752215f91f3a87'
            '53103bf55b957b657039510527df0df01279dec59cda115a4d6454e4135025d4546167fa30bdc99107f232561c1e096d8328609ab5a876cf7017176f92ad3e0b'
            '167bc73c6c1c63931806238905dc44c7d87c5a5c0f6293159f2133dfe717fb44081018d810675716d1605ec7dff5e8333b87b19e09e2de21d0448e447437873b'
            'bb6718984a7357c9b00c37e4788480e5b8b75018c172ecc1441bc3fc5d2d42444eb5d8c7f9d2e3a7d6fed6d03acb565e3c0559486e494c40a7fe6bd0570c9ede'
            '143dea30c6da00e504c99984a98a0eb2411f558fcdd9dfa7f607d6c14e9e7dffff9cb00121d9317044b07e3e210808286598c785ee854084b993ec9cb14d8232'
            '02af4dd2a007e41db0c63822c8ab3b80b5d25646af1906dc85d0ad9bb8bbf5236f8e381d7f91cf99ed4b0978c50aee37cb9567cdeef65b7ec3d91b882852b1af'
            'b8fe56e14006ab866970ddbd501c054ae37186ddc065bb869cf7d18db8c0d455118d5bda3255fb66a0dde38b544655cfe9040ffe46e41d19830b47959b2fb168'
            '748d98aef69e93959eab6a7f20a7972aff50c577a079bba807b10fe9b3b98799b47215d76797360d336ba4c3c656d7eafe3e81f2a59a2b6888d1884071db6e95'
            '798b96e22ae79a62516e38194f4a377c8bed22c6fbf9f33fcdf205136bf1e5429c01a803c71f8eb412df2a5637eb6266fd4677618d64f64e9b53725371f574c6'
            '6e0cdf8ae337245cb4df53496649905d4900dc0401b5fa7ebea70a46ed88f2f5759a1bfe571207975e1d92c734babdb8b3505cd432731d0713ce1339b6df71d4'
            '93c03382b6678ce5e94a5d06e6737965629d7dc49d16e968d225e664d88f07a12abe0e04908f1cdaa75ff1cde88783cae9f0794d1075bc65bc7baeff392e0ae2')
sha512sums_i686=('3a346ff5e0fdefafd28bc3dd0e4b6cd68e3f0014e59d1611d99f2edb8d074fd32649eeb0894a7e340e4f907b5cfc0e08e0753e0427a68dc113bb22835a892968')
sha512sums_armv7h=('baf54a93781f5df415be494ebb10d2ef29da33807cf7bdf5ad84746c90b13f04c95a9d330faf1f11ef41b6fb1e09628455be686c3c9e6ea9ac028ee45f3b81bb'
                   'SKIP'
                   'b832287560c841e292d71be01c65045ee2ee6ac41f05176ebe349d730b5b79887bb629d176d5fd16a3e7ebb5e51de30b6d6fad6fad53821063188248bd1415bb'
                   'f997a0afaaffb66533168f5d9cc341871eb54feb88d6ce578e816add82596bedf4dc242510e171e1e5b56464cf701384a32ed916176ea0c2db24209d754d3c58'
                   '96b97f6e721d179d88e7b4084ebb62ce30ddd13cbbcb367147e6646c8487107af36b3610d10e53abffae3a83736cdd7734e5dbcadb1909ced278f40a20302861'
                   '14f3ef9f2211e98198e96bd4f91978720acd703ee778698b85916cef73c1aea648d1d08a075f2ed334f5c27b9933274fa0651401e0baa3570f389a20aaec54e8'
                   'b464e9af459c37c929ba30cdb7eb575038e970c9d91ff98fa37c0bc6161538b42a802dde34882772cf665130038158cb985fe06d65313f7c584c6c63045199d8'
                   '9d8019b8f525d5614d476ac34a35a40e8e1994f444a686b561c57b8ae488fcc44ffca9d034cea7b2271a2b7a7fa3a2ba2fcaa452504c320eff0bc3fc4de64ed2'
                   'b3cf13c44b8b35bb7610206161a251cbf90299b0533e8e23465b9ae566feed510c5722aceadb7e2097de439362d0689de5692a091cbe8bec2994ef5290622095'
                   '463d68de99f434fd3409ee620eaa7b648d6627c5a04cfeab65b91053129e71bf906db817fd9770297ae1e38f8a5a84be4d20a1d1717e6821478f2c1bbc416cb2'
                   '813fbfb17659e4e7512367f03b06f9bc54070886f5e7206548deced60032f92d3ca0beb78416706662bf713cb0f7a5d8d81f8f08b911ca8254b417e82306d829'
                   '7bda2ad7eb81af802873cb6764cb9c675ec50ceeb5adc487881ebc8c316cf55f836e56c2cc67494a2920e86494861db2eb924b7ff9b151ae3c5b0e493c373bf9')

_replacesarchkernel=("${_replacesarchkernel[@]/\%/${pkgbase#linux-libre}}")
_replacesoldkernels=("${_replacesoldkernels[@]/\%/${pkgbase#linux-libre}}")
_replacesoldmodules=("${_replacesoldmodules[@]/\%/${pkgbase#linux-libre}}")

case "$CARCH" in
  i686|x86_64) KARCH=x86;;
  armv7h) KARCH=arm;;
esac

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  if [ "${_srcname##*-}" != "$pkgver" ]; then
    echo "Applying upstream patch..."
    patch -Np1 < "../patch-${_srcname##*-}-gnu-$pkgver-gnu"
  fi

  echo "Adding freedo as boot logo..."
  install -m644 -t drivers/video/logo \
    ../logo_linux_{clut224.ppm,vga16.ppm,mono.pbm}

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux-libre}" > localversion.20-pkgname

  if [ "$CARCH" = "armv7h" ]; then
    local src_armv7h
    for src_armv7h in "${source_armv7h[@]}"; do
      src_armv7h="${src_armv7h%%::*}"
      src_armv7h="${src_armv7h##*/}"
      [[ $src_armv7h = *.patch ]] || continue
      echo "Applying patch $src_armv7h..."
      patch -Np1 < "../$src_armv7h"
    done
  fi

  if [ "$CARCH" = "i686" ]; then
    local src_i686
    for src_i686 in "${source_i686[@]}"; do
      src_i686="${src_i686%%::*}"
      src_i686="${src_i686##*/}"
      [[ $src_i686 = *.patch ]] || continue
      echo "Applying patch $src_i686..."
      patch -Np1 < "../$src_i686"
    done
  fi

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config.$CARCH .config
  make olddefconfig

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make all
  #make htmldocs
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-libre-firmware: firmware images needed for some devices')
  provides=(LINUX-ABI_VERSION="$pkgver" VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  if [ "$CARCH" = "armv7h" ]; then
    echo "Installing device tree binaries..."
    make INSTALL_DTBS_PATH="$pkgdir/boot/dtbs/$pkgbase" dtbs_install

    # armv7h presets only work with ALL_kver=$kernver
    backup=("etc/mkinitcpio.d/$pkgbase.preset")
    echo "Installing mkinitcpio preset..."
    sed "s|%PKGBASE%|$pkgbase|g;s|%KERNVER%|$kernver|g" ../linux-armv7h.preset \
      | install -Dm644 /dev/stdin "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
  fi
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/$KARCH" -m644 arch/$KARCH/Makefile
  if [[ $CARCH = i686 ]]; then
    install -Dt "$builddir/arch/$KARCH" -m644 arch/$KARCH/Makefile_32.cpu
  fi
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  if [[ -e tools/objtool/objtool ]]; then
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool
  fi

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/$KARCH" -a arch/$KARCH/include
  install -Dt "$builddir/arch/$KARCH/kernel" -m644 arch/$KARCH/kernel/asm-offsets.s

  # from linux-armv7
  if [ "$CARCH" = "armv7h" ]; then
    for i in dove omap2; do
      mkdir -p "$builddir/arch/$KARCH/mach-$i"
      cp -t "$builddir/arch/$KARCH/mach-$i/" -a arch/$KARCH/mach-$i/include
    done
    for i in omap orion versatile; do
      mkdir -p "$builddir/arch/$KARCH/plat-$i"
      cp -t "$builddir/arch/$KARCH/plat-$i/" -a arch/$KARCH/plat-$i/include
    done
  fi

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */$KARCH/ ]] && continue
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

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}

_package-chromebook() {
  pkgdesc="$pkgdesc kernel sign for Veyron Chromebooks"
  depends=(linux-libre=$pkgver)
  provides=("${_replacesarchkernel[@]/%/-armv7-chromebook=$pkgver}")
  conflicts=("${_replacesarchkernel[@]/%/-armv7-chromebook}" "${_replacesoldkernels[@]/%/-armv7-chromebook}")
  replaces=("${_replacesarchkernel[@]/%/-armv7-chromebook}" "${_replacesoldkernels[@]/%/-armv7-chromebook}")
  install=$pkgbase-chromebook.install

  cd $_srcname

  cp ../kernel.its .
  mkimage -D "-I dts -O dtb -p 2048" -f kernel.its kernel.signed
  dd if=/dev/zero of=bootloader.bin bs=512 count=1
  echo 'console=tty0 init=/sbin/init root=PARTUUID=%U/PARTNROFF=1 rootwait rw noinitrd' > cmdline

  echo "Creating kernel sign..."
  vbutil_kernel \
    --pack vmlinux.kpart \
    --version 1 \
    --vmlinuz kernel.signed \
    --arch arm \
    --keyblock ../kernel.keyblock \
    --signprivate ../kernel_data_key.vbprivk \
    --config cmdline \
    --bootloader bootloader.bin

  echo "Installing kernel sign..."
  mkdir -p "$pkgdir/boot"
  cp vmlinux.kpart "$pkgdir/boot"
}

pkgname=("$pkgbase" "$pkgbase-headers") #"$pkgbase-docs")
[[ $CARCH = armv7h ]] && pkgname+=("$pkgbase-chromebook")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
