# Maintainer: denbrahe <denbrahe@hotmail.com>
# Contributor: Philipp A. <flying-sheep@web.de>
pkgname=rambox-os-git
pkgver=r989.821e3f5
pkgrel=2
pkgdesc="Free and Open Source messaging and emailing app that combines common web applications into one."
arch=(i686 x86_64)
url="https://github.com/TheGoddessInari/rambox"
license=('GPL3')
depends=(electron)
makedepends=('git' 'desktop-file-utils' 'ruby' 'npm' 'sencha-cmd-6')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "rambox" "rambox-bin")
replaces=()
backup=()
options=()
install=
source=(
	'rambox-os::git+https://github.com/TheGoddessInari/rambox.git'
	"${pkgname%-git}.js"
	"${pkgname%-git}.desktop"
	)
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -Ei 's/\s+"electron": "[^"]+",//' package.json
}

build() {
	cd "$srcdir/${pkgname%-git}"
	npm install
	npm run repack:linux64
}

package() {
	install -d "$pkgdir/usr/lib"

	cp -r "$srcdir/${pkgname%-git}/build/production/Rambox" "$pkgdir/usr/lib/rambox-os"
	
	install -Dm755 "$srcdir/${pkgname%-git}.js" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname%-git}/resources/Icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	desktop-file-install "$srcdir/${pkgname%-git}.desktop" --dir "$pkgdir/usr/share/applications/"
}
