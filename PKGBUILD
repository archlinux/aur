# Maintainer: Erik Westrup <erik.westrup@gmail.com>
# Maintainer: Todd E Johnson <todd@toddejohnson.net>

pkgname=restic-automatic-backup-scheduler
pkgver=7.3.1
pkgrel=1
pkgdesc="Automatic backups using restic + systemd timers with Backblaze B2 storage backend."
arch=('any')
url="https://github.com/erikw/$pkgname"
license=('BSD' 'custom')
depends=('restic' 'bash' 'systemd')
replaces=('restic-systemd-automatic-backup')
source=("$pkgname-$pkgver.tar.gz::https://github.com/erikw/$pkgname/archive/v$pkgver.tar.gz")
install="restic-automatic-backup-scheduler.install"
sha256sums=('099a0b799a126194ebc5a057e84de52013c7491e801a562e9e993bf83dca2851')
backup=('etc/restic/backup_exclude.txt' 'etc/restic/default.env.sh' 'etc/restic/_global.env.sh' 'etc/restic/pw.txt')
# Backup <5.0.0 conf files for those who upgrade.
backup+=('etc/restic/default.env' 'etc/restic/_global.env')
# Backup <3.0.0 conf files for those who upgrade.
backup+=('etc/restic/b2_env.sh' 'etc/restic/b2_pw.txt' 'etc/restic/backup_exclude')

package() {
  cd "$pkgname-$pkgver"

  # We're not allowed to install to /bin; let's move to /usr/bin
  sed -i -e 's|$INSTALL_PREFIX/bin|$INSTALL_PREFIX/usr/bin|g' bin/* etc/restic/* usr/lib/systemd/system/*
  mv bin usr/

  # PREFIX         - where we will install built files to
  # INSTALL_PREFIX - where files on the target system will be installed to
  # DIR_SCRIPT     - modified as of move fron /bin to /usr/bin
  make PREFIX="$pkgdir" INSTALL_PREFIX= DIR_SCRIPT=usr/bin install-systemd

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
