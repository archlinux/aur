# Maintainer: willemw <willemw@gmail.com>

# (
# Contributor: Sven Schulz <omee@archlinux.de>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# ------------------------------------------------------
# Sun, 28 Dec 2008 13:33:11 +0000
# moved to unsupported from extra repo
# ------------------------------------------------------
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# )

pkgname=ssldump
pkgver=0.9b3
pkgrel=12
pkgdesc="SSLv3/TLS network protocol analyzer (from 2002)"
url="http://www.rtfm.com/ssldump/"
license=('custom')
arch=('i686' 'x86_64')
depends=('libpcap>=1.0.0' 'openssl')
source=(http://www.rtfm.com/$pkgname/$pkgname-$pkgver.tar.gz
        openssl-0.9.8.patch)
sha512sums=('ea81558a243950ab43354c9f33c0a4feae0ae859bc2bd6e6b58838a01f4a1e7a6447f2a9ab1fa40bbe8dbd6c3630c489c17fc9c066cacfddfb64269b0cd5090a'
            '21be9134e64d57434e13f4ccf072f1a52f874ce326051fa00f243ad7de8ceec4f0b3d6291cf06749c367c2120ae4c131f940cb994d05232245af0ce040102428')

prepare() {
  cd $pkgname-$pkgver
  patch -Np0 -i ../openssl-0.9.8.patch
  sed -i 's/libpcap.a/libpcap.so/g' configure
  sed -i 's/BINDIR=@sbindir@/BINDIR=@bindir@/' Makefile.in
}

build() {
  cd $pkgname-$pkgver
  # Arch64 fixes --build/host
  ./configure --prefix=/usr \
              --mandir='${prefix}/share/man' \
              --build=i686-pc-linux-gnu \
              --host=i686-pc-linux-gnu
  make
}

package() {
  cd $pkgname-$pkgver
  make prefix=$pkgdir/usr install
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
