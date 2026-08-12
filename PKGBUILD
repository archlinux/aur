# Maintainer: L1bT0rch <L1bT0rch@proton.me>
# Contributor: Pierre-Loup A. Griffais (pgriffais@valvesoftware.com)

pkgname=jupiter-hw-support
_srctag=jupiter-20260807.1
_srcver=${_srctag#jupiter-}
pkgver=${_srcver//-/.}
pkgrel=2
arch=(x86_64)
url="https://github.com/evlav/jupiter-hw-support"
pkgdesc="Jupiter HW support package"
license=('MIT')
depends=('python-evdev'
         'python>=3.14'
         'python-crcmod' 'python-click' 'python-progressbar'
         'python-hid>=1.0.6-2' # for jupiter-controller-update
         'jq' # for jupiter-controller-update
         'alsa-utils' # for the sound workarounds
         'parted' 'e2fsprogs' # for sdcard formatting
         'udisks2>=2.9.4-1.1' # for mounting external drives with the 'as-user' option
         'holo-plymouth-themes' # for the splash screen when firmware updates on boot up
         'plymouth'             # for the splash screen when firmware updates on boot up
        )
optdepends=('grub-steamos')
makedepends=('rsync' 'git' 'xorg-xcursorgen')
source=("git+https://github.com/evlav/jupiter-hw-support.git#tag=$_srctag")
sha512sums=('SKIP')
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
}
