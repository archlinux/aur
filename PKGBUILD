# Maintainer: Seraphim Pardee <me at srp dot life>
pkgname=neo-writing-git
_appname=neo
pkgver=0.8.4.r1.gac12d84
pkgrel=1
pkgdesc="A distraction-free word processor for authors"
arch=('x86_64')
url="https://github.com/hughhowey/neo"
license=('MIT')
depends=('electron43')
makedepends=('npm')
source=("${_appname}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "$srcdir/$_appname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
exec /usr/bin/electron43 /usr/lib/neo-writing-git "$@"
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
