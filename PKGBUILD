# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='pie'
pkgver='1.3.0'
pkgrel='1'
pkgdesc='The PHP Installer for Extensions'
arch=('any')
url="https://github.com/php/$pkgname"
license=('BSD-3-Clause')
depends=('php' 'git')
makedepends=('composer' 'php-box')
source=("$pkgname-$pkgver::git+$url#tag=$pkgver?signed")
b2sums=('e73ca656ef4a124fa737b01db05a2b226580e756a8bd54b435da44ff7ea6978c11229c2447127c23900d29657f36ceb6a5b46b3c1f997e1d572e40f8f5806b6e')
validpgpkeys=('9DF6EF8E20B7258D38940D789FC9ACAF5F2D9B75') # James Titcumb <james@asgrim.com> (https://github.com/asgrim.gpg)

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	composer install --no-dev
	box compile
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	_checkoutput="$(php pie.phar --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "PHP Installer for Extensions (PIE) $pkgver$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	# Install binary
	install -Dm755 "$pkgname.phar" "$pkgdir/usr/bin/$pkgname"

	# Generate shell completion files
	install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
	"$pkgdir/usr/bin/$pkgname" completion bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"

	install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d/"
	"$pkgdir/usr/bin/$pkgname" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

	install -dm755 "$pkgdir/usr/share/zsh/site-functions/"
	"$pkgdir/usr/bin/$pkgname" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

	# Install license
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE.md' "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}
