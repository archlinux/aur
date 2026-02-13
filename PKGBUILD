# Maintainer: krnlsoft <krnlsoft 4t hotmail d0t it>
# Maintainer: Yegor Pomortsev <yegor@pomortsev.com>
# Contributors: theokonos
# Contributors: Ted Sadler
# Contributors: dekart811
# Contributors: CodeImp

pkgname=veeam
pkgver=13.0.1.203
pkgrel=2
pkgdesc="Veeam Agent for Linux"
arch=(x86_64)
url=https://www.veeam.com/products/downloads.html
install=${pkgname}.install
license=(custom:veeam)
depends=(ncurses lvm2 fuse mlocate veeamblksnap-dkms)
source=("https://repository.veeam.com/backup/linux/agent-13/rpm/el/10/x86_64/veeam-$pkgver-1.el10.x86_64.rpm"
        "https://repository.veeam.com/backup/linux/agent-13/rpm/el/10/x86_64/veeam-libs-$pkgver-1.x86_64.rpm")
sha256sums=('adf05d8f5e13d4d5a112aa63749059746098c38f86f0fb20f71bf68b4c8eecf5'
            'fd5dcc000cc36398febbcc8fa471f109bcd41a5c4f3efbe16cfcaa0627ed0535')
noextract=("veeam-$pkgver-1.el10.x86_64.rpm"
           "veeam-libs-$pkgver-1.x86_64.rpm")
backup=('etc/veeam/veeam.ini'
        'usr/share/veeam/lpb_scheme.sql'
        'usr/share/veeam/db_upgrade.sql'
        'usr/share/veeam/db_scheme.sql')

package() {
  bsdtar -xf "$pkgname-$pkgver-1.el10.x86_64.rpm" -C "$pkgdir" -s /sbin/bin/ -s '|lib/systemd|usr/lib/systemd|'
  bsdtar -xf "$pkgname-libs-$pkgver-1.x86_64.rpm" -C "$pkgdir" -s /sbin/bin/ -s '|lib/systemd|usr/lib/systemd|'

  sed -i -e 's|# .include fipsmodule.cnf|.include /opt/veeam/veeamagentforlinux/openssl3/3.0.0/ssl/fipsmodule.cnf|' \
      "$pkgdir"/opt/veeam/veeamagentforlinux/openssl3/3.0.0/ssl/openssl.cnf

  sed -i -e 's|/var/run|/run|' -e 's|/sbin|/bin|' "$pkgdir"/usr/lib/systemd/system/veeamservice.service

  rm -rf "$pkgdir"/usr/lib/.build-id/

  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 "$pkgdir"/usr/share/veeam/EULA "$pkgdir"/usr/share/licenses/$pkgname/EULA
  install -Dm644 "$pkgdir"/usr/share/veeam/3rdPartyNotices.txt "$pkgdir"/usr/share/licenses/$pkgname/3rdPartyNotices.txt
}
