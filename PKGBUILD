# Maintainer: Eric Cheng <ericcheng@hey.com>
pkgname=gnome-shell-extension-blur-me-git
_pkgname=blur-me
pkgver=7.r53.g9d9d481
pkgrel=3
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/ckissane/blur-me"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "gnome-shell-extension-blur-my-shell")
source=('git+https://github.com/ckissane/blur-me.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	_uuid='blur-me@nunchucks'

	install -d "$pkgdir/usr/share/gnome-shell/extensions"
	cp -r build "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$pkgdir/usr/share/glib-2.0/schemas"
	ln -s "/usr/share/gnome-shell/extensions/$_uuid/schemas/org.gnome.shell.extensions.$_pkgname.gschema.xml" \
		"$pkgdir/usr/share/glib-2.0/schemas"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
