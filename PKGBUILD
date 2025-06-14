# Maintainer: 0x150 <4evnyuij on gmail fullstop com>
pkgname=noriskclient-launcher-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r815.6e9a111
pkgrel=1
pkgdesc='Norisk Minecraft Client Launcher git package'
arch=("x86_64" 'aarch64')
url="https://norisk.gg/"
license=('GPL-3.0-only')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'webkit2gtk' 'glibc' 'bzip2' 'gcc-libs' 'openssl' 'xz')
makedepends=('git' 'libappindicator-gtk3' 'librsvg' 'base-devel' 'rust' 'npm' 'nodejs' 'clang' 'lld')
provides=("noriskclient-launcher")
conflicts=("noriskclient-launcher" 'no-risk-client-bin' 'no-risk-client')
source=('nrclauncher::git+https://github.com/NoRiskClient/noriskclient-launcher.git' 'tauriConfig.patch' 'NoRisk Launcher.desktop')
sha256sums=('SKIP' 'SKIP' 'SKIP')
options=('!strip' '!emptydirs')

pkgver() {
	cd "$srcdir/nrclauncher"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/nrclauncher"
	git apply "$srcdir/tauriConfig.patch"
}

build() {
	cd "$srcdir/nrclauncher"
	npm i
	env RUSTFLAGS="-Clinker=clang -Clink-arg=-fuse-ld=lld" CC=clang npm run tauri build -- --no-bundle
}

package() {
	cd "$srcdir/nrclauncher/src-tauri/target/release"
	# dpkg-deb -x *.deb extracted
	# cd "extracted"
	install -Dm755 noriskclient-launcher-v3 "$pkgdir"/usr/bin/noriskclient-launcher-v3
	install -Dm755 "$srcdir/NoRisk Launcher.desktop" "$pkgdir/usr/share/applications/NoRisk Launcher.desktop"
	
	install -Dm755 "$srcdir/nrclauncher/src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/noriskclient-launcher-v3.png"
}
