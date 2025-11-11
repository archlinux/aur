# Maintainer: TheKing <archlinux.mourner080@passmail.net>
# PKGBUILD Repo: https://codeberg.org/TheKing6488/NoRisk-Client-Lanucher-AUR
pkgname=norisk-client-launcher
pkgver=r1263.4e73192
pkgrel=1
pkgdesc='Norisk Minecraft Client Launcher git package'
arch=("x86_64")
url="https://norisk.gg/"
license=('GPL-3.0-only')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'glibc' 'bzip2' 'gcc-libs' 'openssl' 'xz')
makedepends=('git' 'libappindicator-gtk3' 'librsvg' 'base-devel' 'rust' 'nodejs' 'clang' 'lld' 'webkit2gtk-4.1' 'yarn' )
conflicts=("noriskclient-launcher" 'no-risk-client-bin' 'no-risk-client' 'noriskclient-launcher-git' 'norisk-client-launcher-nvidia')
source=('nrclauncher::git+https://github.com/NoRiskClient/noriskclient-launcher.git' 'norisk-launcher.desktop')
sha256sums=('SKIP' '49b552bb46e08ae2d9d70ff4ea459bdeba28e4d97883126f89b6039e991c5e6e' )

pkgver() {
	cd "$srcdir/nrclauncher"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/nrclauncher"
	yarn install
	env RUSTFLAGS="-Clinker=clang -Clink-arg=-fuse-ld=lld" CC=clang yarn run tauri build -- --no-bundle
}

package() {
	cd "$srcdir/nrclauncher/src-tauri/target/release"
	# Binary
	install -Dm755 noriskclient-launcher-v3 "$pkgdir"/usr/bin/noriskclient-launcher-v3
	# Symlink
	ln -s /usr/bin/noriskclient-launcher-v3 "$pkgdir/usr/bin/norisk-client"
	# Desktop
	install -Dm755 "$srcdir/norisk-launcher.desktop" "$pkgdir/usr/share/applications/norisk-launcher.desktop"
	# License
    install -Dm644 "$srcdir/nrclauncher/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# Icon
	install -Dm644 "$srcdir/nrclauncher/src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/noriskclient-launcher-v3.png"
}
