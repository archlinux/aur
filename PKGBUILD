# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=ae-code
pkgname="$_pkgbase-bin"
pkgver=2026.11.11
pkgrel=1
pkgdesc='Desktop GUI for coding agents (fork of T3 Code), prebuilt release'
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
makedepends=('imagemagick')
provides=("$_pkgbase=$pkgver")
conflicts=("$_pkgbase" "$_pkgbase-git")
options=('!debug' '!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-desktop-linux-x64.tar.gz"
	"$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/SelfRef/ae-code/v$pkgver/LICENSE"
	"$pkgname-$pkgver-icon.png::https://raw.githubusercontent.com/SelfRef/ae-code/v$pkgver/assets/dev/blueprint-universal-1024.png"
	"$pkgname-$pkgver-metainfo.xml::https://raw.githubusercontent.com/SelfRef/ae-code/v$pkgver/apps/desktop/resources/linux/com.t3tools.t3code.metainfo.xml"
)
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('9e0cb411f7f4fb5f3d6b0c28fd37cb281ecc116e669457348c30014f2a822a49'
            '935d8f2af0c703f9c39517ee57cc4930b19d02d533be930b63f0e82f93614b43'
            'cac4f61215631ce6d4686c9a95329602e329a3fb6f670f1dabf97abcf5baf925'
            '2c5ed7334f9c35280794378a9f8672a635b99898caa5138022e95e44f63d1fa1')

prepare() {
	mkdir -p app
	bsdtar -xf "$pkgname-$pkgver.tar.gz" -C app --strip-components=1
}

package() {
	install -d "$pkgdir/opt/$_pkgbase"
	cp -a --no-preserve=ownership app/. "$pkgdir/opt/$_pkgbase/"
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
		magick "$pkgname-$pkgver-icon.png" -resize "${size}x${size}" \
			"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ae-code.png"
	done

	install -Dm644 "$pkgname-$pkgver-metainfo.xml" \
		"$pkgdir/usr/share/metainfo/dev.aperte.AECode.metainfo.xml"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
