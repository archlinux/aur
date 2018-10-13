# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Aljosha Papsch <papsch.al@gmail.com>
# Contributor: Benjamin Wild <benwild@gmx.de>

pkgname=network-manager-applet-gtk2-jlindgren90-git
_pkgname=network-manager-applet
pkgver=1.8.2.r4117.20180819
pkgrel=2
pkgdesc="GNOME frontends to NetWorkmanager for gtk2 ported by jlindgren90"
arch=(i686 x86_64)
license=(GPL)
url="https://github.com/jlindgren90/network-manager-applet-gtk2"
depends=(networkmanager
#	libnm-glib
	libsecret
	dconf
	gtk2
	libnotify
        gnome-icon-theme
#	mobile-broadband-provider-info
	iso-codes)
makedepends=(intltool
	gtk-doc
#	gobject-introspection
#	modemmanager
)
options=('!emptydirs')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname $_pkgname-gtk2 nm-connection-editor libnm-gtk libnma)
install=network-manager-applet.install
source=(
	$pkgname::git+https://github.com/jlindgren90/network-manager-applet-gtk2.git
	network-manager-applet.install
)
sha256sums=('SKIP'
            '985b97bf97d8fe61eadfbfa28b2386e5db4d621bb699c33296fb1ca5cc3624f0')

pkgver() {
	# remove ".r*.*" from package version
	_pkgverTriple=$(echo $pkgver | sed "s/\.r.*//g")
	cd $pkgname
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add ".r*.*" from package version
	echo "$_pkgverTriple.r$_commitCount.$_commitTime"
}
build() {
	cd $pkgname
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/networkmanager \
      --disable-static \
      --disable-more-warnings \
      --disable-maintainer-mode \
      --disable-migration \
      --disable-modem-manager-1 \
      --with-gtkver=2

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  #sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make V=0
}

package() {
	cd $pkgname
	make DESTDIR="${pkgdir}" install
}
