# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: devome <evinedeng@hotmail.com>

pkgname=gotenberg
pkgver=8.25.0
pkgrel=1
pkgdesc='A developer-friendly API for converting numerous document formats into PDF files, and more!'
arch=(i686 pentium4 x86_64 arm armv7h armv6h aarch64 riscv64)
url="https://github.com/$pkgname/$pkgname"
license=(MIT)
backup=("etc/default/$pkgname")
depends=(chromium
         libreoffice-fresh
         pdfcpu
         pdftk
         perl-image-exiftool
         qpdf
         unoconv)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz"
        "$pkgname.env"
        "$pkgname.service")
sha256sums=('989fee8ac6ce8453a6d95b1d3d5d314eecd229b01a13cc9d2a1ef54269694e3d'
            'd37f7a96701804c07bb08e123dd05e03a84368251fb0088c060c770d08e436ea'
            '1b3567e2fe374ce104150d198de3fe372724d3b8510aba64716e3dcb3b37c50a')

build() {
	cd "$_archive"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	local ldflags="
		-s -w \
		-X 'github.com/$pkgname/$pkgname/v8/cmd.Version=$pkgver' \
		-extldflags '$LDFLAGS'
	"
	go build -trimpath -o "$pkgname" -ldflags "$ldflags" "cmd/$pkgname/main.go"
}

package() {
	cd "$_archive"
	install -Dm644 "../$pkgname.env" "$pkgdir/etc/default/$pkgname"
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "../$pkgname.service"
	install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
