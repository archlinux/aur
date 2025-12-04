# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=filemanager1-common-systemd-git
pkgver=r9.7f51612
pkgrel=1
pkgdesc='Customizable implementation of org.freedesktop.FileManager1 (systemd patch)'
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
provides=("${pkgname%-systemd-git}")
conflicts=("${pkgname%-systemd-git}")
source=("${pkgname%-git}::git+$url"
	'filemanager1-common.service')
b2sums=('SKIP'
        '9ca5e04b1033595890eace98590cb4a15b0a410617947884f78baf222f8c3240dd159216b34d068d0ef86c8d9aa54e4d6a2598e8073743e55cf1f34d9c1bd240')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$srcdir/${pkgname%-git}" build --reconfigure
	meson compile -C build
}

package() {
	# Custom systemd dbus service
	install -Dm644 filemanager1-common.service "$pkgdir/usr/lib/systemd/user/filemanager1-common.service"

	# Installing manually without ninja/meson, to avoid installing
	#   /usr/share/dbus-1/services/org.freedesktop.FileManager1.service
	install -Dm755 build/file_manager_dbus "$pkgdir/usr/lib/org.freedesktop.FileManager1.common/file_manager_dbus"
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 config/config "$pkgdir/usr/share/org.freedesktop.FileManager1.common/config"
	install -Dm644 config/lf-wrapper.sh "$pkgdir/usr/share/org.freedesktop.FileManager1.common/lf-wrapper.sh"
	install -Dm644 config/nnn-wrapper.sh "$pkgdir/usr/share/org.freedesktop.FileManager1.common/nnn-wrapper.sh"
	install -Dm644 config/ranger-wrapper.sh "$pkgdir/usr/share/org.freedesktop.FileManager1.common/ranger-wrapper.sh"
	install -Dm644 config/vifm-wrapper.sh "$pkgdir/usr/share/org.freedesktop.FileManager1.common/vifm-wrapper.sh"
	install -Dm644 config/yazi-wrapper.sh "$pkgdir/usr/share/org.freedesktop.FileManager1.common/yazi-wrapper.sh"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
