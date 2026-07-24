# Maintainer: claude-brain maintainers
pkgname=claude-brain
pkgver=0.1.1
pkgrel=1
pkgdesc="A local second brain for Claude Code: hybrid recall over your markdown vault, 3D knowledge graph, cloud sync (Dropbox / Google Drive / MEGA)"
arch=('x86_64' 'aarch64')
url="https://aur.archlinux.org/packages/claude-brain"
license=('MIT')
depends=('bun' 'rclone' 'xdg-utils')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('39585424abc2f241e84e8edc31253e5e4035199a361a8d54fe9c06719f5d64c8')

build() {
	cd "$pkgname-$pkgver"
	bun install --frozen-lockfile
	bun run build
	# Runtime needs only production deps (fastembed, sqlite-vec; three is bundled).
	rm -rf node_modules
	bun install --frozen-lockfile --production
}

package() {
	cd "$pkgname-$pkgver"
	local app="$pkgdir/usr/share/claude-brain"
	install -d "$app"
	cp -r server.ts src bin public node_modules package.json "$app/"

	install -d "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/claude-brain" <<'SH'
#!/bin/sh
exec /usr/bin/bun /usr/share/claude-brain/bin/claude-brain.ts "$@"
SH
	chmod 755 "$pkgdir/usr/bin/claude-brain"

	install -Dm644 packaging/claude-brain.service "$pkgdir/usr/lib/systemd/user/claude-brain.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
