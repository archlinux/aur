# Maintainer: Frans-Willem Hardijzer <fw@hardijzer.nl>

pkgbase=linux-firmware-surface
pkgname=(
  linux-firmware-surface-pro-3
  linux-firmware-surface-pro-4
  linux-firmware-surface-pro-2017
  linux-firmware-surface-pro-6
  linux-firmware-surface-studio
  linux-firmware-surface-laptop
  linux-firmware-surface-laptop-2
  linux-firmware-surface-book
  linux-firmware-surface-book-2
  linux-firmware-surface-book-2-1793
  linux-firmware-surface-go
)
_commit=4b6cf2bd1a9d53caa087403d943e7695009c1d0c # master
pkgrel=1
pkgdesc="Firmware files for Linux, with Microsoft Surface related files replaced from https://github.com/jakeday/linux-surface/"
makedepends=('git')
arch=('any')
url="https://github.com/jakeday/linux-surface/"
license=('custom')
options=(!strip)
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>
source=(
  "git+https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git#commit=${_commit}?signed"
  "git+https://github.com/jakeday/linux-surface.git"
)
md5sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}/linux-firmware"
}

pkgver() {
  cd "${srcdir}/linux-firmware"

  # Commit date + short rev
  echo -n $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)


  # Commit date + short rev
  echo -n "."
  cd "${srcdir}/linux-surface"
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

package_linux-firmware() {
  groups=('base')
  conflicts=('linux-firmware-git'
             'linux-firmware'
             'kernel26-firmware'
             'ar9170-fw'
             'iwlwifi-1000-ucode'
             'iwlwifi-3945-ucode'
             'iwlwifi-4965-ucode'
             'iwlwifi-5000-ucode'
             'iwlwifi-5150-ucode'
             'iwlwifi-6000-ucode'
             'rt2870usb-fw'
             'rt2x00-rt61-fw'
             'rt2x00-rt71w-fw')
  replaces=('kernel26-firmware'
            'ar9170-fw'
            'iwlwifi-1000-ucode'
            'iwlwifi-3945-ucode'
            'iwlwifi-4965-ucode'
            'iwlwifi-5000-ucode'
            'iwlwifi-5150-ucode'
            'iwlwifi-6000-ucode'
            'rt2870usb-fw'
            'rt2x00-rt61-fw'
            'rt2x00-rt71w-fw')
  provides='linux-firmware'

  cd "${srcdir}/linux-firmware"

  make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install
  rm "${pkgdir}/usr/lib/firmware/"{Makefile,README,configure,GPL-3}

  install -d "${pkgdir}/usr/share/licenses/linux-firmware"
  install -Dm644 LICEN* WHENCE "${pkgdir}/usr/share/licenses/linux-firmware/"

  # Trigger a microcode reload for configurations not using early updates
  install -d "${pkgdir}/usr/lib/tmpfiles.d"
  echo 'w /sys/devices/system/cpu/microcode/reload - - - - 1' \
    >"${pkgdir}/usr/lib/tmpfiles.d/linux-firmware.conf"
}

package_linux-firmware-surface-common() {
  package_linux-firmware
  install -d "${pkgdir}/usr/lib/firmware/mrvl"
  unzip -o "${srcdir}/linux-surface/firmware/mrvl_firmware.zip" -d "${pkgdir}/usr/lib/firmware/mrvl/"
  install -d "${pkgdir}/usr/lib/firmware/mwlwifi"
  unzip -o "${srcdir}/linux-surface/firmware/mwlwifi_firmware.zip" -d "${pkgdir}/usr/lib/firmware/mwlwifi/"
}

package_linux-firmware-surface-pro-3() {
  package_linux-firmware-surface-common
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_bxt.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
}

package_linux-firmware-surface-pro-4() {
  package_linux-firmware-surface-common
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v78.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_skl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
}

package_linux-firmware-surface-pro-2017() {
  package_linux-firmware-surface-common
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v102.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
}

package_linux-firmware-surface-pro-6() {
  package_linux-firmware-surface-common
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v102.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
}

package_linux-firmware-surface-studio() {
  package_linux-firmware-surface-common
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v76.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_skl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
}

package_linux-firmware-surface-laptop() {
  package_linux-firmware-surface-common
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v79.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
}

package_linux-firmware-surface-laptop-2() {
  package_linux-firmware-surface-common
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v79.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
}

package_linux-firmware-surface-book() {
  package_linux-firmware-surface-common
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v76.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_skl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
}

package_linux-firmware-surface-book-2() {
  package_linux-firmware-surface-common
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v137.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  install -d "${pkgdir}/usr/lib/firmware/nvidia/gp108"
  unzip -o "${srcdir}/linux-surface/firmware/nvidia_firmware_gp108.zip" -d "${pkgdir}/usr/lib/firmware/nvidia/gp108/"
  install -d "${pkgdir}/usr/lib/firmware/nvidia/gv100"
  unzip -o "${srcdir}/linux-surface/firmware/nvidia_firmware_gv100.zip" -d "${pkgdir}/usr/lib/firmware/nvidia/gv100/"
}

package_linux-firmware-surface-book-2-1793() {
  package_linux-firmware-surface-common
  install -d "${pkgdir}/usr/lib/firmware/intel/ipts"
  unzip -o "${srcdir}/linux-surface/firmware/ipts_firmware_v101.zip" -d "${pkgdir}/usr/lib/firmware/intel/ipts/"
  install -d "${pkgdir}/usr/lib/firmware/i915"
  unzip -o "${srcdir}/linux-surface/firmware/i915_firmware_kbl.zip" -d "${pkgdir}/usr/lib/firmware/i915/"
  install -d "${pkgdir}/usr/lib/firmware/nvidia/gp108"
  unzip -o "${srcdir}/linux-surface/firmware/nvidia_firmware_gp108.zip" -d "${pkgdir}/usr/lib/firmware/nvidia/gp108/"
  install -d "${pkgdir}/usr/lib/firmware/nvidia/gv100"
  unzip -o "${srcdir}/linux-surface/firmware/nvidia_firmware_gv100.zip" -d "${pkgdir}/usr/lib/firmware/nvidia/gv100/"
}

package_linux-firmware-surface-go() {
  package_linux-firmware-surface-common
  install -d "${pkgdir}/usr/lib/firmware/intel/ath10k"
  unzip -o "${srcdir}/linux-surface/firmware/ath10k_firmware.zip" -d "${pkgdir}/usr/lib/firmware/intel/ath10k/"
}

# vim:set ts=2 sw=2 et:
