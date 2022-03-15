# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Luke R. <g4jc@bulletmail.org> GPG:  c25519/D85D2F527B0

pkgbase=samhain
pkgname=(
  'samhain-standalone'
  'samhain-client'
  'samhain-server'
)
pkgver=4.4.7
pkgrel=1
pkgdesc="Host Integrity Monitoring System"
arch=('x86_64')
url="https://www.la-samhna.de/samhain/index.html"
license=('GPL')
depends=('audit' 'acl' 'zlib' 'systemd' 'procps-ng')
source=(
  "https://www.la-samhna.de/archive/samhain_signed-$pkgver.tar.gz"
  'client-sysusers.conf'
  'client-tmpfiles.conf'
  'server-sysusers.conf'
  'server-tmpfiles.conf'
)
sha512sums=('dca68a9d25ee7569bdbb1009d66a91a73e5376294a790baf05570802b387c44a3bcb4bce5bf245a00c2d8e27d496c1aa19ece301f7ff295b955a072adb61950e'
            'ecffbc9d765bc211a19d37be51f1fb0f990c7b1f207cd7848f276f75558dff4d3b593e762f40102eb808bd5d5f54183c09b1f9f3a7988154f2f51f1d109a4f3c'
            'f6e892bef8e0d02d02dce81ee337bca2dc07354800565362892b2381f9dbd1e1d9f420931e2b50bb96b8d041b8b76b307a3c8f5717107ce68409c0d5bcb645e1'
            'a646a40279f4128eba62515a6133b79cf2a926ab4338329c78cfa0262cf2acc1cbba758be946f799783405702f3961ce650b56facc9dce41ba1b0efb3793c646'
            '20cdb5ed78d5789221b56f4763894372d3650c2981c251f60193835675a0b6f9a1b82746c8abd22e78c5c573ae42fc973836dd057ce1aae243f1a889b75a001b')
b2sums=('9b0f18259a0b96440b9614ba41a8c7b5b73f182c4979f68884cf84d18fe1c14ec58e5cab1a4709ffccfc6aafd9a0aee3588f04777a6134e301dd708db79abc66'
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
