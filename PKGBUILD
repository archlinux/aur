# $Id$

pkgname=xscreensaver-xmatrix-color
pkgver=6.12
jwzspecialver=6.12 # Because the 6.05.1 zip unpacks to 6.05
pkgrel=2
pkgdesc="Screen saver and locker for the X Window System, modified xmatrix with variable color."
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('gtk3' 'libxmu' 'glu' 'xorg-appres' 'perl-libwww' 'gdk-pixbuf-xlib')
makedepends=('bc' 'intltool' 'libxpm')
optdepends=('gdm: for login manager support')
conflicts=('xscreensaver')
provides=('xscreensaver')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${pkgname%%-*}-${pkgver}.tar.gz
	xscreensaver-add-electricsheep.diff
	xmatrix-color.diff
	LICENSE)
sha1sums=('ab363c2373ff3fe8436afeee344195c7ac1e7d09'
          'e8dc57b6471fb3867ee099304ac6bf628351cb98'
          '827e04ab5947fb438706df7ba7dedaabaa17c341'
          'bf8995d86609cdab678ca277ae685407f82691db')
noextract=("${pkgname%%-*}-${pkgver}.tar.gz")

prepare() {
  #cd ${pkgname%%-*}-${pkgver}
  tar xzf ../${pkgname%%-*}-${pkgver}.tar.gz
  cd ${pkgname%%-*}-${jwzspecialver}
  #patch -p0 -i "${srcdir}/xscreensaver-add-electricsheep.diff"
  patch --verbose --fuzz 3 -b -p0 -i "${srcdir}/xmatrix-color.diff"
}

build() {
  #cd ${pkgname%%-*}-${pkgver}
  cd ${pkgname%%-*}-${jwzspecialver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --without-setuid-hacks \
    --with-pam --with-login-manager --with-gtk --with-gl \
    --without-gle --with-pixbuf --with-jpeg --with-systemd --enable-pam-check-account-type
  make
}

package() {
  #cd ${pkgname%%-*}-${pkgver}
  cd ${pkgname%%-*}-${jwzspecialver}
  install -d "${pkgdir}/etc/pam.d"
  make install_prefix="${pkgdir}" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname%%-*}/LICENSE"
  chmod 755 "${pkgdir}/usr/bin/xscreensaver"
  #echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-properties.desktop"
  echo "auth       include	system-auth" >> "${pkgdir}/etc/pam.d/xscreensaver"
}
