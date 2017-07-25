# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Allan McRae <allan@archlinux.org>

# This should be built in.

set -u
pkgname='pacman-sync'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='alpm hook to sync after pacman installs to prevent corruption from using a flash disk or reboot to kernel crash'
arch=('any')
url='https://www.archlinux.org/pacman/alpm-hooks.5.html'
license=('GPL')
depends=('pacman')

package() {
  set -u
  install -Dm644 <(cat << EOF
# Force disks to sync to reduce the risk of data corruption

[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = Package
Target = *

[Action]
Description = sync all file systems
Depends = coreutils
When = PostTransaction
Exec = /usr/bin/sync
EOF
  ) "${pkgdir}/usr/share/libalpm/hooks/zzz_sync.hook"
  ln -s 'zzz_sync.hook' "${pkgdir}/usr/share/libalpm/hooks/00_sync.hook"
  set +u
}
set +u
