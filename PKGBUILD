# $Id: PKGBUILD 148992 2012-02-05 12:21:23Z andyrtr $
# Contributor: Andreas Radke <andyrtr at archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=gnupg1
pkgname_=gnupg
pkgver=1.4.20
pkgrel=5
pkgdesc="GNU Privacy Guard - a PGP replacement tool"
arch=('i686' 'x86_64' 'armv6h')
license=('GPL3')
depends=('zlib' 'bzip2' 'libldap>=2.4.18' 'libusb-compat' 'curl>=7.16.2' 'readline>=6.0.00')
source=("https://gnupg.org/ftp/gcrypt/gnupg/$pkgname_-$pkgver.tar.bz2"{,.sig})
install=gnupg.install
url="http://www.gnupg.org/"
sha1sums=('cbc9d960e3d8488c32675019a79fbfbf8680387e'
          'SKIP')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'
              '46CC730865BB5C78EBABADCF04376F3EE0856959'
              '031EC2536E580D8EA286A9F22071B08A33BD3F06'
              'D238EA65D64C67ED4C3073F28A861B1C7EFD60D9')

build() {
  cd "${srcdir}/${pkgname_}-${pkgver}"
  ./configure --prefix=/usr \
	--libexecdir=/usr/lib \
	--enable-noexecstack
  make

# Further options to prevent DNS leaks when working with TOR
# https://trac.torproject.org/projects/tor/ticket/2846

# --disable-dns-cert \
# --disable-dns-pka \
# --disable-dns-srv \
# --disable-ldap \

  #ln -s ${pkgname}-${pkgver}/scripts .. # seems obsolete now
}

check() {
  cd "$srcdir/$pkgname_-$pkgver"
  make -k check #All 27 tests passed
}

package () {
  cd "${srcdir}/${pkgname_}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Fix file conflicts with gnupg2 pkg. Cd into directories to prevent
  # unintentional transformation of the full path.
  cd "$pkgdir/usr/share/man/man1"
  rename gpg gpg1 gpg*

  cd "$pkgdir/usr/bin"
  rename gpg gpg1 gpg*

#   cd "$pkgdir/usr/share/man/man7"
#   rename gnupg gnupg1 gnupg*

  # Correct multiple renames if makepkg is rerun.
  find "$pkgdir" -name '*pg11*' -exec rename pg11 pg1 '{}' \+
}
