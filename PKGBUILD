# Maintainer: krnlsoft <krnlsoft 4t hotmail d0t it>
# Contributors: theokonos
# Contributors: Ted Sadler
# Contributors: dekart811
# Contributors: CodeImp

pkgname=veeam
pkgver=6.3.1.1016
pkgrel=1
pkgdesc="Veeam Agent for Linux"
arch=('x86_64')
url=https://repository.veeam.com/backup/linux/agent
install=${pkgname}.install
license=('custom')
depends=('ncurses' 'lvm2' 'fuse' 'mlocate' 'veeamblksnap-dkms')
source=( "$url/rpm/el/8/x86_64/veeam-$pkgver-1.el8.x86_64.rpm" "$url/rpm/el/9/x86_64/veeam-libs-$pkgver-1.x86_64.rpm" )
sha256sums=('962ff4d38d6bb47058dfd42690e93e95c53e6075960b70fe5aab173199f93e6a'
  '2e6332e4714b2e626cb6cb7eb688d7e703626191d2d9e36821b9983d4cea6cd5')
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
