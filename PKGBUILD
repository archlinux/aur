# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
# Maintainer: Amish <contact at via dot aur>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
#
# NOTE: This package conflicts with hyperscan. If hyperscan is installed,
# remove it first with: pacman -Rdd hyperscan

pkgname=suricata
pkgver=8.0.5
pkgrel=1
pkgdesc="A high performance Network IDS, IPS and Network Security Monitoring engine, Vectorscan instead of hyperscan"
arch=('x86_64')
url="https://suricata.io/"
license=('GPL2')
makedepends=('rust' 'clang' 'cbindgen' 'llvm' 'pkgconf')
depends=('vectorscan' 'jansson' 'libcap-ng' 'libmagic.so' 'libmaxminddb' 'libnet' 'libpcap' 'libyaml' 'pcre' 'python-yaml' 'libunwind' 'libbpf')
optdepends=('geoipupdate: GeoIP2 databases')
conflicts=('suricata-nfqueue')
install=suricata.install
backup=('etc/suricata/suricata.yaml'
        'etc/suricata/local.yaml'
        'etc/suricata/classification.config'
        'etc/suricata/reference.config'
        'etc/suricata/threshold.config')
source=(https://www.openinfosecfoundation.org/download/${pkgname}-${pkgver}.tar.gz{,.sig}
        suricata-update.{service,timer})
sha256sums=('04cad79a2a91499a729e41bfb570060c3cedb94cd5a5584d79582ebd18574ee0'
            'SKIP'
            '57505c464d30623c9d6611ca4b5d08a580c0116b20a4280f39c3720a3f369a92'
            '330c93e72a02f4f80972ab1641ee550b32cfdc2f40c78331294bcc009af06d71')

validpgpkeys=('B36FDAF2607E10E8FFA89E5E2BA9C98CCDF1E93A')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --with-clang=/usr/bin/clang --without-docs \
              --enable-ebpf --enable-ebpf-build \
              --disable-gccmarch-native \
              --enable-geoip \
              --with-libhs-includes=/usr/include/vectorscan \
              --with-libhs-libraries=/usr/lib

  # Build the Rust crate first so cargo compiles the vendored liblua.a
  make -C rust

  # Locate the static liblua.a produced by the suricata-lua-sys crate.
  # Static libs are unaffected by -Wl,--as-needed so this reliably links.
  local _lua_a
  _lua_a=$(find "$(pwd)/rust/target/release/build" -path '*/suricata-lua-sys-*/out/lua/liblua.a' 2>/dev/null | head -1)
  [[ -n "${_lua_a}" ]] || { echo "ERROR: vendored liblua.a not found"; return 1; }

  # Patch src/Makefile in-place so that every subsequent make call
  # (build and install) sees liblua.a in LIBS.  Patching here is
  # necessary because the path is only known after cargo has run.
  sed -i "s|^LIBS = |LIBS = ${_lua_a} |" src/Makefile

  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check || true
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
