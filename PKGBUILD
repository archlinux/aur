# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=atac-git
_pkgname=${pkgname%-git}
pkgver=0.19.0.r24.50c495b
pkgrel=1
pkgdesc="A simple API client (postman like) in your terminal"
arch=('x86_64')
url="https://github.com/Julien-cpsn/ATAC"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
	cd "$_pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	mkdir -p completions/
}

build() {
	cd "$_pkgname"
	export CFLAGS='-std=gnu17' # fix dep build error with GCC 15
	cargo build --release --frozen
	local compgen="target/release/$_pkgname completions"
	$compgen bash "completions"
	$compgen fish "completions"
	$compgen zsh "completions"
	"target/release/$_pkgname" man
}

check() {
	cd "$_pkgname"
	cargo test --frozen
}

package() {
	cd "$_pkgname"
	install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 "$_pkgname.1" -t "$pkgdir/usr/share/man/man1/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 "completions/$_pkgname.bash" -t "$pkgdir/usr/share/bash-completion/completions/"
	install -Dm644 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dm644 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
