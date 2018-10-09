# Maintainer: Sébastien Luttringer

pkgname=quagga
pkgver=1.2.4
pkgrel=2
pkgdesc='BGP/OSPF/ISIS/RIP/RIPNG routing daemon suite'
arch=('x86_64')
url='http://www.quagga.net'
license=('GPL2')
depends=('libcap' 'libnl' 'net-snmp' 'readline' 'ncurses' 'perl' 'c-ares' 'openssl')
options=('!buildflags')
validpgpkeys=('C1B5C3ED3000F2BFCD66F3B76FE57CA8C1A4AEA6') # Quagga Release Signing Key
source=("https://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc}
        'quagga.sysusers'
        'quagga.tmpfiles'
        'bgpd.service'
        'isisd.service'
        'ospf6d.service'
        'ospfd.service'
        'pimd.service'
        'ripd.service'
        'ripngd.service'
        'zebra.service')
sha512sums=('3e72440bcccfd3c1a449a62b7ff8623441256399a2bee0a39fa0a19694a5a78ac909c5c2128a24735bc034ea8b0811827293b480a2584a3a4c8ae36be9cf1fcd'
            'SKIP'
            '722ef24de4834ab80ebdace0de4aa50ea76d2d4ecc5c51092f1975fd08a9b187986058eeaa2242fe6f4a3967f08806cba8070f2e318bfc9193cb0e83b7464a43'
            '82938833f885985fdd3ecb2683e0b7dec853fbe1938f5778fcde0efb58dd329603f32b1e9ce53e6da8c1219c5ede74c0dbfbc98da150227cc6e1020a4e1ca556'
            '912215eaf757a2acb8fa55bac430805f98be0e9ed12b03a5eae71df8931bdf322d7ba26729bfc2d780de5399da1a43e9b5061ded0fbe1bfce8d8107fae9d4830'
            '9914897b89fb4c85eee86fdecc18497bc021e2343852d1b9d6148fdb1f1c0e5b2cd28c82626bf2b747af581eb859635aaa0f5e8147887d36c3070133de9668c0'
            'b13742656ef0071f4edb523a5d3a2b832960d463fc78a8f375484f5184284202e442156621c70655af02f00b8fecec720e441be60e35d07161de3610e53f998b'
            '4e5cc34d4534fb70bf6674244bffc7f789fc24450ab3614366f0a750450cdfa47aac09399d1a5c4e64faa98be46701f15b8db72897c34d1518e044d25a920837'
            '29cda79d9d4be2acf3fba5dcc4a692c4784b5b5674a6948138254b0ea54596891f26273f1a44307d8baccd23ed99754f96909f75132bd657459583f3f7ccc05d'
            'a630e11cf447ebf4a8a55849e61d0c75de60c79247fd80954085b39b22660e2ec34537f2f2d9ce15bfa0fc89bb2acd5e3f156f70dc63c9eb608fb2cee6b36ae3'
            '8e5608da659dd2da9b708dd1b140ba3c240679797f1a1ee82494db24996303448c664215bdeb2ce58ea801162b6918bddf72366df3546151cd930e6428a1f5d4'
            '68baa888e1c12706c28ee6a6176e9a37f0a05bd8b14e648746b987a03bacb1c801e246b9820cf59508290e9e5ba42954fe3aae3355dd325fcf54b25e119a6156')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/quagga \
    --localstatedir=/run/quagga \
    --enable-exampledir=/usr/share/doc/quagga/examples \
    --enable-vtysh \
    --enable-isis-topology \
    --enable-netlink \
    --enable-snmp \
    --enable-tcp-zebra \
    --enable-irdp \
    --enable-pcreposix \
    --enable-multipath=64 \
    --enable-user=quagga \
    --enable-group=quagga \
    --enable-configfile-mask=0640 \
    --enable-logfile-mask=0640
  make
}

package() {
  # upstream install
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # logrotate stuff
  install -D -m 644 redhat/$pkgname.logrotate "$pkgdir/etc/logrotate.d/$pkgname"
  sed -ri 's,/var/run/quagga,/run/quagga,g' "$pkgdir/etc/logrotate.d/$pkgname"

  # systemd
  cd "$srcdir"
  install -d -m 755 "$pkgdir"/usr/lib/{systemd/system,tmpfiles.d,sysusers.d}
  for _d in zebra ripd ripngd bgpd ospfd ospf6d isisd pimd; do
    install -D -m 644 $_d.service "$pkgdir/usr/lib/systemd/system/$_d.service"
  done
  install -D -m 644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -D -m 644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:
