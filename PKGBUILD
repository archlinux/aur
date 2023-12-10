# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: j.r <j.r@jugendhacker.de>
# Contributor: Matthew Murray <matt@mattmurr.xyz>
pkgname=fprintd-clients-git
pkgver=1.90.1.r2.g54e56d6
pkgrel=5
pkgdesc='Fprintd without the daemon (debian/clients-only git branch)'
arch=(x86_64)
license=('GPL')
depends=(glib2
	       glibc
			 	 libfprint
				 polkit
				 dbus
				 dbus-glib
				 libsystemd
				 pam)
makedepends=(git
						 meson
						 pam_wrapper
						 python-cairo
						 python-dbus
						 python-dbusmock)
conflicts=(fprintd
	         fprintd-clients)
provides=(fprintd-clients)
url="https://gitlab.freedesktop.org/uunicorn/fprintd"
source=("${pkgname}::git+${url}.git#branch=debian/clients-only"
		    '0001-disable-systemd-reactivated.diff'
	      '0002-Remove-ignored-positional-arguments.patch')
sha256sums=('SKIP'
            '05e537a783302f0b01984eee00368deb2bc846bfd16b8892a21aff79c9b7a6ab'
            '83458c77fd9b1c3022ed7230b92432a3edde00cc811a01e49b76c04629534b82')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	git checkout 54e56d660bf9730f8abc8f2c6a358ef2fec675f2
	patch -Np1 -i "$srcdir/0001-disable-systemd-reactivated.diff"
	patch -Np1 -i "$srcdir/0002-Remove-ignored-positional-arguments.patch"
}

build() {
	arch-meson "$pkgname" build \
		-D pam_modules_dir=/usr/lib/security
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -d -m 700 "${pkgdir}/var/lib/fprint"
}
