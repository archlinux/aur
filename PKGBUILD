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
pkgver=6.4.11
pkgrel=1
pkgdesc="Kernel for Manjaro/EndeavourOS/Arch (ACS override patch include)"
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=(bc docbook-xsl libelf pahole python-sphinx git inetutils kmod xmlto cpio perl tar xz)
replaces=('linux-acs-manjaro' 'linux-acs-manjaro-headers')
options=('!strip')

source=("https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.xz"
        'config'
        # Upstream Patches
        # ARCH Patches
        '0101-ZEN_Add_sysctl_and_CONFIG_to_disallow_unprivileged_CLONE_NEWUSER.patch'
        'e65a5fe09577d17e2fded61067f759f2bf02f6c0.patch'
        # MANJARO Patches
        '0203-asus-ally-asus-hid-6.3-v2.patch'
        '0204-mt7921e_Perform_FLR_to_recovery_the_device.patch'
        '0206-asus-ally-bluetooth.patch'
        # ACS override patch
        '0999-acs.gitpatch'
        # fix sleep cs35l41
        '0001-ALSA-cs35l41-Use-mbox-command-to-enable-speaker-outp.patch'
        '0002-ALSA-cs35l41-Poll-for-Power-Up-Down-rather-than-wait.patch'
        '0003-ALSA-hda-cs35l41-Check-mailbox-status-of-pause-comma.patch'
        '0004-ALSA-hda-cs35l41-Ensure-we-correctly-re-sync-regmap-.patch'
        '0005-ALSA-hda-cs35l41-Ensure-we-pass-up-any-errors-during.patch'
        '0006-ALSA-hda-cs35l41-Move-Play-and-Pause-into-separate-f.patch'
        '0007-ALSA-hda-hda_component-Add-pre-and-post-playback-hoo.patch'
        '0008-ALSA-hda-cs35l41-Use-pre-and-post-playback-hooks.patch'
        '0009-ALSA-hda-cs35l41-Rework-System-Suspend-to-ensure-cor.patch'
        '0010-ALSA-hda-cs35l41-Add-device_link-between-HDA-and-cs3.patch'
        '0011-ALSA-hda-cs35l41-Ensure-amp-is-only-unmuted-during-p.patch')

sha256sums=('546b68b5097d3c0d74722de62aae217729d98e45fbb6bd458b490ac21ea40918'
            'f55c1744ab79ba72a987c333c1feaf2290d5dcec709596a0d9f84f00839a51a7'
            '05f04019d4a2ee072238c32860fa80d673687d84d78ef436ae9332b6fb788467'
            '36a32f67a9725ae96ad0ba0fb8a6262f666c53e304cc142e88826daa0afc65aa'
            'a38b50b8c73332d3d16950bf8adcae7ead34391a60f74d05a58935cd3dc8a12d'
            'd673d034fbcd80426fd8d9c6af56537c5fe5b55fe49d74e313474d7fc285ecc1'
            'd5f95fe43882fb68c0a7e1ce8d831788e222f841de3e636e85a89ea655fed40e'
            '458d7e024d33d4965b14b9b987f01a2884ff28761cff5da7c6a54132a95e9f36'
            '27aaf7e14c7f5e127f5b658352ca5c3650477a92462139557aefb73bcea2b418'
            '74da118887929f06afb57eaee716ff433ee5972c9dc91166fc08e66f44edb8e8'
            'c5ac510677e58ac6b189939ac853e64bf9ad026a614a47f4cb535ad62bf41163'
            '88f0d69dad01ccfef899b6b08abe162fc7743d40571232dff9a7d9093890d0a8'
            '826bfa21b613d9c198d375d902958c90bb30171aee602c1806aaf99212abbb40'
            '0dae5e24249b712f1501ead600c8ef4a5df21484e39e06a1dbafb57929c4999f'
            '8dddf5537e3feedbf9f9c67f3c19fa7412d9e01b4f78023262b8fa340d3f47b2'
            '3774b4eba753eb5f3768a28a68eb1a17557c0347275c19b8133f9f74d64a80df'
            'a5daf210a6f72dde5b477d4b6d38a162b2698cac6c5fcfd4e4fd606274f34cec'
            'b9298bde48a9f6c5d028150d627c05c71880e2693933ef2fe070f090e80876a5'
            '4d53a6853b63c0f01b60b408bee61fa729656f925e50fa55ae3cba309668242a')

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
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}

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
