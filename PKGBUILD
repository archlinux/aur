# Maintainer: Rich Li <rich at dranek com>
# Contributor: Florian "Bluewind" Pritz <flo@xssn.at>
# Note that all of the patches and systemd stuff is courtesy of Fedora's packaging, extracted from spamass-milter-0.4.0-2.fc23.src.rpm
# I updated a few of the Fedora files to reflect the slightly different directory structure for Arch
pkgname=spamass-milter
pkgver=0.4.0
pkgrel=1
pkgdesc="Sendmail Milter that pipes incoming mail through SpamAssassin"
arch=(i686 x86_64)
url="https://savannah.nongnu.org/projects/spamass-milt/"
license=('GPL')
depends=(gcc-libs spamassassin)
makedepends=(libmilter)
optdepends=("postfix")
backup=(etc/spamass-milter etc/spamass-milter-postfix)
install="spamass-milter.install"
# validpgpkeys=('CC99713BDD298DAB')  # I can't find anywhere to download the public key
source=("https://download.savannah.nongnu.org/releases/spamass-milt/$pkgname-$pkgver.tar.gz"
        # "https://download.savannah.nongnu.org/releases/spamass-milt/$pkgname-$pkgver.tar.gz.sig"
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
sha256sums=('782f1bb3b08a0447cd51ad4b64e7506926739fa9cce537f3cc62aa9b24d46b07'
            '70ab3423187713c42dd75758bcd89f20456faf54eeeeed1336b0dde94a969b9e'
            'fc173c860c2d1d21e13aad7691979c2451ed03e99309534119dac9c61dff000f'
            'c2a4a7282dcc9d797f5de28eecadd7e20b052d8004c03ce7907621777238f6f4'
            '4443eafcca5d9528f3eef213b26f2718d00151b92cad8561fb0ca1918f8425c1'
            '99c31b2941466ad5054c3e3aa46443bcf770ee4096aea5d13a7f256ddd8bf456'
            '585fac4f0be8cf7b409884763d16d192efb092bfc2a8169df3f6587014a8611c'
            'fc020c5705cfd7679a728860037c4bbeeb8e91bfbcaeb0468ea2bce6dd7c74c5'
            'e19e2699b36ecec163017f8122c57b0c33b689032fa376ccbd28b350743c3a38'
            '999519d2196481edcf15027d71d74575ebf0e29b3b1ae83958ff1cdc7bff364b'
            '43a9c6558ad3346d7f8cbfc69e17beed4fd6e91f509a8b0a350f56ef9093c6a6'
            '2ff6d682d760b1806e879e44d4e9074c1a08997ccbb99e3f0ff8b14171ca4fbe'
            'da8c9090ac393b3c50ec3545a888dc96ac4ef1252171236b0c7548f6099dbab8'
            '933086b78b8ade41aefac5d9cb743f4253b5b6b17ec4b4c6da0e1f71b2968550'
            'e80c0ba1f40514b77610f3e5b08839ffd57b7c82b1f5196a3bee919927e5f119')

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

