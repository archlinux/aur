# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=gss-ntlmssp
pkgver=1.2.0
pkgrel=1
pkgdesc="A GSSAPI Mechanism that implements NTLMSSP"
url="https://github.com/gssapi/gss-ntlmssp"
arch=(i686 x86_64)
license=(custom:ISC)
depends=(krb5 libunistring libwbclient openssl)
makedepends=(docbook-xsl doxygen git)
_commit=3c3077e2a24b47db1b4c459fb3173ba7f75b9b44
source=("git+https://github.com/gssapi/gss-ntlmssp.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

prepare() {
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
  # Krb5 plugin config
  sed -i 's,\${exec_prefix},/usr,g' examples/mech.ntlmssp
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  # Krb5 plugin config
  install -Dm644 examples/mech.ntlmssp "$pkgdir/etc/gss/mech.d/gssntlmssp.conf"
  # License
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: ts=2:sw=2:et
