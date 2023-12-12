# Maintainer: Jeka <evgeny.myandin[at]gmail[dot]com>
# Manjaro credits:
# Bernhard Landauer <bernhard@manjaro.org>
# Philip Müller <philm[at]manjaro[dot]org>
# Arch credits:
# Tobias Powalowski <tpowa@archlinux.org>
# Thomas Baechler <thomas@archlinux.org>
#
# Kernel for Manjaro/EndeavourOS/Arch (ACS override patch include)

pkgbase=linux-jcore
pkgname=('linux-jcore' 'linux-jcore-headers')
_kernelname=-jcore
_hostname=jcore
pkgver=6.6.6
pkgrel=2
pkgdesc="Kernel for Manjaro/EndeavourOS/Arch (ACS override patch include)"
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=(bc docbook-xsl libelf pahole python-sphinx git inetutils kmod xmlto cpio perl tar xz)
replaces=('linux-acs-manjaro' 'linux-acs-manjaro-headers')
options=('!strip')

source=("https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.xz"
        config
        # Upstream Patches
        # ARCH Patches
        0101-ZEN_Add_sysctl_and_CONFIG_to_disallow_unprivileged_CLONE_NEWUSER.patch
        0102-drivers-firmware-skip-simpledrm-if-nvidia-drm.modese.patch
        # MANJARO Patches
        # Realtek patch
        0999-patch_realtek.patch
        # ROG ALLY Patches
        0000-hid-asus-add-const-to-read-only-outgoing-usb-buffer.patch
        0001-hid-asus-reset-the-backlight-brightness-level-on-resume.patch
        v14.1-0001-HID-asus-fix-more-n-key-report-descriptors-if-.patch
        v14.1-0002-HID-asus-make-asus_kbd_init-generic-remove-rog.patch
        v14.1-0003-HID-asus-add-ROG-Ally-N-Key-ID-and-keycodes.patch
        v14.1-0004-HID-asus-add-ROG-Ally-xpad-settings.patch
        v14.1-fix-defaults1.patch
        0006-platform-x86-asus-wmi-disable-USB0-hub-on-ROG-Ally-b.patch
        0007-mt7921e_Perform_FLR_to_recovery_the_device.patch
        # AMD GPU reset patches
        0301-drm-Add_GPU_reset_sysfs_event.patch
        0302-drm-amdgpu-add_work_function_for_GPU_reset_event.patch
        0303-drm-amdgpu-schedule_GPU_reset_event_work_function.patch
        # No overrides ROG ally <= 323 BIOS
        0001-ALSA-hda-cs35l41-Support-ASUS-2023-laptops-with-miss.patch
        0001-ALSA-hda-cs35l41-Improve-support-for-ASUS-ROG-Ally.patch
        # Additional ALLY patches
        ROG-ALLY-NCT6775-PLATFORM.patch
        0001-ROG-ALLY-bmi323-device.patch
        # Steamdeck HID patches
        0001-HID.patch
        # ACS override patch
        '0999-acs.gitpatch')

