# Maintainer: claude-brain maintainers
pkgname=claude-brain
pkgver=0.2.0
pkgrel=1
pkgdesc="A local second brain for Claude Code: hybrid recall over notes and past sessions, episodic memory, note-graph traversal, 3D visualisation, cloud sync"
arch=('x86_64' 'aarch64')
url="https://aur.archlinux.org/packages/claude-brain"
license=('MIT')
depends=('bun' 'rclone' 'xdg-utils')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('c0f6bf029842bf5d008d4c33c7cd44eb15e827543417b9f443fa54f331651ed0')

build() {
	cd "$pkgname-$pkgver"
	bun install --frozen-lockfile
	bun run build
	# Runtime needs only production deps (fastembed, sqlite-vec; three is bundled).
	rm -rf node_modules
	bun install --frozen-lockfile --production
}

check() {
	cd "$pkgname-$pkgver"
	# Only needs production deps (bun:test is built in, sqlite-vec is a runtime dep),
	# so this still passes after build() prunes devDependencies.
	bun test
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
