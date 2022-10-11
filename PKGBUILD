# $Id$

pkgname=xscreensaver-xmatrix-color
pkgver=6.05.1
jwzspecialver=6.05 # Because the 6.05.1 zip unpacks to 6.05
pkgrel=1
pkgdesc="Screen saver and locker for the X Window System, modified xmatrix with variable color."
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libglade' 'libxmu' 'glu' 'xorg-appres' 'perl-libwww' 'gdk-pixbuf-xlib')
makedepends=('bc' 'intltool' 'libxpm')
optdepends=('gdm: for login manager support')
conflicts=('xscreensaver')
provides=('xscreensaver')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${pkgname%%-*}-${pkgver}.tar.gz
	xscreensaver-add-electricsheep.diff
	xmatrix-color.diff
	LICENSE)
sha1sums=('1eb3ba5bd21494a8e64d5098702936c3c75499e2'
          'e8dc57b6471fb3867ee099304ac6bf628351cb98'
          '4d1d5bbec588273ee94484feea84d5003cf52d7d'
          'bf8995d86609cdab678ca277ae685407f82691db')

prepare() {
  #cd ${pkgname%%-*}-${pkgver}
  cd ${pkgname%%-*}-${jwzspecialver}
  patch -p0 -i "${srcdir}/xscreensaver-add-electricsheep.diff"
  patch -b -p0 -i "${srcdir}/xmatrix-color.diff"
}

build() {
  #cd ${pkgname%%-*}-${pkgver}
  cd ${pkgname%%-*}-${jwzspecialver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib \
    --with-pam --with-login-manager --with-gtk --with-gl \
    --without-gle --with-pixbuf --with-jpeg
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
}
