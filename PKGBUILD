# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Luke R. <g4jc@bulletmail.org> GPG:  c25519/D85D2F527B0

pkgbase=samhain
pkgname=(
  'samhain-standalone'
  'samhain-client'
  'samhain-server'
)
pkgver=4.4.5
pkgrel=1
pkgdesc="Host Integrity Monitoring System"
arch=('x86_64')
url="https://www.la-samhna.de/samhain/index.html"
license=('GPL')
install=samhain.install
depends=('audit' 'acl' 'zlib' 'systemd' 'procps-ng')
source=("https://www.la-samhna.de/archive/samhain_signed-$pkgver.tar.gz"
        'client-sysusers.conf'
        'client-tmpfiles.conf'
        'server-sysusers.conf'
        'server-tmpfiles.conf')
b2sums=('3b44cdcafb2bb1b0bad8b8748f030fb4a0689346f616b176cf0ddee6514b1596c89e6da8c1f185da8d1ac556726aa922bed0144d125af2b237b710b5706bd1ea'
        'd326dc086b296ec7c18ce186da608b11109e03d9e9e7b475485b3c8eb06e4f7be36d9e716449cdca90e324631600e100aed57dca35626c126eb9caa3a5a36a4b'
        '35e2cdc7e3adee3f7453dd0e831c9f45221682ebe1c5ec3b29a5312622908bdc66e1b2efa0921a3e573c54f79c9862b81fa5c715962452b4c34efe6ffcf2254a'
        '21abdadbda821db8b071904b6a3f0a2ff552ea8c0c3d038d6e9af101fce055b2194d733d3b9aa6879880cf11dc590911741dcfa21ec46e83c1ca28641865cefc'
        '230651be72bb86979ce3a02d75e4e10025e90b0e20fd1f37df0005e0c2a559fedbb7afcb1e34728de9ce1a29b29c46e8f0b89d9e5bf3accc3b3e0fd639219b97')

prepare() {
  # ensure each package has a copy of the source
  for package in ${pkgname[@]}; do
    mkdir "$package-$pkgver"
    # upstream has an archive inside an archive
    bsdtar \
      --extract \
      --strip-components 1 \
      --directory "$package-$pkgver" \
      --file "$pkgbase-$pkgver.tar.gz"
  done

  # generate systemd service from template
  for service in samhain yule; do
    sed \
      -e "s:@install_name@:$service:" \
      -e "s:@mylockfile@:/run/$service/$service.pid:" \
      -e "s:@sbindir@:/usr/bin:" \
      "samhain-standalone-$pkgver/init/samhain.startSystemd.in" \
      > "$srcdir/$service.service"
  done
}

build() {
  local CONFIGURE_OPTS=(
    --prefix=/usr
    --sbindir=/usr/bin
    --libexecdir=/usr/lib
    --localstatedir=/var
    --sysconfdir=/etc
  )

  # samhain-standalone
  cd "samhain-standalone-$pkgver"
  ./configure \
    "${CONFIGURE_OPTS[@]}" \
    --with-pid-file=/run/samhain/samhain.pid
  make

  # samhain-client
  cd "$srcdir/samhain-client-$pkgver"
  ./configure \
    "${CONFIGURE_OPTS[@]}" \
    --with-pid-file=/run/samhain/samhain.pid \
    --enable-network=client
  make

  # samhain-server
  cd "$srcdir/samhain-server-$pkgver"
  ./configure \
    "${CONFIGURE_OPTS[@]}" \
    --with-pid-file=/run/yule/yule.pid \
    --enable-network=server
  make
}

package_samhain-standalone() {
  pkgdesc+=" (standalone)"
  conflicts=('samhain-client')
  backup=('etc/samhainrc')

  # systemd integration
  install -vDm644 client-sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 client-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm644 samhain.service -t "$pkgdir/usr/lib/systemd/system"

  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # remove unnecessary directories
  rm -rf "$pkgdir/"{var,run}
}

package_samhain-client() {
  pkgdesc+=" (client)"
  conflicts=('samhain-standalone')
  backup=('etc/samhainrc')

  # systemd integration
  install -vDm644 client-sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 client-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm644 samhain.service -t "$pkgdir/usr/lib/systemd/system"

  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # remove unnecessary directories
  rm -rf "$pkgdir/"{var,run}
}

package_samhain-server() {
  pkgdesc+=" (server)"
  optdepends=('perl: for signing scripts')
  backup=('etc/yulerc')

  # systemd integration
  install -vDm644 server-sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 server-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm644 yule.service -t "$pkgdir/usr/lib/systemd/system"

  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # fix incorrect permissions
  chown root:root "$pkgdir/etc/yulerc"

  # remove unnecessary directories
  rm -rf "$pkgdir/"{var,run}
}
