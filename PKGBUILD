pkgname=libswaykbswitch-git
_pkgname=sway-vim-kbswitch
pkgver=0.0.0.r21.gb0dfad0
pkgrel=1
pkgdesc="A Rust shared library for Vim keyboard layout switching via sway IPC (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/khaser/sway-vim-kbswitch"
license=('MIT')
depends=('glibc')
makedepends=('git' 'rust' 'cargo')
provides=('libswaykbswitch')
conflicts=('libswaykbswitch')
source=("${_pkgname}::git+https://github.com/khaser/sway-vim-kbswitch.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	if git describe --tags --long >/dev/null 2>&1; then
		git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

prepare() {
	cd "$srcdir/$_pkgname"
	cargo generate-lockfile
	CARGO_HOME="$srcdir/cargo-home" cargo fetch --locked
}

build() {
	cd "$srcdir/$_pkgname"
	CARGO_HOME="$srcdir/cargo-home" cargo build --release --frozen
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm0755 "target/release/libswaykbswitch.so" "$pkgdir/usr/lib/libswaykbswitch.so"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	if compgen -G "LICENSE*" >/dev/null; then
		install -Dm0644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
