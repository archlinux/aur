# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dtw <dibble.at.thewrecker.dot.net>
# Contributor: shawnifoley http://bbs.archlinux.org/viewtopic.php?t=11492
# Contributor: sebastien le guillerm <geekitus@tele2.fr>

pkgname=wifi-radar
pkgver=2.0.s10
pkgrel=2
pkgdesc="A PyGTK2 utility for managing WiFi profiles"
arch=('any')
url="https://wifi-radar.tuxfamily.org/"
license=('GPL')
depends=('net-tools' 'pygtk' 'wireless_tools')
optdepends=('polkit: needed if you launch wifi-radar from menu')
source=(https://wifi-radar.tuxfamily.org/pub/$pkgname-$pkgver.tar.bz2{,.asc}
        org.archlinux.pkexec.wifi-radar.policy
        wifi-radar_polkit)
sha256sums=('87245344eaa6e4d385d88cabf2f02ee3098480506b6d1cd237068bb2c6302046'
            'SKIP'
            '2993dafcd933703ec6ba844d8c5836716c08d0e3b1bec91c6c5fd0f78eb4570c'
            '613188206b787c6fe91c1d4cc3501bb5f26067c5b2e36702e95b9a10979f6e03')
validpgpkeys=('810867A40D3EB3C10C7781A06531A000118A449B') # Sean Robinson <seankrobinson@gmail.com>

prepare() {
  cd "${srcdir}/$pkgname-$pkgver"

  # python2 fix
  sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $pkgname

  # Fix iwlist and iwconfig path
   sed -i -e 's|/sbin/iwlist|/usr/bin/iwlist|' \
     -i -e 's|/sbin/iwconfig|/usr/bin/iwconfig|' \
     -i -e 's|/sbin/ifconfig|/usr/bin/ifconfig|' \
     -i -e 's|/sbin/route|/usr/bin/route|' \
     -i -e 's|/sbin/dhcpcd|/usr/bin/dhcpcd|' \
     -i -e 's|/usr/sbin/wpa_supplicant|/usr/bin/wpa_supplicant|' $pkgname

  # Modify desktop file
  sed -i -e "s/Exec=gksudo -S wifi-radar/Exec=wifi-radar_polkit/" $pkgname.desktop
}

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/usr" sysconfdir="$pkgdir/etc" sbindir="$pkgdir/usr/bin" install

  # remove empty /etc dir
  rmdir "${pkgdir}"/etc

  # Install policy file
  install -Dm644 "${srcdir}/org.archlinux.pkexec.wifi-radar.policy" \
                 "${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.wifi-radar.policy"

  # Install launcher script
  install -m755 "${srcdir}/wifi-radar_polkit" \
                "${pkgdir}/usr/bin/wifi-radar_polkit"
}
