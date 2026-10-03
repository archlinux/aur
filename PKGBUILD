# Maintainer: Ethan Stokes <erstokes10@gmail.com>

pkgname=blockloom-hub-git
pkgver=0.0.1.r0.g74e0d9a
pkgrel=1
pkgdesc='Manage Blockloom projects and editor installations.'
url='https://github.com/Blockworked/Blockloom'
arch=('x86_64')
license=('AGPL-3.0-only')
makedepends=('git' 'rust' 'cmake' 'clang' 'lld' 'pkgconf'
             'curl' 'tar' 'patch' 'qt6-tools')
depends=('qt6-base' 'qt6-declarative'
         'hicolor-icon-theme' 'python' 'gcc-libs' 'glibc')
optdepends=('github-cli: fetch private Blockloom release catalogs in the Hub')
provides=('blockloom-hub')
conflicts=('blockloom-hub')
source=("git+https://github.com/Blockworked/Blockloom")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
	cd "$srcdir/Blockloom"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/Blockloom"
	# Recreate gitignored .patched-deps/ from patches/ (needs bash, curl,
	# tar, patch and sha256sum); cargo needs these paths to resolve the
	# workspace even when only building -p blockloom-hub.
	bash scripts/prepare-patched-deps.sh
	cargo fetch --locked
}

build() {
	cd "$srcdir/Blockloom"
	cargo build --frozen --release -p blockloom-hub
}

package() {
	cd "$srcdir/Blockloom"

	# Mirrors `just hub-install`: private libdir plus a symlink on PATH.
	install -Dm755 "target/release/blockloom-hub" "$pkgdir/usr/lib/blockloom-hub/blockloom-hub"
	install -d "$pkgdir/usr/bin"
	ln -sf /usr/lib/blockloom-hub/blockloom-hub "$pkgdir/usr/bin/blockloom-hub"

	install -Dm644 "res/blockloom-hub.desktop" "$pkgdir/usr/share/applications/blockloom-hub.desktop"
	install -Dm644 "res/icons/blockloom.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/blockloom-hub.png"
}
