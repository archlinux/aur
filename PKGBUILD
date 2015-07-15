# Maintainer: Johnny Halfmoon jhalfmoon AT milksnot DOT com
# Contributor: Yejun Yang  yejunx AT gmail DOT com
#
# Note1: The PKGBUILD and install files are based upon those created by Yejun. The rest
#        is based upon the djbdns package I created for OpenWRT.
# Note2: This package contains all major bugfixes currently available. Also, all
#        available, non-critical fixes have been applied, along with some nice-to-haves.
#        One notable ommission: No IPv6 transport support. My advice: Better use something
#        else than djbdnsif you really need ipv6 transport support.
# Note3: Unlike the original package created by Yejun, this package also installs some
#        very useful DNS utilities, which are included in the djbdns package.
#
# rel 1: 20110309 - ported all useful djbdns patches and fixes available to this Arch Linux package
# rel 2: 20110314 - fixed a small typo in the .install file comments
# rel 3: 20141114 - instructions for dump directory were missing in post-install, which is required to store and restore the dnscache between restarts

pkgname=djbdns-ipv4
pkgver=1.05
pkgrel=3
pkgdesc="The DNS suite by DJ Bernstein, including dnscache, tinydns, axfrdns and dnstools."
arch=('i686' 'x86_64')
url="http://cr.yp.to/djbdns.html"
license=('Public domain')
depends=('daemontools' 'ucspi-tcp')
makedepends=('wget' 'gawk')
install=djbdns-ipv4.install
source=("http://cr.yp.to/djbdns/djbdns-$pkgver.tar.gz"
        "http://milksnot.com/stuff/archlinux/$pkgname-$pkgver-1-files.tar.bz2" )

#generate with 'makepkg -g'
md5sums=('3147c5cd56832aa3b41955c7a51cbeb2'
         'be9ce02f68831437707eb464d5fe6c97')

build() {
  cd "$srcdir/djbdns-$pkgver"
  # define the 'base' directory, kind of like using '--prefix'
  echo /usr > conf-home

  # apply all our patches in the order the appear
  echo "patching..."
  find "$srcdir/files/patches" | grep '.patch$' | sort -n | while read FILE ; do
    echo "=== applying patch file $FILE ==="
    patch -p1 < "$FILE"
  done
  make || return 1
}

package() {
  _EXAMPLE_DIR="usr/share/djbdns"

  # make directory structure
  mkdir -p ${pkgdir} &&
  cd ${pkgdir} && \
  mkdir -p usr/bin etc $_EXAMPLE_DIR && \
  cd ${pkgdir}/$_EXAMPLE_DIR && \
  mkdir dnscache tinydns axfrdns rbldns walldns || \
  return 1

  # install binaries
  cd "$srcdir/djbdns-$pkgver"
  for FILE in   dnscache-conf tinydns-conf walldns-conf rbldns-conf \
                pickdns-conf axfrdns-conf dnscache pickdns pickdns-data \
                tinydns tinydns-data tinydns-edit tinydns-get axfrdns \
                axfr-get rbldns rbldns-data walldns dnsfilter dnsip \
                dnsipq dnsmx dnsname dnsnamex dnsq dnsqr dnstrace \
                dnstracesort dnstxt random-ip; do
    install -m755 $FILE ${pkgdir}/usr/bin || return 1
  done

  # install this one seperately
  install -m644 dnsroots.global ${pkgdir}/etc || return 1

  # install files not included with the default djbdns tarball
  cd "$srcdir/files/support" || return 1
  install -m644 dnsroots-update dnsqrx ${pkgdir}/usr/bin && \
  install -m644 dnscache/* ${pkgdir}/$_EXAMPLE_DIR/dnscache && \
  install -m644 tinydns/* ${pkgdir}/$_EXAMPLE_DIR/tinydns && \
  install -m644 rbldns/* ${pkgdir}/$_EXAMPLE_DIR/rbldns && \
  install -m644 axfrdns/* ${pkgdir}/$_EXAMPLE_DIR/axfrdns && \
  install -m644 README ${pkgdir}/$_EXAMPLE_DIR || \
  return 1

  # gzip the manfiles and install them
  cp -r "$srcdir/files/man" "$srcdir/man.tmp" && \
  cd "$srcdir/man.tmp" && \
  gzip *.1 *.5 *.8 && \
  mkdir -p ${pkgdir}/usr/share/man/man{1,5,8} && \
  install -m644 *.1.gz ${pkgdir}/usr/share/man/man1 && \
  install -m644 *.5.gz ${pkgdir}/usr/share/man/man5 && \
  install -m644 *.8.gz ${pkgdir}/usr/share/man/man8 || \
  return 1
}


