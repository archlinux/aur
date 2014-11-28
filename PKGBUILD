# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=suricata
pkgver=2.0.4
pkgrel=1
pkgdesc="An Open Source Next Generation Intrusion Detection and Prevention Engine"
arch=('i686' 'x86_64')
url="http://openinfosecfoundation.org/index.php/download-suricata"
license=('GPL2')
depends=('libcap-ng' 'libnet' 'libpcap' 'libyaml' 'pcre')
optdepends=('snort: suricata can use rulesets provided by snort')
backup=('etc/suricata/suricata.yaml')
source=(http://openinfosecfoundation.org/download/$pkgname-$pkgver.tar.gz)
sha256sums=('677d97a829d9e05f664c82eb0372e870d5f6e9501ccee20130dfde4014bd5084')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc/$pkgname
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/var/log/$pkgname

  install -D -m644 $pkgname.yaml "${pkgdir}/etc/$pkgname/$pkgname.yaml"
  install -D -m644 classification.config "${pkgdir}/etc/$pkgname/classification.config"
  install -D -m644 reference.config "${pkgdir}/etc/$pkgname/reference.config"
 
  install -d "${pkgdir}/etc/$pkgname/rules"
  install -D -m644 rules/*.rules "${pkgdir}/etc/$pkgname/rules/"
}
