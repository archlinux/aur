# Maintainer: Yegor Pomortsev <yegor@pomortsev.com>
# Contributors: krnlsoft <krnlsoft 4t hotmail d0t it>
# Contributors: theokonos
# Contributors: Ted Sadler
# Contributors: dekart811
# Contributors: CodeImp

_pkgbase=veeam
pkgname=${_pkgbase}-6
pkgver=6.3.2.1207
pkgrel=1
pkgdesc="Veeam Agent for Linux (v6)"
arch=(x86_64)
url=https://www.veeam.com/products/downloads.html
install=${_pkgbase}.install
license=(custom:veeam)
depends=(ncurses lvm2 fuse mlocate veeamblksnap-6-dkms)
conflicts=(veeam)
source=("https://repository.veeam.com/backup/linux/agent/rpm/el/10/x86_64/veeam-$pkgver-1.el10.x86_64.rpm"
        "https://repository.veeam.com/backup/linux/agent/rpm/el/10/x86_64/veeam-libs-$pkgver-1.x86_64.rpm")
sha256sums=('99618a97bfa9e00e43641fe5fd95bbdb552d31ef178918382534ee7ff75633cf'
            'f8f398dcecef2d5b162d1a5a85e2897e03b64325abd244b56536de5b145cbf0c')
noextract=("veeam-$pkgver-1.el10.x86_64.rpm"
           "veeam-libs-$pkgver-1.x86_64.rpm")
backup=('etc/veeam/veeam.ini'
        'usr/share/veeam/lpb_scheme.sql'
        'usr/share/veeam/db_upgrade.sql'
        'usr/share/veeam/db_scheme.sql')

package() {
  bsdtar -xf "${_pkgbase}-$pkgver-1.el10.x86_64.rpm" -C "$pkgdir" -s /sbin/bin/ -s '|lib/systemd|usr/lib/systemd|'
  bsdtar -xf "${_pkgbase}-libs-$pkgver-1.x86_64.rpm" -C "$pkgdir" -s /sbin/bin/ -s '|lib/systemd|usr/lib/systemd|'

  sed -i -e 's|/var/run|/run|' -e 's|/sbin|/bin|' "$pkgdir"/usr/lib/systemd/system/veeamservice.service

  rm -rf "$pkgdir"/usr/lib/.build-id/

  install -dm755 "$pkgdir"/usr/share/licenses/${_pkgbase}/
  install -Dm644 "$pkgdir"/usr/share/veeam/EULA "$pkgdir"/usr/share/licenses/${_pkgbase}/EULA
  install -Dm644 "$pkgdir"/usr/share/veeam/3rdPartyNotices.txt "$pkgdir"/usr/share/licenses/${_pkgbase}/3rdPartyNotices.txt
}
