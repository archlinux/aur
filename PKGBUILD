# Maintainer: aydevix <vidskix [at] gmail [dot] com>

pkgname=musetext-git
pkgver=r1.g5ba0a92
pkgrel=1
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
	if git rev-parse --git-dir >/dev/null 2>&1; then
		printf 'r%s.g%s\n' \
			"$(git rev-list --count HEAD)" \
			"$(git rev-parse --short=7 HEAD)"
		return
	fi
	# Not a git checkout, so fall back to the mtime of the newest source file.
	printf 'r%s\n' "$(date -u -r "$(find . -maxdepth 1 -name '*.go' -printf '%T@\n' | sort -rn | head -n1 | cut -d. -f1)" +%Y%m%d)"
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
}
