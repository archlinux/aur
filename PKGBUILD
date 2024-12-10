# Maintainer: 0x150 <4evnyuij on gmail fullstop com>
pkgname=noriskclient-launcher-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r655.a2d4011
pkgrel=1
pkgdesc='Norisk Minecraft Client Launcher git package'
arch=("x86_64" 'aarch64')
url="https://norisk.gg/"
license=('GPL-3.0-only')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk' 'glibc' 'bzip2' 'gcc-libs' 'openssl' 'xz')
makedepends=('git' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'base-devel' 'rust' 'npm' 'nodejs' 'dpkg' 'findutils' 'clang' 'lld')
provides=("noriskclient-launcher")
conflicts=("noriskclient-launcher" 'no-risk-client-bin' 'no-risk-client')
source=('nrclauncher::git+https://github.com/NoRiskClient/noriskclient-launcher.git')
sha256sums=('SKIP')
options=('!strip' '!emptydirs')

pkgver() {
	cd "$srcdir/nrclauncher"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/nrclauncher"
	npm i
}

build() {
	cd "$srcdir/nrclauncher" 
	env RUSTFLAGS="-Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld" CC=clang npm run tauri build -- --bundles deb
}

package() {
	cd "$srcdir/nrclauncher/src-tauri/target/release/bundle/deb"
	dpkg-deb -x *.deb extracted
	cd "extracted"
	install -Dm755 usr/bin/no-risk-client "$pkgdir"/usr/bin/no-risk-client
	find usr/share -type f -exec install -Dm755 "{}" "$pkgdir/{}" \;
}
