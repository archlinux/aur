pkgname='packagekit-git'
pkgver=r4327.f537e89
pkgrel=1
pkgdesc='A system designed to make installation and updates of packages easier'
arch=('i686' 'x86_64')
url='http://www.packagekit.org/'
license=('GPL')
depends=('dbus-glib' 'pacman>=5.0.0' 'polkit' 'shared-mime-info' 'sqlite')
makedepends=('gobject-introspection' 'gtk-doc' 'intltool'
	'networkmanager' 'bash-completion' 'vala' 'meson')
optdepends=('networkmanager: detect connection status'
	'bash-completion: command completion in bash')
backup=('var/lib/PackageKit/transactions.db'
	'etc/PackageKit/alpm.d/pacman.conf'
	'etc/PackageKit/alpm.d/repos.list')
source=("git+https://github.com/hughsie/PackageKit.git")
replaces=(packagekit)
md5sums=('SKIP')

build() {
	cd "${srcdir}"

	arch-meson PackageKit --prefix=/usr \
		-Ddbus-sys=/usr/share/dbus-1/system.d \
		-Dgtk-doc=false \
		-Dlocal_checkout=false \
		-Dbrowser-plugin=false \
		-Dgstreamer-plugin=false \
		-Dgtk-module=false \
		-Dbash_command_not_found=false \
		-Dcron=false \
		-Ddaemon_tests=false \
		-Dpackaging_backend=alpm
	ninja
}

package() {
	cd "${srcdir}"

	# install directory with root owner, polkit group and
	# correct permission
	install -d -o root -g 102 -m 750 "${pkgdir}/usr/share/polkit-1/rules.d"


	DESTDIR="$pkgdir" meson install
}
