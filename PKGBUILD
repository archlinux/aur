# Maintainer: Yegor Pomortsev <yegor@pomortsev.com>
# Contributors: krnlsoft <krnlsoft 4t hotmail d0t it>
# Contributors: theokonos
# Contributors: Ted Sadler
# Contributors: dekart811
# Contributors: CodeImp

pkgname=veeam
pkgver=13.1.2.11
pkgrel=1
pkgdesc="Veeam Agent for Linux"
arch=(x86_64)
url=https://www.veeam.com/products/downloads.html
install=${pkgname}.install
license=(custom:veeam)
depends=(ncurses lvm2 fuse mlocate veeamblksnap-dkms)
conflicts=(veeam-nosnap veeam-6)
options=(!strip)
source=("https://repository.veeam.com/backup/linux/agent-13/rpm/el/10/x86_64/veeam-$pkgver-1.el10.x86_64.rpm"
        "https://repository.veeam.com/backup/linux/agent-13/rpm/el/10/x86_64/veeam-libs-$pkgver-1.x86_64.rpm")
sha256sums=('911d2aa8a288c523175f7ee406ea028caad288620f36e6f3410777ce1b949841'
            'c6070bbc86474ff91b618b5444132278a0a37377cfe28f7b428e88af2d4bd9bc')
noextract=("veeam-$pkgver-1.el10.x86_64.rpm"
           "veeam-libs-$pkgver-1.x86_64.rpm")
backup=('etc/veeam/veeam.ini'
        'usr/share/veeam/lpb_scheme.sql'
        'usr/share/veeam/db_upgrade.sql'
        'usr/share/veeam/db_scheme.sql')

package() {
  bsdtar -xf "$pkgname-$pkgver-1.el10.x86_64.rpm" -C "$pkgdir" -s /sbin/bin/ -s '|lib/systemd|usr/lib/systemd|'
  bsdtar -xf "$pkgname-libs-$pkgver-1.x86_64.rpm" -C "$pkgdir" -s /sbin/bin/ -s '|lib/systemd|usr/lib/systemd|'

  sed -i -e 's|# .include fipsmodule.cnf|.include /opt/veeam/veeamagentforlinux/openssl_fips_redistributable/3.1.2/ssl/fipsmodule.cnf|' \
      "$pkgdir"/opt/veeam/veeamagentforlinux/openssl_fips_redistributable/3.1.2/ssl/openssl.cnf

  sed -i -e 's|/var/run|/run|' -e 's|/sbin|/bin|' "$pkgdir"/usr/lib/systemd/system/veeamservice.service

  rm -rf "$pkgdir"/usr/lib/.build-id/

  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 "$pkgdir"/usr/share/veeam/EULA "$pkgdir"/usr/share/licenses/$pkgname/EULA
  install -Dm644 "$pkgdir"/usr/share/veeam/3rdPartyNotices.txt "$pkgdir"/usr/share/licenses/$pkgname/3rdPartyNotices.txt
}
