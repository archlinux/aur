# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='mirador'
pkgname="$_pkgname-git"
pkgver='r18.g5cbf315'
pkgrel='1'
pkgdesc='CLI to watch mailbox changes'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/pimalaya/$_pkgname"
license=('MIT')
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
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	cargo fetch --locked --target "$_cargotarget"
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	export CARGO_TARGET_DIR='target'
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	cargo build --frozen --release --target "$_cargotarget" --all-features
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	_commit="$(git rev-parse HEAD)"
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	_checkoutput="$("$srcdir/$_sourcedirectory/target/$_cargotarget/release/$_pkgname" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "rev $_commit$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	# Install binary
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	install -Dm755 "target/$_cargotarget/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	# Generate man pages
	"$pkgdir/usr/bin/$_pkgname" manual "$pkgdir/usr/share/man/man1/"

	# Generate shell completion files
	install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
	"$pkgdir/usr/bin/$_pkgname" completion bash > "$pkgdir/usr/share/bash-completion/completions/$_pkgname"

	install -dm755 "$pkgdir/usr/share/elvish/lib/"
	"$pkgdir/usr/bin/$_pkgname" completion elvish > "$pkgdir/usr/share/elvish/lib/$_pkgname.elv"

	install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d/"
	"$pkgdir/usr/bin/$_pkgname" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"

	install -dm755 "$pkgdir/usr/share/powershell/completions/"
	"$pkgdir/usr/bin/$_pkgname" completion powershell > "$pkgdir/usr/share/powershell/completions/$_pkgname.ps1"

	install -dm755 "$pkgdir/usr/share/zsh/site-functions/"
	"$pkgdir/usr/bin/$_pkgname" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

	# Install service file
	install -Dm644 "assets/$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
	sed -i 's|%install_dir%|/usr/bin|g' "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"

	# Install license
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
