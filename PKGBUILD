# Maintainer: aydevix <vidskix [at] gmail [dot] com>

pkgname=musetext-git
pkgver=v.261004
pkgrel=2
pkgdesc="Minimalist text animation tool that renders transparent WebM video with FFmpeg"
arch=('x86_64')
url="https://github.com/aydevix/muse"
license=('GPL-3.0-or-later')
depends=('gtk4' 'ffmpeg')
makedepends=('go' 'pkgconf')
source=('git+https://github.com/aydevix/muse')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/muse"
	# Kernel style date versioning: v.YYMMDD taken from the date of the newest
	# upstream commit, in UTC so that a rebuild always yields the same string.
	if git rev-parse --git-dir >/dev/null 2>&1; then
		printf 'v.%s\n' "$(TZ=UTC git log -1 --date=format:%y%m%d --format=%cd)"
		return
	fi
	# Not a git checkout, so fall back to the mtime of the newest source file.
	printf 'v.%s\n' "$(date -u -r "$(find . -maxdepth 1 -name '*.go' -printf '%T@\n' | sort -rn | head -n1 | cut -d. -f1)" +%y%m%d)"
}

build() {
	cd "$srcdir/muse"
	export CGO_ENABLED=1
	go build -trimpath -ldflags="-s -w" -o "musetext-$pkgver-$CARCH" .
}

check() {
	cd "$srcdir/muse"
	go test ./...
}

package() {
	cd "$srcdir/muse"
	install -Dm755 "musetext-$pkgver-$CARCH" "$pkgdir/usr/bin/muse"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# Desktop entry so Muse shows up in the application menu, plus its icon.
	install -Dm644 dev.muse.Animator.desktop "$pkgdir/usr/share/applications/dev.muse.Animator.desktop"
	install -Dm644 logo/muse-logo.png "$pkgdir/usr/share/icons/hicolor/1000x1000/apps/muse.png"
}
