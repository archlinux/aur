# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='mirador'
pkgname="$_pkgname-git"
pkgver='r31.g2b50652'
pkgrel='1'
pkgdesc='CLI to watch mailbox changes'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/pimalaya/$_pkgname"
license=('AGPL-3.0-only')
depends=('dbus>=1.16.0' 'libgit2' 'zlib')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')
source=("$pkgname::git+$url")
b2sums=('SKIP')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	cargo fetch --locked --target host-tuple
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	export CARGO_TARGET_DIR='target'
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	_commit="$(git rev-parse HEAD)"
	_checkoutput="$("$srcdir/$_sourcedirectory/target/release/$_pkgname" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "rev $_commit$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	# Install binary
	install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	# Generate man pages
	"$pkgdir/usr/bin/$_pkgname" manuals "$pkgdir/usr/share/man/man1/"

	# Generate shell completion files
	install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
	"$pkgdir/usr/bin/$_pkgname" completions bash --dir "$pkgdir/usr/share/bash-completion/completions/"

	install -dm755 "$pkgdir/usr/share/elvish/lib/"
	"$pkgdir/usr/bin/$_pkgname" completions elvish --dir "$pkgdir/usr/share/elvish/lib/"

	install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d/"
	"$pkgdir/usr/bin/$_pkgname" completions fish --dir "$pkgdir/usr/share/fish/vendor_completions.d/"

	install -dm755 "$pkgdir/usr/share/powershell/completions/"
	"$pkgdir/usr/bin/$_pkgname" completions powershell --dir "$pkgdir/usr/share/powershell/completions/"

	install -dm755 "$pkgdir/usr/share/zsh/site-functions/"
	"$pkgdir/usr/bin/$_pkgname" completions zsh --dir "$pkgdir/usr/share/zsh/site-functions/"

	# Install service file
	install -Dm644 "assets/$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
	sed -i 's|%install_dir%|/usr/bin|g' "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
}
