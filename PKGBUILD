# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=filemanager1-common-git
pkgver=r9.7f51612
pkgrel=2
pkgdesc='Customizable implementation of org.freedesktop.FileManager1'
arch=('x86_64')
url='https://github.com/boydaihungst/org.freedesktop.FileManager1.common'
license=('MIT')
depends=('dbus' 'glib2' 'libsystemd.so')
makedepends=('gcc' 'git' 'meson' 'ninja' 'pkgconf')
optdepends=('bash: shell interpreter for the built-in wrappers'
	'lf: `lf` wrapper support'
	'nnn: `nnn` wrapper support'
	'ranger: `ranger` wrapper support'
	'vifm: `vifm` wrapper support'
	'yazi: `yazi` wrapper support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'nautilus')
source=("${pkgname%-git}::git+$url")
b2sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$srcdir/${pkgname%-git}" build --reconfigure
	# ninja -C build
	meson compile -C build
}

package() {
	# Using `meson` instead of `ninja` here to specify destdir
	meson install -C build --destdir "$pkgdir"

	cd "$srcdir/${pkgname%-git}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
