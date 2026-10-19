# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cadcraft-studio
pkgver=0.6.0
pkgrel=2
url="https://getcadcraft.com/studio"
_url="https://github.com/getcadcraft"
pkgdesc='Every CadCraft app in one desktop install, on one license'
arch=(x86_64)
license=(Apache-2.0)
depends=(alsa-lib
         cairo
         dbus
         gdk-pixbuf2
         glib2
         glibc # libc.so libm.so
         gtk3
         hicolor-icon-theme
         libgcc
         libstdc++
         libsoup3
         openssl
         pango
         shared-mime-info
         webkit2gtk-4.1)
makedepends=(cargo
             clang
             cmake
             nodejs
             php
             python-pillow)
options=(!lto)
_apps=(cadcraft
       bimcraft
       civilcraft
       detailcraft
       markupcraft
       modelcraft
       partcraft
       takeoffcraft)
_shell=76a91514559efa77a5c8bf7cd5e894f76322ea2c
source=("$_url/studio/archive/refs/tags/studio-v$pkgver.tar.gz"
        "$_url/desktop-shell/archive/$_shell/desktop-shell-$pkgver.tar.gz"
        site-bootstrap.php
        site-edition.php
        $pkgname.desktop)
for _a in "${_apps[@]}"; do source+=("$_url/$_a/archive/refs/tags/$_a-v$pkgver/$_a-$_a-$pkgver.tar.gz"); done
sha256sums=('95499d3648b4949400b1033d98e59781cd0ebbeabf52b07eab0b90fb817ee75d'
            '8abb21c877eae1342bf22a09d898684bdfc00de2ea43dd3a4c344b5813213865'
            'b571def5924d57801bd2225b0e57667ae805e669ced070d6ae571c14c24b2dfb'
            'c4347169c28ae2205218df6ca3d1d8761a27e9fcd9a8775a51442c6259cb5dc7'
            '6d078b7f042dbe7ca89c42021b39339d4e8c5d2f9baf9dbc13accf0642d9db4f'
            '8fbbfdaf58ca7886ce83e7dd26f4d1fb419ff0e89989c4e1b2ccafcc9729d89b'
            '8864f9b5f47b0b0b881121323582be6d7d0efbc97d234c22bcfdfa4c64448b6e'
            '3eb5a151d802d1d19f457d2f692d6c312f0d1820e817d780c2889913a09c922a'
            '532878545db4ee63f6d98a7d518d2b9db4c5673280012b949d1ebbb6cd9a8b78'
            '4a1bcc8120e1efd6ecd1d20594dd5f41d292bdeb125d402d36c50d06b706e05a'
            '0c11009f8a4141a0d9e3779f164b32284caf917d5d4c2601ed26cd81656c62a9'
            '281d00df6cfe829665c9591c5337fef1822bc6e107c184d1857cff09c84218c7'
            'd5d988848e7f2716c64aee2e6ad1104487419754c241fa2c2eaa3b8a99014ae5')

_build=${pkgver%%.[0-9]}

_srcenv() {
	cd "${1:-$srcdir/desktop-shell}"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	export PATH="$srcdir/.cargo/bin:$PATH"
	RUSTFLAGS+=" --remap-path-prefix $PWD=/"
}

_site() {
	local site="$srcdir/site" app="$srcdir/cadcraft-cadcraft-v$pkgver"
	install -d "$site"/{bin,devshell} \
	           "$site/public_html/core/classes" \
	           "$site/public_html/core/components" \
	           "$site/public_html/assets/js" \
	           "$site/public_html/assets/lang"
	# A real copy: bootstrap.php reads dirname(__DIR__) for CC_PUBLIC, which must resolve inside the site.
	rm -f "$site/public_html/core/bootstrap.php" "$site/devshell/edition.php"
	cp "$srcdir/site-bootstrap.php" "$site/public_html/core/bootstrap.php"
	cp "$srcdir/site-edition.php" "$site/devshell/edition.php"
	ln -sf "$app/devshell/render.php" "$site/devshell/render.php"
	ln -sf "$app/devshell/stubs.php" "$site/devshell/stubs.php"
	ln -sf "$app/devshell/site/core/classes/Lang.php" "$site/public_html/core/classes/Lang.php"
	ln -sf "$app/devshell/site/core/components/app-settings.inc" "$site/public_html/core/components/app-settings.inc"
	ln -sf "$app/devshell/site/assets/lang/shell" "$site/public_html/assets/lang/shell"
	ln -sf "$app/devshell/site/assets/js/i18n.js" "$site/public_html/assets/js/i18n.js"
	ln -sf "$app/web/v$_build/assets/apps/cadcraft/$_build/host.js" "$site/public_html/assets/js/host.js"
}

