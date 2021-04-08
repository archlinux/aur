pkgname=lyriek-git
pkgver=0.2.1.40.g7ae4c90
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/bartwillems/lyriek/"
license=('GPL3')
depends=('dbus' 'gtk3')
makedepends=('rust' 'cargo' 'git' 'desktop-file-utils')
source=("lyriek::git+https://github.com/BartWillems/lyriek.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/lyriek"
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/lyriek"
	cargo build --release
}

package() {
	pkgdesc="A multi-threaded GTK application to fetch lyrics of currently playing songs"
	provides=('lyriek')

	cd "$srcdir/lyriek"
	
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "extras/lyriek.desktop"
	install -D -m755 "target/release/lyriek" "$pkgdir/usr/bin/lyriek"
	install -D -m644 "assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/lyriek.svg"
}

