# Maintainer: Frans-Willem Hardijzer <fw@hardijzer.nl>

_orig_pkgname=linux-firmware
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
_jakeday_commit=2b206b56e125c9fda4661dbcc91095e9bf993d28
pkgver=20190501.4b6cf2b.2b206b56e
pkgrel=1
pkgdesc="Firmware files for Linux, with Microsoft Surface related files replaced from https://github.com/jakeday/linux-surface/"
makedepends=('git' 'unzip')
arch=('any')
url="https://github.com/jakeday/linux-surface/"
license=('GPL2' 'GPL3' 'custom')
options=(!strip)
validpgpkeys=('4CDE8575E547BF835FE15807A31B6BD72486CFD6') # Josh Boyer <jwboyer@fedoraproject.org>
source=(
  "git+https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git#commit=${_commit}?signed"
  "git+https://github.com/jakeday/linux-surface.git#commit=${_jakeday_commit}"
)
md5sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}/linux-firmware"
}

pkgver() {
  cd "${srcdir}/${_orig_pkgname}"
  _date_orig=$(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD)
  cd "${srcdir}/linux-surface"
  _date_jakeday=$(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD)

  # Print highest of the two dates
  [ $_date_orig -gt $_date_jakeday ] && echo -n "$_date_orig" || echo -n "$_date_jakeday"

  # short rev from original linux-firmware
  echo -n "."
  cd "${srcdir}/${_orig_pkgname}"
  echo -n $(git rev-parse --short HEAD)


  # short rev from jakeday repository
  echo -n "."
  cd "${srcdir}/linux-surface"
  echo $(git rev-parse --short HEAD)
}

pkgver_orig() {
  cd "${srcdir}/${_orig_pkgname}"

  # Commit date + short rev
  echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

package_linux-firmware() {
  provides=("linux-firmware=$(pkgver_orig)")
  conflicts=('linux-firmware'
             'linux-firmware-git'
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

  cd "${srcdir}/${_orig_pkgname}"

  make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install
  rm "${pkgdir}/usr/lib/firmware/"{Makefile,README,configure,GPL-3}

  install -d "${pkgdir}/usr/share/licenses/${_orig_pkgname}"
  install -Dm644 LICEN* WHENCE "${pkgdir}/usr/share/licenses/linux-firmware/"

  # Trigger a microcode reload for configurations not using early updates
  install -d "${pkgdir}/usr/lib/tmpfiles.d"
  echo 'w /sys/devices/system/cpu/microcode/reload - - - - 1' \
    >"${pkgdir}/usr/lib/tmpfiles.d/${_orig_pkgname}.conf"
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
