# Maintainer: claude-brain maintainers
pkgname=claude-brain
pkgver=0.1.0
pkgrel=1
pkgdesc="A local second brain for Claude Code: hybrid recall over your markdown vault, 3D knowledge graph, cloud sync (Dropbox / Google Drive / MEGA)"
arch=('x86_64' 'aarch64')
url="https://aur.archlinux.org/packages/claude-brain"
license=('MIT')
depends=('bun' 'rclone' 'xdg-utils')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('12234eba04f73f73cd3c8001b54c7e824b03d1e891feca73462d7eba0556903b')

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