sha256sums=('ebf70a917934b13169e1be5b95c3b6c2fea5bc14e6dc144f1efb8a0016b224c8'
            '043ada1688a42e652bb0b339d2f9732c323c22da96bb2ca2bcf144a731c5e981'
            '05f04019d4a2ee072238c32860fa80d673687d84d78ef436ae9332b6fb788467'
            'e1d17690dd21e8d5482b63ca66bfe6b478d39e8e8b59eedd53adb0a55ebc308d'
            '3aa9f1ca47bb078f3c9a52fe61897cf4fe989068cd7e66bfa6644fd605fa40d2'
            'fb2cd8a3ea9d47bd78c99b8ece1f3959c20b4de97a7959a12650f989f5c724da'
            '7f3194f1a7c5ebc27bbfa4559cfd9a2ccffddbbd2d259c0d9c68631cb66c5855'
            '176adde8fc3069bd28393bf0c9d788f1b0f9a186678aec4dc17b0b081c57f97b'
            '493fa177cf602f087e981e95fad3764e305f4c486d4c2ef78255388b913be9cf'
            '50ea381758fb8a8566f38a509fe7cf0448c77eaec5103066cafc2ecf02db1e9f'
            '970687b811034e722befde62bcf6d51c7442a217074ed0fb71460bb1803f4c64'
            'c00b23162fdbf50de375d8e444b6d59e2e3630cfac55ec1d06114b9dad00e542'
            '836e88044263f7bc474ca466b3d0d98c39e265db94925c300d0b138492946a13'
            'd673d034fbcd80426fd8d9c6af56537c5fe5b55fe49d74e313474d7fc285ecc1'
            '1f62542a889a6c2eafd43acd0699f54720ed891eeda66a4a9261d75b92f28b7f'
            '6bc2c1b9a485c852b45e4064e8b9b559b9b26113fdc80bf9653af44c0886fde2'
            '559f01074cda3c161996617f1b7bc6cbbce0efc50e2cf9e843d60922ff2e8063'
            '79970a4729572cb25fd4644d66f38ecd5b3e1610a42ea4bbe436b501f3469fa2'
            '430a7f971d78d0873708e0ad38fba602ceafefd4da8ebbf9d9c591bc4799acb5'
            'cfcd5c177423df8b7b98b0500fe7ab0757f895ed945c33e205963f0069c7a3be'
            '5574a68b1c7733769835bb856a8c32e54398dfde59f264708672b87b73b3c6ea'
            '7c948773d758418d8a436067265d678c444827562c46b9fced2ff31ced108481'
            '458d7e024d33d4965b14b9b987f01a2884ff28761cff5da7c6a54132a95e9f36')

prepare() {
  cd "linux-${pkgver}"

  local src
  for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      msg2 "Applying patch: $src..."
      patch -Np1 < "../$src"
  done

  msg2 "apply 0999 acs override patch"
  patch --ignore-whitespace --fuzz 3 -p1 < "../0999-acs.gitpatch"

  cat "../config" > ./.config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  if [ "${_hostname}" != "" ]; then
    sed -i "s|CONFIG_DEFAULT_HOSTNAME=.*|CONFIG_DEFAULT_HOSTNAME=\"${_hostname}\"|g" ./.config
  fi

  msg "set extraversion to pkgrel"
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  msg "don't run depmod on 'make install'"
  # We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  msg "get kernel version"
  make prepare

  msg "rewrite configuration"
  yes "" | make config >/dev/null
}

build() {
  cd "linux-${pkgver}"

  msg "build"
  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-jcore() {
  pkgdesc="Kernel for Manjaro/EndeavourOS/Arch (ACS override patch include)"
  depends=('coreutils' 'linux-firmware' 'kmod' 'initramfs')
  optdepends=('dkms: Dynamic Kernel Module System' 'wireless-regdb: to set the correct wireless channels of your country')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)

  cd "linux-${pkgver}"

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}/usr" INSTALL_MOD_STRIP=1 modules_install

  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  cp arch/x86/boot/bzImage "${pkgdir}/usr/lib/modules/${_kernver}/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "${pkgbase}" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_kernver}/pkgbase"

  # add kernel version
  echo "${pkgver}-${pkgrel}${_kernelname} x64" > "${pkgdir}/boot/${pkgbase}-${CARCH}.kver"

  # remove build and source links
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/build

  # now we call depmod...
  depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"
}

package_linux-jcore-headers() {
  pkgdesc="Headers and scripts for building modules for the Kernel for Manjaro/EndeavourOS/Arch (ACS override patch include)"
  depends=('gawk' 'python' 'libelf' 'pahole')

  cd "linux-${pkgver}"
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile
  install -Dt "${_builddir}" -m644 vmlinux

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/x86" -m644 "arch/x86/Makefile"
  install -Dt "${_builddir}/arch/x86/kernel" -m644 "arch/x86/kernel/asm-offsets.s"

  cp -t "${_builddir}/arch/x86" -a "arch/x86/include"

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "${_builddir}/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # copy in Kconfig files
  find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  install -Dt "${_builddir}/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */x86/ ]] && continue
    rm -r "${_arch}"
  done

  # remove documentation files
  rm -r "${_builddir}/Documentation"

  # strip scripts directory
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip $STRIP_SHARED "$file" ;;
    esac
  done < <(find "${_builddir}" -type f -perm -u+x ! -name vmlinux -print0 2>/dev/null)
  strip $STRIP_STATIC "${_builddir}/vmlinux"

  # remove unwanted files
  find ${_builddir} -name '*.orig' -delete
}
