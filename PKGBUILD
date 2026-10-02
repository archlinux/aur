# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=redive-git
pkgver=r24.1d34304
pkgrel=1
pkgdesc="Trace URL redirections in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/neelkarma/redive"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
options=('!lto')
provides=('redive')
conflicts=('redive')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "redive"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "redive"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "redive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "redive"
	install -Dm755 "target/release/redive" "$pkgdir/usr/bin/redive"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
