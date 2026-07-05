# Maintainer: Pierre-Loup A. Griffais (pgriffais@valvesoftware.com)

pkgname=jupiter-hw-support
_srctag=jupiter-20250728.1
_srcver=${_srctag#jupiter-}
pkgver=${_srcver//-/.}
pkgrel=8
arch=('any')
url="https://gitlab.steamos.cloud/jupiter/jupiter-hw-support"
pkgdesc="Jupiter HW support package"
license=('MIT')
depends=('python-evdev'
         'python>=3.13'
         'python-crcmod' 'python-click' 'python-progressbar'
         'python-hid>=1.0.6-2' # for jupiter-controller-update
         'jq' # for jupiter-controller-update
         'alsa-utils' # for the sound workarounds
         'parted' 'e2fsprogs' # for sdcard formatting
         'udisks2>=2.9.4-1.1' # for mounting external drives with the 'as-user' option
        )
optdepends=('grub-steamos')
makedepends=('rsync' 'git' 'openssh' 'xorg-xcursorgen')
source=("git+https://gitlab.com/evlaV/jupiter-hw-support.git#tag=$_srctag")
sha512sums=('fcf30755d44bcc3b16614748d3680cc3f0be12b2e5452e9f7a37806bf5ec2d22733b28bcdbf6816e105311e5f04ea6a34436a1794f0eba61d2e380e1d4e95387')
# Some pre-compiled binaries such as `rfp-cli` break when touched by `strip` :-\
options+=('!strip')

package() {
  rsync -a "$srcdir"/jupiter-hw-support/* "$pkgdir"

  cd $pkgdir/usr/share/steamos/
  xcursorgen $pkgdir/usr/share/steamos/steamos-cursor-config $pkgdir/usr/share/icons/steam/cursors/default

  # Remove BIOS updater entirely
  rm -rf "$pkgdir/usr/share/jupiter_bios_updater"
  rm -rf "$pkgdir/usr/share/jupiter_bios"
  rm -f "$pkgdir/usr/bin/jupiter-biosupdate"
  rm -f "$pkgdir/usr/bin/foxnet-biosupdate"
  rm -f "$pkgdir/usr/bin/steamos-polkit-helpers/jupiter-biosupdate"
  rm -f "$pkgdir/usr/lib/systemd/system/jupiter-biosupdate.service"
  rm -f "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/jupiter-biosupdate.service"
  sed -i '/<action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers\/jupiter-biosupdate">/,/<\/action>/d' \
    "$pkgdir/usr/share/polkit-1/actions/org.valve.steamos.policy"

  # Remove SteamOS branch selector entirely
  rm -f "$pkgdir/usr/bin/steamos-polkit-helpers/steamos-select-branch"
  sed -i '/<action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-select-branch">/,/<\/action>/d' \
    "$pkgdir/usr/share/polkit-1/actions/org.valve.steamos.policy"

  # Remove SteamOS updater entirely
  rm -f "$pkgdir/usr/bin/steamos-polkit-helpers/steamos-update"
  sed -i '/<action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-update">/,/<\/action>/d' \
    "$pkgdir/usr/share/polkit-1/actions/org.valve.steamos.policy"
}
