# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=wdm-git
_pkgname=wdm
pkgver=1.28.r39.g6d47e25
pkgrel=1
pkgdesc="A replacement X window display manager similar to, and based on XDM"
arch=(i686 x86_64)
url="https://github.com/raorn/wdm"
license=('GPL')
depends=('windowmaker-git' 'libdbus')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$pkgname::git+https://github.com/raorn/wdm.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed -r 's/wdm-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --localedir=/usr/share/locale \
	--sysconfdir=/etc/wdm --with-wdmdir=/etc/wdm --mandir=/usr/share/man \
	--with-fakehome=/var/empty \
	--enable-aafont --enable-exitlogin
  rm -f po/stamp-po
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm755 bin/TestLogin "$pkgdir/usr/bin/wdmTestLogin"
  install -Dm755 bin/wdmChooser "$pkgdir/usr/bin/wdmChooser"
  install -Dm755 bin/wdmPrefs "$pkgdir/usr/bin/wdmPrefs"
  # used /etc/pam.d/xscreensaver as an example
  #
  install -d "$pkgdir/etc/pam.d"
  echo "auth	required	pam_unix_auth.so" > "$pkgdir/etc/pam.d/wdm"
  chmod 0644 "$pkgdir/etc/wdm/wdm-config"
  install -d "$pkgdir/etc/wdm/authdir"
  install -d "$pkgdir/var/empty"
}
