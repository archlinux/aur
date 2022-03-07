# $Id$

pkgname=xscreensaver-xmatrix-color
pkgver=6.03
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
sha1sums=('04b272b7b4eadb68e812c682148162bd59d3b9f8'
          'e8dc57b6471fb3867ee099304ac6bf628351cb98'
          '061a488885bf0265529a04772eae63b24912c1a1'
          'bf8995d86609cdab678ca277ae685407f82691db')

prepare() {
  cd ${pkgname%%-*}-${pkgver}
  patch -p0 -i "${srcdir}/xscreensaver-add-electricsheep.diff"
  patch -b -p0 -i "${srcdir}/xmatrix-color.diff"
}

build() {
  cd ${pkgname%%-*}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib \
    --with-pam --with-login-manager --with-gtk --with-gl \
    --without-gle --with-pixbuf --with-jpeg
  make
}

package() {
  cd ${pkgname%%-*}-${pkgver}
  install -d "${pkgdir}/etc/pam.d"
  make install_prefix="${pkgdir}" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname%%-*}/LICENSE"
  chmod 755 "${pkgdir}/usr/bin/xscreensaver"
  #echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-properties.desktop"
}
