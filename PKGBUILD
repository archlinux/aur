# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
# Maintainer: Amish <contact at via dot aur>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
pkgname=suricata
pkgver=6.0.9
pkgrel=3
pkgdesc="A high performance Network IDS, IPS and Network Security Monitoring engine"
arch=('i686' 'x86_64')
url="https://suricata.io/"
license=('GPL2')
makedepends=('rust' 'clang')
depends=('hyperscan' 'jansson' 'libcap-ng' 'libmagic.so' 'libmaxminddb' 'libnet' 'libpcap' 'libyaml' 'lua' 'pcre' 'python-yaml')
optdepends=('geoipupdate: GeoIP2 databases')
conflicts=('suricata-nfqueue' 'rustup')
install=suricata.install
backup=('etc/suricata/suricata.yaml'
        'etc/suricata/local.yaml'
        'etc/suricata/classification.config'
        'etc/suricata/reference.config'
        'etc/suricata/threshold.config')
source=(https://www.openinfosecfoundation.org/download/${pkgname}-${pkgver}.tar.gz{,.sig}
        suricata-update.{service,timer})
validpgpkeys=('B36FDAF2607E10E8FFA89E5E2BA9C98CCDF1E93A') # Open Information Security Foundation
sha256sums=('3225edcbd0277545b7128df7b71652e6816f3b4978347d2f4fe297d55ed070e8'
            'SKIP'
            '57505c464d30623c9d6611ca4b5d08a580c0116b20a4280f39c3720a3f369a92'
            '330c93e72a02f4f80972ab1641ee550b32cfdc2f40c78331294bcc009af06d71')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	      --with-clang=/usr/bin/clang --without-docs \
	      --disable-gccmarch-native --enable-lua --enable-geoip
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 -t "${pkgdir}/etc/${pkgname}" "${pkgname}".yaml threshold.config etc/{classification.config,reference.config}
  install -Dm644 "${pkgname}".yaml "${pkgdir}/etc/${pkgname}/${pkgname}.yaml.default"
  install -Dm644 /dev/null "${pkgdir}/etc/${pkgname}/local.yaml"

  echo "include: local.yaml" >> "${pkgdir}/etc/${pkgname}/${pkgname}.yaml"
  sed -i -e 's:/var/run:/run/suricata:g' \
    -e 's:^#magic-file\: /.*:magic-file\: /usr/share/file/misc/magic.mgc:' \
    -e '/^  - suricata.rules/ a \ \ - local.rules' \
    -e 's/^#run-as:/run-as:/' \
    -e 's/^#  user:.*/  user: suricata/' \
    -e 's/^#  group:.*/  group: suricata/' \
    -e 's/^# threshold-file:/threshold-file:/' \
    "${pkgdir}/etc/${pkgname}/${pkgname}.yaml"

  install -Dm644 etc/"${pkgname}".logrotate "${pkgdir}/etc/logrotate.d/${pkgname}"
  sed -i -e 's:/var/run:/run/suricata:g' \
    "${pkgdir}/etc/logrotate.d/${pkgname}"
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system etc/"${pkgname}".service "${srcdir}"/suricata-update.{service,timer}
  sed -i -e 's:/var/run:/run/suricata:g' \
    -e 's:^Description=.*:Description=Suricata IDS/IPS daemon:g' \
    -e 's:^After=.*:After=network.target:g' \
    -e 's:^ExecStartPre=.*:PIDFile=suricata/suricata.pid:g' \
    -e 's:^ExecStart=.*:ExecStart=/usr/bin/suricata -c /etc/suricata/suricata.yaml --pidfile /run/suricata/suricata.pid --af-packet :g' \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  echo "u suricata -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf" << 'EOF'
d /run/suricata 0750 suricata suricata
d /var/log/suricata 0755 suricata suricata
d /var/lib/suricata 0750 suricata suricata
d /var/lib/suricata/rules 0750 suricata suricata
d /var/lib/suricata/update 0750 suricata suricata
f /var/lib/suricata/rules/local.rules 0640 suricata suricata
EOF
}
