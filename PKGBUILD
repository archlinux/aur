# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cadcraft-studio
pkgver=0.4.0
pkgrel=1
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
             git
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
_appver=0.4.0
_build=0.4
_studio=57640c4a050843d44abf6abf694ed7543b5a5065
_shell=d132555bd0bc191c8045eefa12ccd4a8dad6ce02
source=(studio::git+$_url/studio#commit=$_studio
        desktop-shell::git+$_url/desktop-shell#commit=$_shell
        site-bootstrap.php
        site-edition.php
        $pkgname.desktop)
for _a in "${_apps[@]}"; do
	source+=("$pkgname-$_a-$_appver.tar.gz::$_url/$_a/archive/refs/tags/$_a-v$_appver.tar.gz")
done
sha256sums=('2bdc69d33cacb8297517454d232c3a48d9fba4d2058d699bd41dd3809d0b09e9'
            '33b463e05ce1e02eff8f5c57b6fb65741c7bf8c3e2585bb5b254335864e99b3c'
            'b571def5924d57801bd2225b0e57667ae805e669ced070d6ae571c14c24b2dfb'
            'c4347169c28ae2205218df6ca3d1d8761a27e9fcd9a8775a51442c6259cb5dc7'
            '6d078b7f042dbe7ca89c42021b39339d4e8c5d2f9baf9dbc13accf0642d9db4f'
            '427b4b165544d9a299ddc1cd886a2d714a1082d08727c7e433a2e843fd6a4569'
            '9683fb3bc45baba6cf7f570d41703ee0432d0d07e5c83c489b86076cfa66f09b'
            'd4dd8f8e939c99763217f6cc23b2c605f3377aa413a8227de43db479c23244dd'
            '11c32ac84230c008e45199a1857fd68274849f55d38f4ef06972f7cf69ad642a'
            'a9b274dfc3cd8b03ad4cfd2e8731d35bd7c0be7eef2447f61084c30a6e139ebd'
            '6559d2e6e7f78a1de97a499074b629a778944f73bc76cf4f107f5238ad635c92'
            'ea4a2e11b481695e272c99f4bda81af17c8706a329d1732a4801d7acc54c4a91'
            'a8124d6ca0be3ec778da3006240419461a4612ce95adc1dc6f5c72466c810d57')

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
	local site="$srcdir/site" app="$srcdir/cadcraft-cadcraft-v$_appver"
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
	local slug
	for slug in "${_apps[@]}"; do
		install -d "editions/$slug/browser-edition"
		rm -rf "editions/$slug/browser-edition/v$_build"
		cp -a "$slug-$slug-v$_appver/web/v$_build" "editions/$slug/browser-edition/v$_build"
	done
	for slug in "${_apps[@]}"; do
		install -d "builds/$slug"
		ln -sf "$srcdir/$slug-$slug-v$_appver/app" "builds/$slug/$_build"
		ln -sf "$srcdir/$slug-$slug-v$_appver/devshell" "builds/$slug/devshell"
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
		for m in "$srcdir/$slug-$slug-v$_appver"/linux/flathub/*.mime.xml; do
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
