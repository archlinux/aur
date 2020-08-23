# Maintainer: Giacomo Vercesi <mrjackv@hotmail.it>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=ppp-debian
pkgver=2.4.7
pkgrel=1
pkgdesc='A daemon which implements the Point-to-Point Protocol for dial-up networking, with debian functional patches (ifname, host_uniq, replacedefaultroute and others)'
arch=('i686' 'x86_64' 'armv7h')
url="https://www.samba.org/ppp/"
license=('GPL' 'BSD')
provides=("ppp=$pkgver")
conflicts=('ppp')
depends=('glibc' 'libpcap>=1.0.0' 'openssl')
backup=(etc/ppp/{chap-secrets,pap-secrets,options,ip-up,ip-down,ip-down.d/00-dns.sh,ip-up.d/00-dns.sh,ipv6-up.d/00-iface-config.sh})
source=(https://download.samba.org/pub/ppp/ppp-${pkgver}.tar.gz{,.asc}
        ppp-2.4.6-makefiles.patch
        options
        ip-up
        ip-down
        ip-up.d.dns.sh
        ip-down.d.dns.sh
        ipv6-up
        ipv6-down
        ipv6-up.d.iface-config.sh
        ppp.systemd
        CVE-2015-3310.patch
        ppp-build-fix.patch::"https://github.com/paulusmack/ppp/commit/50a2997b.patch"
        ppp-openssl.patch::https://github.com/paulusmack/ppp/commit/3c7b86229f7bd2600d74db14b1fe5b3896be3875.patch
        adaptive_echos.patch::https://sources.debian.org/data/main/p/ppp/2.4.7-1+4+deb9u1/debian/patches/adaptive_echos
        cifdefroute.patch::https://sources.debian.org/data/main/p/ppp/2.4.7-1+4+deb9u1/debian/patches/cifdefroute.dif
        close_dev_ppp.patch::https://sources.debian.org/data/main/p/ppp/2.4.7-1+4+deb9u1/debian/patches/close_dev_ppp
        ipv6-accept-remote.patch::https://sources.debian.org/data/main/p/ppp/2.4.7-1+4+deb9u1/debian/patches/ipv6-accept-remote
        ppp_ifname.patch::https://github.com/paulusmack/ppp/commit/bbcdc4366bbee6c3f4e1ddda31e4eec8c1b3ccc2.patch
        strip_msdomain.patch::https://sources.debian.org/data/main/p/ppp/2.4.7-1+4+deb9u1/debian/patches/ppp-2.4.2-stripMSdomain
        https://sources.debian.org/data/main/p/ppp/2.4.7-1+4+deb9u1/debian/patches/pr-28-pppoe-custom-host-uniq-tag.patch
        radius_mtu.patch::https://sources.debian.org/data/main/p/ppp/2.4.7-1+4+deb9u1/debian/patches/radius_mtu
        LICENSE)
sha256sums=('02e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30'
            'SKIP'
            'f04f47318226c79594f45b8b75877c30710d22fe0fb1e2e17db3b4257dc4218c'
            '0933fecb9e0adaddd88ee1e049a5f3a0508e83b81dc1aa333df784e729ab4b6e'
            'ddef42b2cc5d49e81556dc9dbacf5ee3bf8dc32704f3670c2233eed42c4a4efd'
            '658630ba4c5cb583df80af6d4df81df8ae20798f63cc4b9cec8d4dad13a6a897'
            'aafb75b978aa13225444dc6b914fab324d686821be93c49e893800e647aa7648'
            '17b486fa69a71dafcbe543dc4f2b8cb9ed31e675aabc5f6c98ef94dbc1561c85'
            'bb3f44a4f2c4b8dbe7f84d77feae90a71caa9fa3c252a20c390e015d4f8ea248'
            '77292b79f99f97a01aa9a75cd7cd93da70d746d3b8cc60f35b31dfe0568544c0'
            '20780cf4bd0774bebb55ecb3bdae7667c9ae5cbe003a52a1ecb0bbc77d46260f'
            'eb8ab2e2d71c3bb9c4297cf847b6e9d52616a3fdbf2257c479cc43dff318c831'
            'f0fe7e7d9b35141c2565a09e39c4f66b475ed3fe8e2528d10faa4412f480e338'
            '94225c64e806e75d6f792649c4beb26a791c4994c2701dc6a47cfccf3d91e4bf'
            '3f199d83d2632274dbbe7345e5369891469f64642f28e4afb471747a88888b62'
            '4d6333b6fd2bbb9ec3dda8db9ab54ba91621ebcb119c1dff330c201901214267'
            '9af4f7bef2337498b7cdbda1e1d87899005be29c6e322672cb38afb3f4fd8d91'
            '841117fec02748a0e12620d7126c26877a8610e2eb7b056997420cde9034f4fd'
            'c22a0f0380825e5f8c32dc9be51c39bcb7cc56d9a5e5e8a8198ee7c92c7c2c59'
            '1384e1d9f586b7e0a5228cdebb022c45a21009d38bc6b410e3f36622ff1a6a10'
            '25b080d852b40ded4071d1573176ffb19cf5b2fa6fbb54d0ff837e0b47392197'
            'a7abb668309b74e7d96f45570632ccd87c942a5589d7462bddcfe6390c2a7d8f'
            '43f9276ed6204a9d78734510928b2881dfd573f46ca995bf53689f7a43122cc2'
            '96fd35104e3d0ec472517afecead88419913ae73ae0189476d5dad9029c2be42')
