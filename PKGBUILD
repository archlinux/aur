# Maintainer:ston<2424284164@qq.com>
pkgname=gtk-qq-git
pkgver=0.2.0.r137.g0be2283
pkgrel=2
pkgdesc="Unofficial Linux QQ client, based on GTK4."
arch=('x86_64')
url="https://github.com/lomirus/gtk-qq"
license=('AGPL3')
depends=('openssl' 'gtk4' 'libadwaita')
makedepends=('meson' 'rustup' 'git')
source=(
	git+${url}
	'gtk-qq.desktop'
	'gtk-qq.png'
)

sha512sums=('SKIP'
	'225eb051345e82fe72dac315c87a3ef7f141ff82cd5587271acca399a6aa776c0be2eb28ad662895f760903ade57a7ba6067d0f218f28188ba6f6651eec1f29f'
	'199c279b2ae77b1bc5ad0173f52c964715f3f24eb4efcee0ec59fa270dbeaa7daf65a096c745b42d36e704093a0fb4cb5fc57dac89d556d4269fe7cfac1c0015')

pkgver() {
	# generate pkgver
	cd gtk-qq
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd gtk-qq
	#force to use nightly
	rustup install nightly
	rustup override set nightly
	# setup
	meson setup builddir
	meson compile -C builddir
	cargo build --release
}

check() {
	# build check
	cd gtk-qq
	meson test -C builddir
}

package() {
	install -d /usr/bin/
	install -d /usr/share/icons/hicolor/256x256/apps
	install -d /usr/share/applications/
	# binary
	install -Dm755 ${srcdir}/gtk-qq/target/release/gtk-qq ${pkgdir}/usr/bin/gtk-qq
	# icon
	install -Dm644 ${srcdir}/gtk-qq.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/gtk-qq.png
	# desktop
	install -Dm644 ${srcdir}/gtk-qq.desktop ${pkgdir}/usr/share/applications/gtk-qq.desktop

}
