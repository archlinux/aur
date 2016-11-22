pkgname='packagekit-git'
pkgver=r4327.f537e89
pkgrel=1
pkgdesc='A system designed to make installation and updates of packages easier'
arch=('i686' 'x86_64')
url='http://www.packagekit.org/'
license=('GPL')
depends=('dbus-glib' 'pacman>=5.0.0' 'polkit' 'shared-mime-info' 'sqlite')
makedepends=('gobject-introspection' 'gtk-doc' 'intltool'
	'networkmanager' 'bash-completion' 'vala' 'autoconf-archive')
optdepends=('networkmanager: detect connection status'
	'bash-completion: command completion in bash')
backup=('var/lib/PackageKit/transactions.db'
	'etc/PackageKit/alpm.d/pacman.conf'
	'etc/PackageKit/alpm.d/repos.list')
source=("git+https://github.com/hughsie/PackageKit.git")
replaces=(packagekit)
md5sums=('SKIP')

build() {
	cd "${srcdir}/PackageKit"

	./autogen.sh --prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--libexecdir=/usr/lib/PackageKit \
		--with-dbus-sys=/usr/share/dbus-1/system.d \
		--disable-static \
		--disable-gtk-doc \
		--disable-local \
		--disable-browser-plugin \
		--disable-gstreamer-plugin \
		--disable-gtk-module \
		--disable-command-not-found \
		--disable-cron \
		--disable-dummy \
		--enable-alpm
	make
}

package() {
	cd "${srcdir}/PackageKit"

	# install directory with root owner, polkit group and
	# correct permission
	install -d -o root -g 102 -m 750 "${pkgdir}/usr/share/polkit-1/rules.d"

	make DESTDIR="${pkgdir}" install
}
