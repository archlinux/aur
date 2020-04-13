# Maintainer: Kyle Laker <kyle@laker.email>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=warpinator-git
pkgver=0.0.1.r137.de5bd0a
pkgrel=1
pkgdesc="Share files across the LAN"
arch=('x86_64')
url="https://github.com/linuxmint/warp"
license=('GPL3')
depends=('gtk3' 'python-cryptography' 'python-gobject' 'python-grpcio'
         'python-protobuf' 'python-pynacl' 'python-setproctitle' 'python-zeroconf'
         'python-xapp' 'xapps')
makedepends=('git' 'meson' 'python-grpcio-tools' 'gobject-introspection')
optdepends=('gufw: Configure firewall rules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'lm-warp')
replaces=('lm-warp')
source=('git+https://github.com/linuxmint/warp.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/warp"
	printf "%s.r%s.%s" "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | \
		sed 's/-/./')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
