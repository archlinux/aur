# Maintainer: Jimmy <jimmy.bungalo8@gmail.com>
pkgname=backlog.md-git
pkgver=1.53.0.r1.c310b708
pkgrel=1
pkgdesc="Markdown-based task management CLI with a Kanban board, git-integrated"
arch=('any')
url="https://backlog.md"
license=('MIT')
depends=('bun')
makedepends=('git')
provides=('backlog')
conflicts=('backlog')
source=("$pkgname::git+https://github.com/MrLesk/Backlog.md.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	bun install --frozen-lockfile
	BACKLOG_BUILD_VERSION="$pkgver" BACKLOG_BUILD_OUTDIR=dist bun scripts/build.ts
}

package() {
	cd "$srcdir/$pkgname"
	install -d "$pkgdir/usr/lib/backlog"
	cp -R dist/. "$pkgdir/usr/lib/backlog/"

	install -d "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/backlog" <<-EOF
	#!/bin/sh
	export BACKLOG_BUNDLE_ASSET_DIR=/usr/lib/backlog
	exec bun /usr/lib/backlog/cli.js "\$@"
	EOF
	chmod 755 "$pkgdir/usr/bin/backlog"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
