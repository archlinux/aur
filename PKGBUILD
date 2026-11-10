# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=ae-code
pkgname="$_pkgbase"
pkgver=2026.11.10.2
pkgrel=1
pkgdesc='Desktop GUI for coding agents (fork of T3 Code), release'
arch=('x86_64')
url='https://github.com/SelfRef/ae-code'
license=('MIT')
depends=(
	'alsa-lib'
	'at-spi2-core'
	'cairo'
	'dbus'
	'expat'
	'gdk-pixbuf2'
	'glib2'
	'glibc'
	'gtk3'
	'hicolor-icon-theme'
	'libcups'
	'libdrm'
	'libgcc'
	'libnotify'
	'libsecret'
	'libstdc++'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxkbcommon'
	'libxrandr'
	'libxss'
	'libxtst'
	'mesa'
	'nspr'
	'nss'
	'pango'
	'systemd-libs'
	'util-linux-libs'
	'xdg-utils'
	'zlib'
)
makedepends=('cargo' 'imagemagick' 'nodejs' 'npm' 'pkgconf')
conflicts=("$_pkgbase-bin" "$_pkgbase-git")
options=('!debug' '!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36b3b9a864104ddf1d1c2e11068135214ceb1f98eed9ddc84798a80fd50f4466')

build() {
	cd "$_pkgbase-$pkgver"

	# 2026.11.09.1 -> 2026.1109.1, the semver the apps are built with.
	local y m d n
	IFS=. read -r y m d n <<<"$pkgver"
	local appver="$y.$((10#$m * 100 + 10#$d)).${n:-0}"

	# Keep the Node.js, pnpm, npm, Electron and Cargo downloads out of the user's home.
	export HOME="$srcdir/home" CARGO_HOME="$srcdir/cargo"
	mkdir -p "$HOME"

	# The workspace pins its own Node.js and pnpm; Vite+ (vp) fetches them.
	npm install --global --prefix "$srcdir/vp" \
		"vite-plus@$(sed -nE 's/^  vite-plus: ([0-9][^ ]*)$/\1/p' pnpm-workspace.yaml)"
	export PATH="$srcdir/vp/bin:$PATH"

	vp install
	node scripts/update-release-package-versions.ts "$appver"
	node scripts/build-desktop-artifact.ts --platform linux --arch x64 --target dir \
		--build-version "$appver" --output-dir "$srcdir/out"
}

package() {
	cd "$_pkgbase-$pkgver"
	install -d "$pkgdir/opt/$_pkgbase"
	cp -a --no-preserve=ownership "$srcdir/out/linux-unpacked/." "$pkgdir/opt/$_pkgbase/"
	chmod 4755 "$pkgdir/opt/$_pkgbase/chrome-sandbox"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgbase/ae-code" "$pkgdir/usr/bin/ae-code"

	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ae-code.desktop" <<'EOF'
[Desktop Entry]
Name=AE Code
Comment=Desktop GUI for coding agents
Exec=ae-code %U
TryExec=ae-code
Terminal=false
Type=Application
Icon=ae-code
StartupWMClass=dev.aperte.AECode
Categories=Development;
MimeType=x-scheme-handler/t3code;
EOF

	# hicolor's index.theme stops at 512x512.
	local size
	for size in 16 22 24 32 48 64 128 256 512; do
		install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
		magick assets/prod/black-universal-1024.png -resize "${size}x${size}" \
			"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ae-code.png"
	done

	install -Dm644 apps/desktop/resources/linux/com.t3tools.t3code.metainfo.xml \
		"$pkgdir/usr/share/metainfo/dev.aperte.AECode.metainfo.xml"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
