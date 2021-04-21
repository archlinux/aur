# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Kyle Laker <kyle@laker.email>
pkgname=warpinator-git
pkgver=1.1.2.r7.g0331df4
pkgrel=1
pkgdesc="Share files across the LAN"
arch=('x86_64')
url="https://github.com/linuxmint/warpinator"
license=('GPL3')
depends=('gtk3' 'python-cryptography' 'python-gobject' 'python-grpcio'
         'python-netifaces' 'python-protobuf' 'python-pynacl' 'python-setproctitle'
         'python-zeroconf' 'python-xapp' 'xapps')
makedepends=('git' 'meson' 'gobject-introspection')
optdepends=('polkit: Open a firewall port'
            'ufw: Configure firewall rules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/linuxmint/warpinator.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Fix hard-coded libexec dir
	sed -i 's/libexec/lib/g' "bin/${pkgname%-git}.in" "data/org.x.${pkgname%-git}.policy.in.in"
	sed -i 's/libexecdir="@libexecdir@"/libexecdir="@libdir@"/g' src/config.py.in
}

build() {
	arch-meson  "${pkgname%-git}" build -Dbundle-zeroconf=false
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
