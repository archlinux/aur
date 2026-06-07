# PKGBUILD
pkgname=rbtr-git
pkgver=r2.d0c2325
pkgrel=1
pkgdesc="A simple scheduler for generating btrfs snapshots"
arch=('any')
url="https://gitlab.com/vbarch/rbtr"
license=('MIT')
depends=('btrfs-progs')
makedepends=('git')
source=("$pkgname::git+https://gitlab.com/vbarch/rbtr.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --locked --release --all-features
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 target/release/rbtr "$pkgdir/usr/bin/rbtr"
	install -Dm644 rbtrd.service "$pkgdir/usr/lib/systemd/system/rbtrd.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
