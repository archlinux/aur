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
optdepends=(
	'bash-completion: bash completion support'
	'zsh: zsh completion support'
	'fish: fish completion support'
)
provides=('backlog')
conflicts=('backlog')
source=("$pkgname::git+https://github.com/MrLesk/Backlog.md.git" 'backlog.sh')
sha256sums=('SKIP' 'bf4a644f0fb9580d5883a3507bb96e864cf05c1f06abb5a9a84b0e14c129f023')

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

	install -Dm755 "$srcdir/backlog.sh" "$pkgdir/usr/bin/backlog"

	install -Dm644 completions/backlog.bash "$pkgdir/usr/share/bash-completion/completions/backlog"
	install -Dm644 completions/_backlog "$pkgdir/usr/share/zsh/site-functions/_backlog"
	install -Dm644 completions/backlog.fish "$pkgdir/usr/share/fish/vendor_completions.d/backlog.fish"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
