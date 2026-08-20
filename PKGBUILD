# Maintainer: Ludovic Lerus <little.corn3620@fastmail.com>
pkgname=hubble.md-bin
pkgver=0.1.28
pkgrel=1
pkgdesc="Local-first Markdown editor (Hubble desktop app) — prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://hubble.md"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils'
         'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: system tray icon support')
provides=("hubble.md=$pkgver" "hubble-md=$pkgver")
conflicts=('hubble.md' 'hubble-md')
options=('!strip' '!debug')
source_x86_64=("hubble.md-$pkgver-x86_64.deb::https://github.com/bholmesdev/hubble.md/releases/download/desktop-v$pkgver/hubble_${pkgver}_amd64.deb")
source_aarch64=("hubble.md-$pkgver-aarch64.deb::https://github.com/bholmesdev/hubble.md/releases/download/desktop-v$pkgver/hubble_${pkgver}_arm64.deb")
# MIT license isn't inside the .deb; pull it from the tagged source.
source=("hubble.md-$pkgver-LICENSE::https://raw.githubusercontent.com/bholmesdev/hubble.md/desktop-v$pkgver/LICENSE")
sha256sums=('86ee45fc09f4b8b03eb68e2ba5fbb3eca0ace3e5ece46f805d8c6103266230b4')
sha256sums_x86_64=('b62d5748edbc19af5303cef905c80dea4f5ba0b06f46d736bbf535eb9b51ab6f')
sha256sums_aarch64=('0a8de94a611289a194923f1b03ad83095eec6a999ed0d7aba257c0d5be70ba5d')

package() {
	cd "$srcdir"

	# Extract the .deb's data payload into $pkgdir (ar -> data.tar.xz -> pkgdir).
	bsdtar -xOf hubble.md-$pkgver-*.deb data.tar.xz | bsdtar -xpf - -C "$pkgdir"

	# Recreate the launcher symlink the .deb postinst would make.
	install -d "$pkgdir/usr/bin"
	ln -s /opt/Hubble/hubble.md "$pkgdir/usr/bin/hubble.md"

	# Arch has unprivileged user namespaces; ship chrome-sandbox non-SUID.
	chmod 0755 "$pkgdir/opt/Hubble/chrome-sandbox"

	install -Dm644 "hubble.md-$pkgver-LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
