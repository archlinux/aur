# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=neo-writing
_appname=neo
pkgver=0.8.1
pkgrel=1
pkgdesc="A distraction-free word processor for authors"
arch=('x86_64')
url="https://github.com/hughhowey/neo"
license=('MIT')
depends=('electron43')
makedepends=('git' 'npm')
source=("${_appname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('df84f548b5b65ab4ecc6a1c796dd118094ab0f52abb162c6e3ecc154cb311348')
options=('!strip')

build() {
	cd "$srcdir/$_appname"
	npm ci --omit=dev --ignore-scripts --no-audit
}

package() {
	cd "$srcdir/$_appname"

	local _appdir="$pkgdir/usr/lib/$pkgname"
	install -dm755 "$_appdir"
	install -Dm644 package.json "$_appdir/package.json"
	install -Dm644 *.js index.html styles.css "$_appdir/"
	cp -a fonts node_modules "$_appdir/"

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/neo-writing" <<'EOF'
#!/bin/sh
exec /usr/bin/electron43 /usr/lib/neo-writing "$@"
EOF
	install -Dm644 build/icon.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/neo-writing.png"
	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/neo-writing.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=NEO
Comment=A distraction-free word processor for authors
Exec=neo-writing
Icon=neo-writing
Terminal=false
Categories=Office;WordProcessor;
EOF
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cp -a fonts/LICENSE-* "$pkgdir/usr/share/licenses/$pkgname/"
}
