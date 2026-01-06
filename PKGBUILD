# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='pie'
pkgver='1.3.5'
pkgrel='1'
pkgdesc='The PHP Installer for Extensions'
arch=('any')
url="https://github.com/php/$pkgname"
license=('BSD-3-Clause')
depends=('php' 'git')
makedepends=('composer' 'php-box')
source=("$pkgname-$pkgver::git+$url#tag=$pkgver?signed")
b2sums=('e667942e036a0977bc1826632ff0fda8f9e52d772c4f03df39e93b89b0f5a2eb08c0a3620ff668636f1504eb49830dc0573e0bebb4df7767d56f68d4dc58f544')
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
