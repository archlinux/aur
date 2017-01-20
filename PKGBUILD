# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: kastor <kastor@fobos.org.ar>

pkgname=ushare
pkgver=1.1a
pkgrel=20
pkgdesc="A free UPnP A/V Media Server for Linux"
url="http://ushare.geexbox.org"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libupnp' 'libdlna' 'sudo' 'ffmpeg-compat')
backup=('etc/ushare/ushare.conf'
	'etc/conf.d/ushare')
install=ushare.install
source=("http://ushare.geexbox.org/releases/${pkgname}-${pkgver}.tar.bz2"
	"upnp-build-fix.patch"
	"ushare-config.patch"
	"segfault.patch"
	"ushare.service")
md5sums=('5bbcdbf1ff85a9710fa3d4e82ccaa251'
         '32c29f9f673e8b3a3d9e7bf5e60febbc'
         '5243475c0cebc5db49296b2f3691085b'
         '0b0fbf5d103f0ebb72716cbad0b28ffa'
         'db6187257b4623ef155b5575526d5d87')

prepare() {
  cd "$srcdir"/${pkgname}-${pkgver}
  sed -i \
    -e "s%^INSTALL=\"/usr/bin/install -c\"$%INSTALL=\"$(which install) -c\"%" \
    -e "s%-ldlna%-ldlna -L/usr/lib/ffmpeg-compat -lavformat%" \
    configure
  patch -p1 <"$srcdir"/upnp-build-fix.patch
  patch -p1 <"$srcdir"/ushare-config.patch
  patch -p1 <"$srcdir"/segfault.patch
}

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc/ushare \
    --enable-dlna
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/etc/${pkgname}/init.d
  install -dm0755 "$pkgdir"/etc/conf.d/
  cat >"$pkgdir"/etc/conf.d/ushare <<EOF
#PARAMS="-c /tmp -i eth0"
PARAMS=
USHARE_USER=ushare
EOF
  install -Dm0644 src/ushare.1 "$pkgdir"/usr/share/man/man1/ushare.1
  install -Dm0644 "$srcdir"/ushare.service "$pkgdir"/usr/lib/systemd/system/ushare.service
}
