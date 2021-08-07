# Maintainer: Atif Chowdhury <iftakhar.awal@gmail.com>
pkgname=xcolor-git
pkgver=0.5.0.100.g0e99e67
pkgrel=2
pkgdesc="Lightweight color picker for X11"
arch=(x86_64)
url="https://github.com/Soft/xcolor"
license=(MIT)
depends=("libxcb")
makedepends=("rust" "cargo" "python")
source=("$pkgname::git+https://github.com/Soft/xcolor.git" "cargo_fix.patch")
sha256sums=('SKIP' '58575b5e08ded6af6331f9fd1e22023b7479905f9a7781d99507d33559ee25c9')

pkgver() {
	cd "$pkgname"
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	_commit=$(git rev-parse HEAD | cut -c1-7)
	if [ "${_commit}" = "0e99e67" ]; then
		patch -p1 < $startdir/cargo_fix.patch
	fi
}

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm755 target/release/xcolor "$pkgdir/usr/bin/xcolor"
	install -Dm644 man/xcolor.1 "$pkgdir/usr/share/man/man1/xcolor.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
