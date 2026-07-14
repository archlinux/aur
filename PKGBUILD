# Maintainer: paranoica <mitjumper@gmail.com>
pkgname=rayshot-git
_srcname=rayshot
pkgver=r1
pkgrel=1
pkgdesc="Fast screenshot and annotation tool for Linux (GNOME/Wayland)"
arch=('x86_64')
url="https://github.com/paranoica/rayshot"
license=('MIT')
depends=('pipewire' 'wl-clipboard' 'xdg-desktop-portal' 'vulkan-icd-loader')
optdepends=('xdg-desktop-portal-gnome: GNOME portal backend, daemon and hotkey support'
            'glib2: gsettings, required for automatic GNOME hotkey setup')
makedepends=('cargo' 'clang' 'git')
provides=('rayshot')
conflicts=('rayshot')
options=('!lto')
source=("$_srcname::git+https://github.com/paranoica/rayshot.git")
sha256sums=('SKIP')
install=rayshot.install

pkgver() {
	cd "$srcdir/$_srcname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_srcname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_srcname"
	cargo build --release --frozen
}

package() {
	cd "$srcdir/$_srcname"
	install -Dm755 "target/release/rayshot" "$pkgdir/usr/bin/rayshot"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
