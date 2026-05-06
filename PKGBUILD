# Maintainer: WillyJL <me@willyjl.dev>
pkgname=flipperui-git
pkgver=v0.3.5.r15.g9af4746
pkgrel=1
pkgdesc="A fast, native desktop manager for Flipper Zero"
arch=(x86_64)
url="https://github.com/fuckmaz/FlipperUI"
license=('PolyForm-Noncommercial-1.0.0')
groups=()
depends=(webkit2gtk-4.1 glib2 libsoup3 gtk3 cairo gdk-pixbuf2 dbus systemd-libs)
makedepends=(git npm)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
source=('flipperui::git+https://github.com/fuckmaz/FlipperUI.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --tags --long --abbrev=7 | sed 's/^flipperui.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	npm install
}

build() {
	cd "$srcdir/${pkgname%-git}"
	rm -rf "$srcdir/${pkgname%-git}"/src-tauri/target/release/bundle
    npm run -- tauri build -b deb
}

#check() {
#	cd "$srcdir/${pkgname%-git}"
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	cp -rT "$srcdir/${pkgname%-git}"/src-tauri/target/release/bundle/deb/FlipperUI_*/data/usr "${pkgdir}"/usr
}
