# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: eric <eric@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=wdm
pkgver=1.28
pkgrel=7
pkgdesc="An replacement X window display manager similar to, and based on XDM"
arch=(i686 x86_64)
url="http://github.com/raorn/wdm"
license=('GPL')
depends=('windowmaker' 'pam' 'bash' 'libxmu')
makedepends=('git')
source=("$pkgname::git+https://github.com/raorn/wdm.git#tag=$pkgname-$pkgver"
	"Makefile.in" "cy.po")
md5sums=('SKIP'
         'b0860fca75e1c8ce7699014b4778a3f7'
         '2e1a8d2c6bd69d1fad151d86906163bd')

prepare() {
  cd $pkgname
  cp -f "$srcdir/Makefile.in" .
  cp -f "$srcdir/cy.po" po/cy.po
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --with-nlsdir=/usr/share/locale \
	--sysconfdir=/etc/wdm --with-wdmdir=/etc/wdm --mandir=/usr/share/man \
	--with-fakehome=/var/empty
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  # used /etc/pam.d/xscreensaver as an example
  #
  echo "auth	required	pam_unix_auth.so" >"$pkgdir/etc/pam.d/wdm"
  chmod 0644 "$pkgdir/etc/wdm/wdm-config"
  chmod 0755 "$pkgdir/etc/wdm/authdir"
}
