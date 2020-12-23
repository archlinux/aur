# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=(libcups-nosystemd-minimal-git)
pkgver=2.3.3op1
pkgrel=1
epoch=1
arch=('x86_64')
license=('Apache' 'custom')
#url="https://www.cups.org/"
url="https://github.com/OpenPrinting/cups"
makedepends=('libtiff' 'libpng' 'krb5' 'gnutls' 'autoconf' 'git' 'libxcrypt')
source=(git://github.com/apple/cups.git)
sha256sums=('SKIP')

pkgver() {
	  cd cups
	  git describe --tags | sed 's/-/+/g'
}

build() {
  cd cups

  # The build system uses only DSOFLAGS but not LDFLAGS to build some libraries.
#  export DSOFLAGS=${LDFLAGS}

  # use fixed cups user (id 209) since systemd adds "lp" group without a fixed id
  ./configure --prefix=/usr \
     --sysconfdir=/etc \
     --localstatedir=/var \
     --sbindir=/usr/bin \
     --libdir=/usr/lib \
     --with-logdir=/var/log/cups \
     --with-docdir=/usr/share/cups/doc \
     --with-exe-file-perm=0755 \
     --with-cups-user=209 \
     --with-cups-group=209 \
     --enable-pam=yes \
     --disable-raw-printing \
     --enable-dbus=no \
     --with-dbusdir=/usr/share/dbus-1 \
     --enable-ssl=yes \
     --enable-threads \
     --disable-avahi \
     --disable-systemd \
     --without-systemd \
     --disable-debug \
     --disable-debug-guards \
     --disable-debug-printfs \
     --disable-webif \
     --disable-browsing \
     --disable-page-logging \
     --disable-upstart \
     --disable-launchd \
     --disable-dnssd \
     --disable-mallinfo \
     --without-snmp-address \
     --disable-libusb \
     --disable-libpaper \
     --with-optim="$CFLAGS" 
       
# you must comment out $CFLAGS and $CXXFLAGS in makepkg.conf and add your build flags into the "--with-optim" setting

  make
}

#check() {
#  cd "${pkgbase}"-${pkgver}
#  make -k check || /bin/true
#  make check
#}

package_libcups-nosystemd-minimal-git() {
pkgdesc="The CUPS Printing System - client libraries and headers"
depends=('gnutls' 'libtiff>=4.0.0' 'libpng>=1.5.7' 'krb5' 'libusb' 'libxcrypt')
provides=(libcups)
conflicts=(libcups)

  cd cups
  make BUILDROOT="${pkgdir}" install-headers install-libs
  # put this into the libs pkg to make other software find the libs(no pkg-config file included)
  mkdir -p "${pkgdir}"/usr/bin
#  install -m755 "${srcdir}"/"${pkgbase}"-${pkgver}/cups-config "${pkgdir}"/usr/bin/cups-config
#  install -m755 "${srcdir}"/"${pkgbase}"/cups-config "${pkgdir}"/usr/bin/cups-config

  # add license + exception
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" {LICENSE,NOTICE}
}
