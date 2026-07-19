# Maintainer: Ludovic Lerus <little.corn3620@fastmail.com>
pkgname=hubble.md
pkgver=0.1.21
pkgrel=1
pkgdesc="Local-first Markdown editor (Hubble desktop app)"
arch=('x86_64' 'aarch64')
url="https://hubble.md"
license=('MIT')
depends=('electron42')
makedepends=('pnpm' 'nodejs' 'npm' 'git')
provides=("hubble-md=$pkgver")
conflicts=('hubble.md-bin')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bholmesdev/hubble.md/archive/refs/tags/desktop-v$pkgver.tar.gz")
sha256sums=('3605d6a8d1610bbcbbf3b0c034c494fd8e3dc97c89bf6242895cbbd568c9d15c')

_pkgsrc="hubble.md-desktop-v$pkgver"

prepare() {
	cd "$srcdir/$_pkgsrc"

	# Tailwind v4 scans the git tree for utility classes; the tarball has no
	# .git, so without this the app builds unstyled. See MAINTAINER.md.
	git init -q
	git add -A
}

build() {
	cd "$srcdir/$_pkgsrc"

	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export PUPPETEER_SKIP_DOWNLOAD=1
	export HUSKY=0
	export CI=true

	pnpm install --frozen-lockfile
	pnpm --filter "@hubble.md/desktop..." build

	# Minimal runtime node_modules: only the main process's externalized prod deps.
	local rt="$srcdir/runtime"
	rm -rf "$rt"
	install -d "$rt"
	node -e 'const p=require("./apps/desktop/package.json").dependencies;
		const pick=["electron-updater","ignore","zod"];
		const deps={}; for(const k of pick) deps[k]=p[k];
		require("fs").writeFileSync(process.argv[1],
			JSON.stringify({name:"hubble-md-runtime",version:"0.0.0",private:true,dependencies:deps}));' \
		"$rt/package.json"
	npm install --omit=dev --no-audit --no-fund --prefix "$rt"
}

package() {
	cd "$srcdir/$_pkgsrc"

	local appdir="$pkgdir/usr/lib/$pkgname"
	install -d "$appdir"
	cp -r apps/desktop/out "$appdir/out"
	cp -r "$srcdir/runtime/node_modules" "$appdir/node_modules"

	printf '{\n  "name": "hubble-md",\n  "productName": "Hubble",\n  "version": "%s",\n  "type": "module",\n  "main": "./out/main/main.js"\n}\n' \
		"$pkgver" > "$appdir/package.json"

	install -d "$pkgdir/usr/bin"
	printf '#!/bin/sh\nexec electron42 /usr/lib/%s "$@"\n' "$pkgname" \
		> "$pkgdir/usr/bin/$pkgname"
	chmod 755 "$pkgdir/usr/bin/$pkgname"

	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<-EOF
		[Desktop Entry]
		Type=Application
		Name=Hubble
		GenericName=Markdown Editor
		Comment=Local-first Markdown editor
		Exec=$pkgname %U
		Icon=$pkgname
		Terminal=false
		Categories=Office;Utility;TextEditor;
		MimeType=text/markdown;text/x-markdown;
		StartupWMClass=Hubble
		StartupNotify=true
	EOF

	install -Dm644 apps/desktop/assets/icon.png \
		"$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
	install -Dm644 apps/desktop/assets/icon-master-1024.png \
		"$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
