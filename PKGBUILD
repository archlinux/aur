# Maintainer: Dario Banfi <hello@dariobanfi.com>

pkgname=anthropic-cli-bin
_pkgname=anthropic-cli
pkgver=1.41.0
pkgrel=1
pkgdesc="The official CLI for the Claude API (ant)"
arch=('x86_64' 'aarch64' 'i686' 'armv6h')
url="https://github.com/anthropics/anthropic-cli"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" 'ant')
options=('!strip' '!debug')

_relurl="$url/releases/download/v$pkgver"

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/anthropics/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$_relurl/ant_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$_relurl/ant_${pkgver}_linux_arm64.tar.gz")
source_i686=("$_pkgname-$pkgver-i686.tar.gz::$_relurl/ant_${pkgver}_linux_386.tar.gz")
source_armv6h=("$_pkgname-$pkgver-armv6h.tar.gz::$_relurl/ant_${pkgver}_linux_armv6.tar.gz")

sha256sums=('8bf96984ff8bcfae7e48cae76a529e8a25317ba9e02abf7fd3cc64fdf95657a6')
sha256sums_x86_64=('464df887f9371df822637ccd949e0f82553c53d25994b75207124870891b3931')
sha256sums_aarch64=('ad48ba9216bb7dd4860e84772f1e99153ba319c56bdc4d1aabb28433b7ec24ce')
sha256sums_i686=('510ff4f6c820c107ac1031fc3381111f37e0a08698d0c7b75a282102d033f99f')
sha256sums_armv6h=('ec4b48f22cec65b52e69c5aebe7099edd816e38103b243902a43106eca7741af')

package() {
	install -Dm755 "$srcdir/ant" "$pkgdir/usr/bin/ant"

	# Completions are sourced, not executed; drop upstream's shebangs so they
	# are not mistaken for scripts requiring bash/fish at runtime.
	sed '1{/^#!/d}' "$srcdir/completions/ant.bash" |
		install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/ant"
	sed '1{/^#!/d}' "$srcdir/completions/ant.fish" |
		install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/ant.fish"
	install -Dm644 "$srcdir/completions/ant.zsh" \
		"$pkgdir/usr/share/zsh/site-functions/_ant"

	install -Dm644 "$srcdir/man/man1/ant.1.gz" \
		"$pkgdir/usr/share/man/man1/ant.1.gz"

	install -Dm644 "$srcdir/LICENSE-$pkgver" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
