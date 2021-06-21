# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=suricata
pkgver=5.0.6
pkgrel=2
pkgdesc="An Open Source Next Generation Intrusion Detection and Prevention Engine"
arch=('i686' 'x86_64')
url="http://suricata-ids.org/"
license=('GPL2')
depends=('libcap-ng' 'libnet' 'jansson' 'libpcap' 'libyaml' 'pcre' 'rust' 'geoip' 'lua')
optdepends=('hyperscan' 'geoipupdate')
conflicts=('python-sphinx') # Issue with doc generation at compile time - https://github.com/OISF/suricata/pull/6123
backup=('etc/suricata/suricata.yaml'
        'etc/suricata/classification.config'
        'etc/suricata/reference.config'
        'etc/suricata/threshold.config')
source=(http://openinfosecfoundation.org/download/$pkgname-$pkgver.tar.gz{,.sig}
        suricata-update.{service,timer})
sha256sums=('d2045c7fbdbd56d1bed15aa8d48a2b3a46e4052599ac7ab89bf2fc3d6a08b491'
            'SKIP'
            '57505c464d30623c9d6611ca4b5d08a580c0116b20a4280f39c3720a3f369a92'
            '330c93e72a02f4f80972ab1641ee550b32cfdc2f40c78331294bcc009af06d71')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	      --enable-lua --enable-geoip
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/var/log/$pkgname

  install -Dm644 -t "${pkgdir}/etc/${pkgname}" "${pkgname}".yaml threshold.config etc/{classification.config,reference.config}
  install -Dm644 "${pkgname}".yaml "${pkgdir}/etc/${pkgname}/${pkgname}.yaml.default"
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system etc/"${pkgname}".service "${srcdir}"/suricata-update.{service,timer}
  sed -i -e 's:/var/run:/run:g' \
    -e 's:^Description=.*:Description=Suricata IDS/IPS daemon:g' \
    -e 's:^After=.*:After=network.target:g' \
    -e 's:^ExecStartPre=.*:PIDFile=suricata/suricata.pid:g' \
    -e 's:^ExecStart=.*:ExecStart=/usr/bin/suricata -c /etc/suricata/suricata.yaml --af-packet --pidfile /run/suricata/suricata.pid :g' \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  install -Dm644 etc/"${pkgname}".logrotate "${pkgdir}/etc/logrotate.d/${pkgname}"
  sed -i -e 's:/var/run:/run:g' \
  "${pkgdir}/etc/logrotate.d/${pkgname}"

  install -d "${pkgdir}"/var/lib/$pkgname/rules
  install -Dm644 rules/*.rules "${pkgdir}"/var/lib/$pkgname/rules/
}
