# Maintainer:ston<2424284164@qq.com>
pkgname=gtk-qq-git
pkgver=0.2.0.r132.g96a6e3f
pkgrel=1
pkgdesc="Unofficial Linux QQ client, based on GTK4."
arch=('x86_64')
url="https://github.com/lomirus/gtk-qq"
license=('AGPL3')
depends=('openssl' 'gtk4' 'libadwaita')
makedepends=('meson' 'rustup' 'git')
source=(
	git+${url}
)

sha512sums=('SKIP')

pkgver() {
	cd gtk-qq
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd gtk-qq
	meson setup builddir
	meson compile -C builddir
	rustup install nightly
	rustup override set nightly
	cargo build --release
}

check() {
	cd gtk-qq
	meson test -C builddir
}

package() {
	install -d /usr/bin
	install -Dm755 ${srcdir}/gtk-qq/target/release/gtk-qq ${pkgdir}/usr/bin/gtk-qq
}
