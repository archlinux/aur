# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Kyle Laker <kyle@laker.email>
pkgname=warpinator-git
pkgver=1.1.0.r0.g399384d
pkgrel=1
pkgdesc="Share files across the LAN"
arch=('x86_64')
url="https://github.com/linuxmint/warpinator"
license=('GPL3')
depends=('gtk3' 'python-cryptography' 'python-gobject' 'python-grpcio'
         'python-protobuf' 'python-pynacl' 'python-setproctitle' 'python-zeroconf'
         'python-xapp' 'xapps' 'python-packaging')
makedepends=('git' 'meson' 'python-grpcio-tools' 'gobject-introspection' 'polkit')
optdepends=('ufw: Configure firewall rules')
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
	sed -i 's/libexec/lib/g' "bin/${pkgname%-git}.in" \
		install-scripts/meson_generate_and_install_protobuf_files.py
}

build() {
	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
