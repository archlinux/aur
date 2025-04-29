# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_gitname=linux-gpib-firmware
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=r7.20200609.8a5c6c2
pkgrel=2
pkgdesc="Firmware for some GPIB instruments: NI GPIB-USB-B, NI GPIB-USB-HS+, Agilent 82357A and 82357B, Agilent (HP) 82341C and 82341D, Agilent (HP) 82350A."
url="https://github.com/fmhess/linux_gpib_firmware"
arch=('any')
license=('LicenseRef-unknown')
depends=()
makedepends=(
  'git'
)
optdepends=(
  'linux-gpib:   For GPIB kernel drivers and udev rules this firmware is for.'
  'hsplus_load:  For (one-time) load of firmware to NI GPIB-USB-HS+.'
  "perl:         For '/usr/share/doc/linux-gpib-firmware/ni_gpib_usb_b/firmware_extract.pl'."
)
provides=(
  "${_pkgname}"
  "agilent_82357-gpib-firmware"
  "agilent_82357-gpib-firmware-git=${pkgver}"
  "agilent_82357a-gpib-firmware"
  "agilent_82357a-gpib-firmware-git=${pkgver}"
  "agilent_82357b-gpib-firmware"
  "agilent_82357b-gpib-firmware-git=${pkgver}"
  "hp_82341-gpib-firmware"
  "hp_82341-gpib-firmware-git=${pkgver}"
  "hp_82341c-gpib-firmware"
  "hp_82341c-gpib-firmware-git=${pkgver}"
  "hp_82341d-gpib-firmware"
  "hp_82341d-gpib-firmware-git=${pkgver}"
  "hp_82350a-gpib-firmware"
  "hp_82350a-gpib-firmware-git=${pkgver}"
  "ni_gpib_usb_b-gpib-firmware"
  "ni_gpib_usb_b-gpib-firmware-git=${pkgver}"
  "ni_gpib_usb_hsp-gpib-firmware"
  "ni_gpib_usb_hsp-gpib-firmware-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "agilent_82357-gpib-firmware"
  "agilent_82357a-gpib-firmware"
  "agilent_82357b-gpib-firmware"
  "hp_82341-gpib-firmware"
  "hp_82341c-gpib-firmware"
  "hp_82341d-gpib-firmware"
  "hp_82350a-gpib-firmware"
  "ni_gpib_usb_b-gpib-firmware"
  "ni_gpib_usb_hsp-gpib-firmware"
)
backup=()
replaces=()
source=(
  "${_gitname}::git+https://github.com/fmhess/linux_gpib_firmware.git"
  "license-unknown.md"
)
sha256sums=(
  'SKIP'  # Main upstream source
  '4af7b0cfa541aaa79a97af9e7c3d086fce9bdf969da37acac40343b0302709b0'  # license-unknown.md
)

prepare() {
  cd "${srcdir}/${_gitname}"

  git log > git.log

  # for _patch in "${srcdir}/0001-Fix-multiple-things-creating-warnings-also-remove-We.patch"; do
  #   printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
  #   patch -Np1 --follow-symlinks -i "${_patch}"
  # done

  rm -f hp_82341/{*.bin,generate_firmware}  # Delete precompiled binaries in order to build locally.
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  #if [ -z "${_ver}" ]; then
  #  error "Version could not be determined."
  #  return 1
  # fi
  if [ -z "${_rev}" ]; then
    error "Git commit count could not determined."
    return 1
  else
    #printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_gitname}"

  make -C hp_82341 -j1 generate_firmware
  make -C hp_82341 -j1 all
}

package() {
  cd "${srcdir}/${_gitname}"

  ## Installation path of `agilent_82357a` is choosen to conform to the paths given in `/usr/lib/udev/gpib_udev_fxloader` from the `linux-gpib-dkms`-package.

  local _linuxfirmwaredir="/usr/lib/firmware"
  local _datadir="/usr/share"
  local _usbfirmwaredir="${_datadir}/usb"
  local _docdir="/usr/share/doc/${_pkgname}"
  local _licensedir="/usr/share/licenses/${pkgname}"

  install -dvm755 "${pkgdir}/${_usbfirmwaredir}"

  install -Dvm644 -t "${pkgdir}/${_usbfirmwaredir}/agilent_82357a"  agilent_82357a/*.hex
  install -Dvm644 -t "${pkgdir}/${_docdir}/agilent_82357a"          agilent_82357a/{*.c,*.txt,README}
  ln -svr "${pkgdir}/${_usbfirmwaredir}/agilent_82357a"/*.hex  "${pkgdir}/${_docdir}/agilent_82357a"/

  # Target directory is 'ni_usb_gpib' in '/usr/lib/udev/gpib_udev_fxloader'.
  install -Dvm644 -t "${pkgdir}/${_usbfirmwaredir}/ni_usb_gpib"  ni_gpib_usb_b/*.hex
  install -Dvm644 -t "${pkgdir}/${_docdir}/ni_gpib_usb_b"          ni_gpib_usb_b/{*.txt,README}
  install -Dvm755 -t "${pkgdir}/${_docdir}/ni_gpib_usb_b"          ni_gpib_usb_b/*.pl
  ln -svr "${pkgdir}/${_usbfirmwaredir}/ni_usb_gpib"/*.hex  "${pkgdir}/${_docdir}/ni_gpib_usb_b"/

  # TODO: Check if this should be put into ${_usbfirmwaredir}/ or into ${_linuxfirmwaredir}/.
  # hsplus_load should upload the firmware to the device. This should be a one-time action.
  install -Dvm644 -t "${pkgdir}/${_usbfirmwaredir}/ni_usb_gpib"  ni_gpib_usb_hsp/*.bin
  install -Dvm644 -t "${pkgdir}/${_docdir}/ni_gpib_usb_hsp"  ni_gpib_usb_hsp/{*.pcapng,README}
  ln -svr "${pkgdir}/${_usbfirmwaredir}/ni_usb_gpib"/*.bin  "${pkgdir}/${_docdir}/ni_gpib_usb_hsp"/

  install -Dvm644 -t "${pkgdir}/${_linuxfirmwaredir}/hp_82341"  hp_82341/*.bin
  install -Dvm644 -t "${pkgdir}/${_docdir}/hp_82341"            hp_82341/{*.c,*.h,README}
  ln -svr "${pkgdir}/${_linuxfirmwaredir}/hp_82341"/*.bin  "${pkgdir}/${_docdir}/hp_82341"/

  install -Dvm644 -t "${pkgdir}/${_linuxfirmwaredir}/hp_82350a"  hp_82350a/*.bin
  install -Dvm644 -t "${pkgdir}/${_docdir}/hp_82350a"            hp_82350a/README
  ln -svr "${pkgdir}/${_linuxfirmwaredir}/hp_82350a"/*.bin  "${pkgdir}/${_docdir}/hp_82350a"/

  install -Dvm644 -t "${pkgdir}/${_docdir}"      'git.log' README
  install -Dvm644 -t "${pkgdir}/${_licensedir}"  "${srcdir}/license-unknown.md"
}

# vim:set ts=2 sw=2 et:
