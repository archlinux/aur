# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=devhub
pkgver=0.95.1
pkgrel=1
pkgdesc="TweetDeck for GitHub - Android, iOS, Web & Desktop"
arch=('x86_64' 'i686')
url="https://github.com/devhubapp/devhub"
license=('AGPL3')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2'
         'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop default (xdg-email, xdg-open)')
makedepends=('yarn' 'jq' 'moreutils')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/devhubapp/devhub/archive/v$pkgver.tar.gz")
sha256sums=('980e598adfff1fedd3259ab4d8dbf0ce561a9536fdbe6fd8406be43849a74683')
provides=("devhub")

prepare() {
	cd "$pkgname-$pkgver"
	jq '.build.linux.target = ["dir"]' "$srcdir/$pkgname-$pkgver/packages/desktop/package.json" | sponge "$srcdir/$pkgname-$pkgver/packages/desktop/package.json"
	yarn --pure-lockfile
	yarn clean
}

build() {
	cd "$pkgname-$pkgver"
	yarn workspace @devhub/web build
    yarn workspace @devhub/desktop build:skipweb --linux
}

package() {
	cd "$pkgname-$pkgver/packages/desktop/build/linux-unpacked"
	find . -type f -exec install -Dm644 {} "$pkgdir/opt/devhub/{}" \;
	chmod 755 "$pkgdir/opt/devhub/devhub"
	mkdir -p "$pkgdir/usr/bin"
	ln -sf /opt/devhub/devhub "$pkgdir/usr/bin/devhub"

	echo "[Desktop Entry]
Name=DevHub
Comment=TweetDeck for GitHub - Android, iOS, Web & Desktop
Exec=/opt/devhub/devhub %U
Terminal=false
Type=Application
Icon=devhub
Categories=Utility;Development;
MimeType=x-scheme-handler/devhub;" > "$srcdir/devhub.desktop"
	install -Dm644 "$srcdir/devhub.desktop" "$pkgdir/usr/share/applications/devhub.desktop"

	install -Dm644 "$srcdir/$pkgname-$pkgver/packages/desktop/assets/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/devhub.png"
}
