# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=suricata
pkgver=2.0.8
pkgrel=1
pkgdesc="An Open Source Next Generation Intrusion Detection and Prevention Engine"
arch=('i686' 'x86_64')
url="http://openinfosecfoundation.org/index.php/download-suricata"
license=('GPL2')
depends=('libcap-ng' 'libnet' 'libpcap' 'libyaml' 'pcre')
optdepends=('snort: suricata can use rulesets provided by snort')
backup=('etc/suricata/suricata.yaml')
source=(http://openinfosecfoundation.org/download/$pkgname-$pkgver.tar.gz)
sha256sums=('7af6394cb81e464f5c1ac88a1444030e30940caab6e53688a6d9eb652226d1be')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/var/log/$pkgname

  install -Dm644 $pkgname.yaml "${pkgdir}"/etc/$pkgname/$pkgname.yaml
  install -Dm644 classification.config "${pkgdir}"/etc/$pkgname/classification.config
  install -Dm644 reference.config "${pkgdir}"/etc/$pkgname/reference.config
 
  install -d "${pkgdir}"/etc/$pkgname/rules
  install -Dm644 rules/*.rules "${pkgdir}"/etc/$pkgname/rules/
}
