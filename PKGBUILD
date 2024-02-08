# Maintainer: Max Lübke <maxluebke(at)gmail.com>
# Contributor: Jeremy MountainJohnson <jay@jskier.com>
# Contributor: Amish <contact at via dot aur>
# Contributor: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=suricata-git
_pkgname=${pkgname%-git}
pkgver=7.0.2.r331.gdb99c45d23
pkgrel=1
pkgdesc="A high performance Network IDS, IPS and Network Security Monitoring engine"
arch=('i686' 'x86_64')
url="https://suricata.io/"
license=('GPL-2.0-only')
makedepends=('rust' 'clang' 'cbindgen' 'llvm' 'git')
depends=('hyperscan' 'jansson' 'libbpf' 'libcap-ng' 'libmagic.so' 'libmaxminddb' 'libnet' 'libpcap' 'libunwind' 'libyaml' 'lua' 'pcre2' 'python-yaml')
optdepends=('geoipupdate: GeoIP2 databases')
provides=('suricata')
conflicts=('suricata')
source=(${_pkgname}::git+https://github.com/OISF/suricata.git
       suricata-update.{service,timer}
)
sha256sums=('SKIP'
            '57505c464d30623c9d6611ca4b5d08a580c0116b20a4280f39c3720a3f369a92'
            '330c93e72a02f4f80972ab1641ee550b32cfdc2f40c78331294bcc009af06d71')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Remove 'suricata' prefix; remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/suricata\-//g;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  ./scripts/bundle.sh
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --with-clang=/usr/bin/clang --without-docs \
      --enable-ebpf --enable-ebpf-build \
      --disable-gccmarch-native --enable-lua --enable-geoip
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 -t "${pkgdir}/etc/${_pkgname}" "${_pkgname}".yaml threshold.config etc/{classification.config,reference.config}
  install -Dm644 "${_pkgname}".yaml "${pkgdir}/etc/${_pkgname}/${_pkgname}.yaml.default"
  install -Dm644 /dev/null "${pkgdir}/etc/${_pkgname}/local.yaml"

  echo "include: local.yaml" >> "${pkgdir}/etc/${_pkgname}/${_pkgname}.yaml"
  sed -i -e 's:/var/run:/run/suricata:g' \
    -e 's:^#magic-file\: /.*:magic-file\: /usr/share/file/misc/magic.mgc:' \
    -e '/^  - suricata.rules/ a \ \ - local.rules' \
    -e 's/^#run-as:/run-as:/' \
    -e 's/^#  user:.*/  user: suricata/' \
    -e 's/^#  group:.*/  group: suricata/' \
    -e 's/^# threshold-file:/threshold-file:/' \
    "${pkgdir}/etc/${_pkgname}/${_pkgname}.yaml"

  install -Dm644 etc/"${_pkgname}".logrotate "${pkgdir}/etc/logrotate.d/${_pkgname}"
  sed -i -e 's:/var/run:/run/suricata:g' \
    "${pkgdir}/etc/logrotate.d/${_pkgname}"
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system etc/"${_pkgname}".service "${srcdir}"/suricata-update.{service,timer}
  sed -i -e 's:/var/run:/run/suricata:g' \
    -e 's:^Description=.*:Description=Suricata IDS/IPS daemon:g' \
    -e 's:^After=.*:After=network.target:g' \
    -e 's:^ExecStartPre=.*:PIDFile=suricata/suricata.pid:g' \
    -e 's:^ExecStart=.*:ExecStart=/usr/bin/suricata -c /etc/suricata/suricata.yaml --pidfile /run/suricata/suricata.pid --af-packet :g' \
    "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

  echo "u suricata -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf" << 'EOF'
d /run/suricata 0750 suricata suricata
d /var/log/suricata 0755 suricata suricata
d /var/lib/suricata 0750 suricata suricata
d /var/lib/suricata/rules 0750 suricata suricata
d /var/lib/suricata/update 0750 suricata suricata
f /var/lib/suricata/rules/local.rules 0640 suricata suricata
EOF
}
