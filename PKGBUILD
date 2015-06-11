# Maintainer: Rich Li <rich at dranek com>
# Contributor: Florian "Bluewind" Pritz <flo@xssn.at>
# Note that all of the patches and systemd stuff is courtesy of Fedora's packaging, extracted from spamass-milter-0.3.2-9.fc18.src.rpm
# I updated a few of the Fedora files to reflect the slightly different directory structure for Arch
pkgname=spamass-milter
pkgver=0.3.2
pkgrel=1
pkgdesc="Sendmail Milter that pipes incoming mail through SpamAssassin"
arch=(i686 x86_64)
url="http://savannah.nongnu.org/projects/spamass-milt/"
license=('GPL')
depends=(gcc-libs spamassassin)
makedepends=(libmilter)
optdepends=("postfix")
backup=(etc/spamass-milter etc/spamass-milter-postfix)
install="spamass-milter.install"
source=("http://savannah.nongnu.org/download/spamass-milt/$pkgname-$pkgver.tar.bz2"
        README.Postfix
        spamass-milter-0.3.2-syntax.patch
        spamass-milter-0.3.1-authuser.patch
        spamass-milter-0.3.2-rcvd.patch
        spamass-milter-0.3.2-bits.patch
        spamass-milter-0.3.1-group.patch
        spamass-milter-0.3.1-ipv6.patch
        spamass-milter-0.3.2-auth-no-ssf.patch
        spamass-milter-0.3.1-pathnames.patch
        spamass-milter-0.3.2-rundir.patch
        spamass-milter.service
        spamass-milter-root.service
        spamass-milter-sysconfig.systemd
        spamass-milter-postfix-sysconfig.systemd
        spamass-milter-tmpfs.conf
        spamass-milter-postfix-tmpfs.conf
        )
md5sums=(
      '740b4bcb93eca2bbc3863d0042b26533'
      '3078db471451e6adac707a73ade23e87'
      'cfb0dee6bbb313a6e8543c34b1393508'
      '169ba77357bd335dc93df9e628d81a03'
      '8473057996babb7604b055af877f45fe'
      '4ee23ad135c4047394eaf2e67a030639'
      '97f25427d538b0f6c8272ec99e46047a'
      '0742164b9a9e8a2982e48f49aa334df7'
      'cd5e7ccd449a504ca6cc818d3be486a8'
      '30d62411628d38a9fa5305b163b0335a'
      '9b36f5a673707ea4d58091e2ce90a928'
      'fab87c1281e39813c42c89fb4175fba0'
      'eaf68d706b935d65fc2085ba8daa2a2e'
      '3f2e2c728cc30199154a3884025a597a'
      '61ac8b0d834fb462446d645047cdbb7b'
      'c3712b881f68bbc9e78e7f9b4ba5253d'
      '590981f73d554b670821c28ed3521a0f'
      )


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # These are all Fedora patches
  cp "$srcdir/README.Postfix" .
  # Fix compiler warnings
  patch -p1 < "$srcdir/spamass-milter-0.3.2-syntax.patch"
  # Add -I option to ignore (don't check) mail from authenticated users
  # (#437506, #496767) http://savannah.nongnu.org/bugs/?21046
  patch -p1 < "$srcdir/spamass-milter-0.3.1-authuser.patch"
  # Fix received-header generation
  patch -p1 < "$srcdir/spamass-milter-0.3.2-rcvd.patch"
  # Add authentication info to dummy Received-header
  patch -p1 < "$srcdir/spamass-milter-0.3.2-bits.patch"
  # Add -g option for group-writable socket for Postfix support
  patch -p1 < "$srcdir/spamass-milter-0.3.1-group.patch"
  # Add ipv6 whitelisting support
  patch -p1 < "$srcdir/spamass-milter-0.3.1-ipv6.patch"
  # Help for users authenticating to postfix
  patch -p1 < "$srcdir/spamass-milter-0.3.2-auth-no-ssf.patch"
  # Two documentation updates
  patch -p1 < "$srcdir/spamass-milter-0.3.1-pathnames.patch"
  patch -p1 < "$srcdir/spamass-milter-0.3.2-rundir.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Prep for socket used for postfix?
  #install -m 711 -d "$pkgdir/run/spamass-milter"
  #install -m 750 -d "$pkgdir/run/spamass-milter/postfix"

  # Home dir
  install -m 755 -d "$pkgdir/var/lib/spamass-milter"

  # Systemd units
  install -m 644 -D "$srcdir/spamass-milter.service" "$pkgdir/usr/lib/systemd/system/spamass-milter.service"
  install -m 644 -D "$srcdir/spamass-milter-root.service" "$pkgdir/usr/lib/systemd/system/spamass-milter-root.service"

  # Config (for systemd)
  install -m 644 -D "$srcdir/spamass-milter-sysconfig.systemd" "$pkgdir/etc/spamass-milter"
  install -m 644 -D "$srcdir/spamass-milter-postfix-sysconfig.systemd" "$pkgdir/etc/spamass-milter-postfix"

  # tmpfiles
  install -m 755 -d "$pkgdir/usr/lib/tmpfiles.d"
  install -m 644 "$srcdir/spamass-milter-tmpfs.conf" "$pkgdir/usr/lib/tmpfiles.d/spamass-milter.conf"
  install -m 644 "$srcdir/spamass-milter-postfix-tmpfs.conf" "$pkgdir/usr/lib/tmpfiles.d/spamass-milter-postfix.conf"
}

# vim:set ts=2 sw=2 et:

