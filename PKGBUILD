# Maintainer: krnlsoft <krnlsoft 4t hotmail d0t it>
# Contributors: theokonos
# Contributors: Ted Sadler
# Contributors: dekart811
# Contributors: CodeImp

pkgname=veeam
pkgver=6.2.0.101
pkgrel=1
pkgdesc="Veeam Agent for Linux"
arch=('x86_64')
url=https://repository.veeam.com/backup/linux/agent
install=${pkgname}.install
license=('custom')
depends=('ncurses' 'lvm2' 'fuse' 'mlocate' 'veeamblksnap-dkms')
source=( "$url/rpm/el/8/x86_64/veeam-$pkgver-1.el8.x86_64.rpm" "$url/rpm/el/9/x86_64/veeam-libs-$pkgver-1.x86_64.rpm" )
sha256sums=('d53752a915350ef20931699b7cb5d1c5104485e5e7d3d15055900f8e32916692'
  'c2eae10e6901548bdd50d4210d2e282c63b18e8656e5825c612200cf54b8be8a')
noextract=("$pkgname-$pkgver-1.el8.x86_64.rpm")
backup=('etc/veeam/veeam.ini' 'usr/share/veeam/lpb_scheme.sql' 'usr/share/veeam/db_upgrade.sql' 'usr/share/veeam/db_scheme.sql' 'var/lib/veeam/veeam_db.sqlite' 'var/lib/veeam/veeam_db.sqlite-shm' 'var/lib/veeam/veeam_db.sqlite-wal')

package() {
  bsdtar -xf $pkgname-$pkgver-1.el8.x86_64.rpm -C "$pkgdir" -s /sbin/bin/ -s '|lib/systemd|usr/lib/systemd|'
  bsdtar -xf $pkgname-libs-$pkgver-1.x86_64.rpm -C "$pkgdir" -s /sbin/bin/ -s '|lib/systemd|usr/lib/systemd|'
  sed -i -e 's|/var/run|/run|' -e 's|/sbin|/bin|' "$pkgdir"/usr/lib/systemd/system/veeamservice.service
  rm -rf "$pkgdir"/usr/lib/.build-id/
  install -d  "$pkgdir"/usr/share/licenses/$pkgname/
  ln -s ../../doc/$pkgname/EULA "$pkgdir"/usr/share/licenses/$pkgname/
  ln -s ../../doc/$pkgname/3rdPartyNotices.txt "$pkgdir"/usr/share/licenses/$pkgname/
}
