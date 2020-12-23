# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=lib32-libcups-minimal-git
pkgver=2.3.3
pkgrel=1
pkgdesc="The CUPS Printing System - client libraries (32-bit)"
arch=('x86_64')
license=('Apache' 'custom')
url="https://www.cups.org/"
depends=(lib32-krb5 lib32-libtiff lib32-libpng lib32-gnutls)
optdepends=('libcups: 64bit support')
provides=(lib32-libcups)
conflicts=(lib32-libcups)
source=(git://github.com/apple/cups.git)
sha256sums=('SKIP')

pkgver() {
	  cd cups
	  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd cups

  aclocal -I config-scripts
  autoconf -I config-scripts

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
     --disable-libpaper --disable-ldap --disable-raw-printing --disable-gssapi --disable-dbus \
     --disable-page-logging --disable-upstart --disable-launchd --disable-mallinfo --without-snmp-address --enable-ssl=yes --enable-threads --enable-libusb=no \
     --disable-systemd --without-systemd --disable-debug --disable-debug-guards --disable-debug-printfs --disable-webif --disable-browsing  --disable-avahi --disable-dnssd \
     --with-optim="$CFLAGS" --libdir=/usr/lib32
  make libs
}

# "-Wno-format-truncation" and "-Wno-error=sign-conversion" might be required in the "--with-optim" flag to ignore build warnings

package() {
  cd cups
  make BUILDROOT="${pkgdir}" install-libs
  rm -rf "$pkgdir/usr/lib"

# add license + exception
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" {LICENSE,NOTICE}
}

