# $Id$

pkgname=xscreensaver-xmatrix-color
pkgver=5.32
pkgrel=1
pkgdesc="Screen saver and locker for the X Window System, modified xmatrix with variable color."
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libglade' 'libxmu' 'glu' 'xorg-appres' 'perl-libwww')
makedepends=('bc' 'intltool' 'libxpm')
optdepends=('gdm: for login manager support')
conflicts=('xscreensaver')
provides=('xscreensaver')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${pkgname%%-*}-${pkgver}.tar.gz
        xscreensaver-add-electricsheep.diff
	xmatrix-color.diff
	LICENSE)
sha1sums=('3131d45295b9a18a2901737c9b95f1c5434f53a6'
          'e8dc57b6471fb3867ee099304ac6bf628351cb98'
          '0c53c0bdec2c9ed00eaf1d11995a25c9cebfd2dd'
          'bf8995d86609cdab678ca277ae685407f82691db')

prepare() {
  cd ${pkgname%%-*}-${pkgver}
  patch -p0 -i "${srcdir}/xscreensaver-add-electricsheep.diff"
  patch -b -p0 -i "${srcdir}/xmatrix-color.diff"
}

build() {
  cd ${pkgname%%-*}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults \
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
  echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-properties.desktop"
}
