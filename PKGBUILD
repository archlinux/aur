# Maintainer: krnlsoft <krnlsoft 4t hotmail d0t it>
# Maintainer: Yegor Pomortsev <yegor@pomortsev.com>
# Contributors: theokonos
# Contributors: Ted Sadler
# Contributors: dekart811
# Contributors: CodeImp

pkgname=veeam
pkgver=13.0.1.404
pkgrel=1
pkgdesc="Veeam Agent for Linux"
arch=(x86_64)
url=https://www.veeam.com/products/downloads.html
install=${pkgname}.install
license=(custom:veeam)
depends=(ncurses lvm2 fuse mlocate veeamblksnap-dkms)
source=("https://repository.veeam.com/backup/linux/agent-13/rpm/el/10/x86_64/veeam-$pkgver-1.el10.x86_64.rpm"
        "https://repository.veeam.com/backup/linux/agent-13/rpm/el/10/x86_64/veeam-libs-$pkgver-1.x86_64.rpm")
sha256sums=('afc42f2844f21aa43235bbbf2e94fa2f4db96d86b237c3914c49faa14b2c36a2'
            'e7fce9fced0d2374e69bc3b37b43bd8498fd70f26212f4aeb9a9f467139137dd')
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
