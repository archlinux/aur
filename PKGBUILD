# Maintainer: Kyle Laker <kyle@laker.email>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=warpinator-git
pkgver=r119.bc21860
pkgrel=1
pkgdesc="Share files across the LAN"
arch=('x86_64')
url="https://github.com/linuxmint/warp"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-grpcio' 'python-protobuf' 'python-setproctitle'
         'python-zeroconf' 'python-xapp' 'xapps')
makedepends=('git' 'meson' 'python-grpcio-tools' 'gobject-introspection')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'lm-warp')
replaces=('lm-warp')
source=('git+https://github.com/linuxmint/warp.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/warp"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/warp"

	# Fix hard-coded libexec dir
	sed -i 's/libexec/lib/g' \
		bin/warp install-scripts/meson_generate_and_install_protobuf_files.py
}

build() {
	arch-meson warp build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install

	# Binary name conflicts with haskell-wai-app-static
	mv "$pkgdir/usr/bin/warp" "$pkgdir/usr/bin/${pkgname%-git}"

	sed -i 's/Exec=warp/Exec=warpinator/g' \
		"$pkgdir/etc/xdg/autostart/warp-autostart.desktop" \
		"$pkgdir/usr/share/applications/warp.desktop"
}