_shelljson() {
	local root="$1"
	node - "$root" <<-'JS'
		const fs = require('fs'), path = require('path');
		const root = process.argv[2];
		let headers = {};
		const apps = path.join(root, 'apps');
		if (fs.existsSync(apps)) {
			for (const a of fs.readdirSync(apps)) {
				const d = path.join(apps, a, 'assets/apps', a);
				if (!fs.existsSync(d) || !fs.statSync(d).isDirectory()) continue;
				for (const v of fs.readdirSync(d)) {
					const m = path.join(d, v, 'manifest.json');
					if (!fs.existsSync(m)) continue;
					try {
						const iso = JSON.parse(fs.readFileSync(m, 'utf8')).isolate;
						if (iso) headers = { 'Cross-Origin-Opener-Policy': 'same-origin', 'Cross-Origin-Embedder-Policy': iso };
					} catch (e) {}
				}
			}
		}
		const rel = fs.existsSync(path.join(root, 'release.json'))
			? JSON.parse(fs.readFileSync(path.join(root, 'release.json'), 'utf8'))
			: {};
		process.stdout.write(JSON.stringify({ app: 'studio', name: rel.name || 'CadCraft Studio', version: String(rel.build || '0.4'), headers, suite: true }, null, 2) + '\n');
	JS
}

_icon() {
	python3 "$srcdir/desktop-shell/make-icon.py" studio icon.png
	install -d icons
	python3 - icon.png icons <<-'PY'
		import os, sys
		from PIL import Image
		img = Image.open(sys.argv[1])
		for s in (16, 24, 32, 48, 64, 128, 256, 512):
		    img.resize((s, s), Image.LANCZOS).save(os.path.join(sys.argv[2], f'{s}x{s}.png'))
	PY
}

prepare() {
	set -x
	local slug
	for slug in "${_apps[@]}"; do
		install -d "editions/$slug/browser-edition"
		rm -rf "editions/$slug/browser-edition/v$_build"
		cp -a "$slug-$slug-v$pkgver/web/v$_build" "editions/$slug/browser-edition/v$_build"
	done
	for slug in "${_apps[@]}"; do
		install -d "builds/$slug"
		ln -sf "$srcdir/$slug-$slug-v$pkgver/app" "builds/$slug/$_build"
		ln -sf "$srcdir/$slug-$slug-v$pkgver/devshell" "builds/$slug/devshell"
	done
	_site
	_srcenv "$srcdir/desktop-shell/src-tauri"
	cargo fetch --locked --target host-tuple
}

build() {
	CADCRAFT_SITE="$srcdir/site" \
	CADCRAFT_APPS="$srcdir/builds" \
	CADCRAFT_EDITIONS="$srcdir/editions" \
		node "$srcdir/studio/pack/suite.mjs" --build "$_build" --editions "$srcdir/editions" --out "$srcdir/out" --allow-gate
	_shelljson "$srcdir/out/studio-suite/v$_build" > "$srcdir/shell.json"
	_icon
	_srcenv "$srcdir/desktop-shell"
	node licenses.mjs --target x86_64-unknown-linux-gnu --out THIRD_PARTY.md
	_srcenv "$srcdir/desktop-shell/src-tauri"
	TAURI_CONFIG="$_tauriconf" cargo build --frozen --release --features tauri/custom-protocol
}

package() {
	depends+=(libasound.so libcairo.so libdbus-1.so libgcc_s.so
	          libgdk-3.so libgdk_pixbuf-2.0.so libgtk-3.so libwebkit2gtk-4.1.so
	          libgio-2.0.so libglib-2.0.so libgobject-2.0.so libjavascriptcoregtk-4.1.so libsoup-3.0.so)
	local root="$pkgdir/usr/lib/$pkgname"
	install -Dm0755 "$srcdir/desktop-shell/src-tauri/target/release/cadcraft-desktop" "$pkgdir/usr/bin/$pkgname"
	install -d "$root"
	cp -a "$srcdir/out/studio-suite/v$_build" "$root/app"
	rm -f "$root/app/.htaccess" "$root/app/web.config"
	install -Dm0644 "$srcdir/shell.json" "$root/shell.json"
	install -Dm0644 -t "$root/" "$srcdir/desktop-shell/THIRD_PARTY.md" "$srcdir/desktop-shell/LICENSE"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/desktop-shell/LICENSE"
	# The apps' shared-mime-info definitions for the types the desktop entry declares.
	local m slug
	for slug in "${_apps[@]}"; do
		for m in "$srcdir/$slug-$slug-v$pkgver"/linux/flathub/*.mime.xml; do
			[[ -e $m ]] || continue
			install -Dm0644 "$m" "$pkgdir/usr/share/mime/packages/$slug.xml"
		done
	done
	local d
	for d in 16 24 32 48 64 128 256 512; do
		install -Dm0644 "$srcdir/icons/${d}x${d}.png" "$pkgdir/usr/share/icons/hicolor/${d}x${d}/apps/$pkgname.png"
	done
}

_tauriconf='{"productName":"cadcraft-studio","mainBinaryName":"cadcraft-desktop","identifier":"com.getcadcraft.studio","version":"0.4.0"}'
