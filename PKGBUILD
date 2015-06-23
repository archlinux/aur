# $Id: PKGBUILD 90735 2013-05-13 14:41:02Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: kastor <kastor@fobos.org.ar>

# AUR package modified by sxe <sxxe@gmx.de>

pkgname=ushare-mp4
_pkgname=ushare
pkgver=1.1a
pkgrel=1
pkgdesc="A free UPnP A/V Media Server for Linux (mp4 video playback added)"
url="http://ushare.geexbox.org"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libupnp' 'libdlna' 'sudo')
backup=('etc/ushare/ushare.conf'
	'etc/conf.d/ushare')
install=ushare.install
conflicts=('ushare')
source=("http://ushare.geexbox.org/releases/${_pkgname}-${pkgver}.tar.bz2"
	"upnp-build-fix.patch"
	"ushare-config.patch"
	"segfault.patch"
        "mp4-video.patch"
	"ushare.service")
md5sums=('5bbcdbf1ff85a9710fa3d4e82ccaa251'
         '32c29f9f673e8b3a3d9e7bf5e60febbc'
         '5243475c0cebc5db49296b2f3691085b'
         '0b0fbf5d103f0ebb72716cbad0b28ffa'
         'a43cc266aa9b36ca97793472f06c13e9'
         'db6187257b4623ef155b5575526d5d87')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  sed -i -e \
    "s%^INSTALL=\"/usr/bin/install -c\"$%INSTALL=\"$(which install) -c\"%" \
    configure
  patch -p1 <$srcdir/upnp-build-fix.patch
  patch -p1 <$srcdir/ushare-config.patch
  patch -p1 <$srcdir/segfault.patch
  patch -p1 <$srcdir/mp4-video.patch
  ./configure --prefix=/usr --sysconfdir=/etc/ushare \
    --enable-dlna --with-libdlna-dir=/usr/include/libavformat
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/etc/${_pkgname}/init.d
  install -dm0755 ${pkgdir}/etc/conf.d/
  cat >${pkgdir}/etc/conf.d/ushare <<EOF
#PARAMS="-c /tmp -i eth0"
PARAMS=
USHARE_USER=ushare
EOF
  install -Dm0644 src/ushare.1 $pkgdir/usr/share/man/man1/ushare.1
  install -Dm0644 $srcdir/ushare.service $pkgdir/usr/lib/systemd/system/ushare.service
}
