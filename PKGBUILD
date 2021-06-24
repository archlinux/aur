# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=rinstall-git
pkgver=r10.9beec7f
pkgrel=1
pkgdesc="Declarative install for programs"
arch=('x86_64')
url="https://git.sr.ht/~danyspin97/rinstall"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=()
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	sed -i 's|/usr/local|/usr|' rinstall_root.yml
	sed -i '/LICENSE/d' install.yml
}

build() {
	cd "$pkgname"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname"
	target/release/rinstall --prefix '/usr' --destdir "$pkgdir"
}
