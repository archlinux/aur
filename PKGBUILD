# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=gss-ntlmssp
_commit=aa602d0e0cd891870458c8a6d206555131b6adf5
pkgver=1.3.2
pkgrel=1
pkgdesc="A GSSAPI Mechanism that implements NTLMSSP"
url="https://github.com/gssapi/gss-ntlmssp"
arch=(i686 x86_64)
license=(custom:ISC)
depends=(krb5 libunistring libwbclient openssl)
makedepends=(docbook-xsl doxygen git)
source=("git+https://github.com/gssapi/gss-ntlmssp.git#commit=$_commit")
sha256sums=('aca6350e97e24c0bdbba10bd3afabd1587d9252d35cf74c40f8289ab22469d5b')
#validpgpkeys=('7C7BD146943B206BB645B64594EAD67E004B65AB')

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