validpgpkeys=('631E179E370CD727A7F2A33A9E4295D605F66CE9') # Paul Mackerras (Signing key) <paulus@samba.org>

prepare() {
  cd "${srcdir}/ppp-${pkgver}"

  for patchfile in ${srcdir}/*.patch; do
    echo "Applying $patchfile"
    patch -p1 -i "${patchfile}"
  done

  # enable active filter
  sed -i "s:^#FILTER=y:FILTER=y:" pppd/Makefile.linux
  # enable ipv6 support
  sed -i "s:^#HAVE_INET6=y:HAVE_INET6=y:" pppd/Makefile.linux
  # Enable Microsoft proprietary Callback Control Protocol
  sed -i "s:^#CBCP=y:CBCP=y:" pppd/Makefile.linux 
}

build() {
  cd "${srcdir}/ppp-${pkgver}"

  # -D_GNU_SOURCE is needed for IPv6 to work apparently
  CFLAGS="$CPPFLAGS $CFLAGS -D_GNU_SOURCE" LDFLAGS="$LDFLAGS" ./configure --prefix=/usr
  make 
}

package() {
  cd "${srcdir}/ppp-${pkgver}"
  make INSTROOT="${pkgdir}" install 

  install -D -m644 ../options "${pkgdir}/etc/ppp/options"
  install -D -m755 ../ip-up   "${pkgdir}/etc/ppp/ip-up"
  install -D -m755 ../ip-down "${pkgdir}/etc/ppp/ip-down"
  install -d -m755 "${pkgdir}/etc/ppp/ip-up.d"
  install -d -m755 "${pkgdir}/etc/ppp/ip-down.d"
  install -m755 ../ip-up.d.dns.sh   "${pkgdir}/etc/ppp/ip-up.d/00-dns.sh"
  install -m755 ../ip-down.d.dns.sh "${pkgdir}/etc/ppp/ip-down.d/00-dns.sh"
  install -D -m755 ../ipv6-up   "${pkgdir}/etc/ppp/ipv6-up"
  install -D -m755 ../ipv6-down "${pkgdir}/etc/ppp/ipv6-down"
  install -d -m755 "${pkgdir}/etc/ppp/ipv6-up.d"
  install -d -m755 "${pkgdir}/etc/ppp/ipv6-down.d"
  install -m755 ../ipv6-up.d.iface-config.sh "${pkgdir}/etc/ppp/ipv6-up.d/00-iface-config.sh"

  install -D -m755 scripts/pon  "${pkgdir}/usr/bin/pon"
  install -D -m755 scripts/poff "${pkgdir}/usr/bin/poff"
  install -D -m755 scripts/plog "${pkgdir}/usr/bin/plog"
  install -D -m644 scripts/pon.1 "${pkgdir}/usr/share/man/man1/pon.1"
  install -D -m600 etc.ppp/pap-secrets  "${pkgdir}/etc/ppp/pap-secrets"
  install -D -m600 etc.ppp/chap-secrets "${pkgdir}/etc/ppp/chap-secrets"
  install -d -m755 "${pkgdir}/etc/ppp/peers" 
  chmod 0755 "${pkgdir}/usr/lib/pppd/${pkgver}"/*.so

  install -D -m644 "${srcdir}"/ppp.systemd "${pkgdir}"/usr/lib/systemd/system/ppp@.service

  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
