# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Kyle Laker <kyle@laker.email>
pkgname=warpinator-git
pkgver=1.0.6.r1.gba39a28
pkgrel=1
pkgdesc="Share files across the LAN"
arch=('x86_64')
url="https://github.com/linuxmint/warp"
license=('GPL3')
depends=('gtk3' 'python-cryptography' 'python-gobject' 'python-grpcio'
         'python-protobuf' 'python-pynacl' 'python-setproctitle' 'python-zeroconf'
         'python-xapp' 'xapps')
makedepends=('git' 'meson' 'python-grpcio-tools' 'gobject-introspection' 'polkit')
optdepends=('ufw: Configure firewall rules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/linuxmint/warp.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/warp"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/warp"

	# Fix hard-coded libexec dir
	sed -i 's/libexec/lib/g' \
		"bin/${pkgname%-git}" \
		install-scripts/meson_generate_and_install_protobuf_files.py
}

build() {
	arch-meson warp build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
