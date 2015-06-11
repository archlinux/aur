# Maintainer: Rich Li <rich at dranek com>
# Contributor: Florian "Bluewind" Pritz <flo@xssn.at>
# Note that all of the patches and systemd stuff is courtesy of Fedora's packaging, extracted from spamass-milter-0.4.0-2.fc23.src.rpm
# I updated a few of the Fedora files to reflect the slightly different directory structure for Arch
pkgname=spamass-milter
pkgver=0.4.0
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
# validpgpkeys=('CC99713BDD298DAB')  # I can't find anywhere to download the public key
source=("http://download.savannah.nongnu.org/releases/spamass-milt/$pkgname-$pkgver.tar.gz"
        # "http://download.savannah.nongnu.org/releases/spamass-milt/$pkgname-$pkgver.tar.gz.sig"
        spamass-milter.sysusers.conf
        spamass-milter.README.Postfix
        spamass-milter-0.4.0-rcvd.patch
        spamass-milter-0.4.0-bits.patch
        spamass-milter-0.4.0-group.patch
        spamass-milter-0.4.0-auth-no-ssf.patch
        spamass-milter-0.4.0-pathnames.patch
        spamass-milter-0.4.0-rundir.patch
        spamass-milter.service
        spamass-milter-root.service
        spamass-milter-sysconfig.systemd
        spamass-milter-postfix-sysconfig.systemd
        spamass-milter-tmpfs.conf
        spamass-milter-postfix-tmpfs.conf
        )
sha1sums=('2b4f7ab1b17ca881c68063a4814780b00bb736bc'
          # 'SKIP'
          'bec385a069473de1f6623f0332abc70d21a429aa'
          'b0077cb63e53c206f9074acbca7a697e2b8e73d2'
          '6fdcd4f43031f652e0d85a3fee9030b57f52af42'
          '2ef2e6e6bf8756614340046eaa9413133759f0b5'
          'b8d203774a1777edfd92099ed6ce1c752f8cab2c'
          'cfa2d9f888f50a8294bfaf671d6238f640f9f568'
          '25fd019956b0a1ea338c22217cdacb3285ac7663'
          '5639f656922752e86440a70a78ca512aa0b0019f'
          '9a2a15789011ef07c55c22811c44cc11f64db35a'
          'd98f5447395e422dae06f44eb9b1f67829a84017'
          '2109a3d6cbdef10e3e9cde61c0d4729d1240d049'
          '5e4ef39c624e020269b329cf18fd4860a0513146'
          'a0a26a8e9d89837e1ac43e3ad238cd47c3ea5605'
          '9abb5088c177726b7a4a6b5540b3bea7cb5ee708')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # These are all Fedora patches, obtained from spamass-milter-0.4.0-2.fc23.src.rpm, downloaded from
  # http://koji.fedoraproject.org/koji/packageinfo?packageID=3854
  # and 
  # http://koji.fedoraproject.org/koji/buildinfo?buildID=633948

  cp "$srcdir/spamass-milter.README.Postfix" "./README.Postfix"
  # Fix received-header generation
  patch -p0 < "$srcdir/spamass-milter-0.4.0-rcvd.patch"
  # Add authentication info to dummy Received-header
  patch -p0 < "$srcdir/spamass-milter-0.4.0-bits.patch"
  # Add -g option for group-writable socket for Postfix support
  patch -p0 < "$srcdir/spamass-milter-0.4.0-group.patch"
  # Help for users authenticating to postfix
  patch -p0 < "$srcdir/spamass-milter-0.4.0-auth-no-ssf.patch"
  # Two documentation updates
  patch -p0 < "$srcdir/spamass-milter-0.4.0-pathnames.patch"
  patch -p0 < "$srcdir/spamass-milter-0.4.0-rundir.patch"
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

  # User/group
  install -Dm644 "${srcdir}/spamass-milter.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/spamass-milter.conf"
}

# vim:set ts=2 sw=2 et:

