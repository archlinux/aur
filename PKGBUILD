# Contributor: Krafty Kactus <tkk13909@proton.me>

pkgname=sudo-askpass-git
pkgver=1.0.r22.a83978a
pkgrel=1
pkgdesc="A simple askpass program so sudo doesn't look so boring"
arch=(x86_64)
url="https://github.com/Absolpega/sudo-askpass"
license=('MIT')
makedepends=(git cargo)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "sudo-askpass"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd sudo-askpass
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd sudo-askpass
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd sudo-askpass
	install -Dm755 ./target/release/sudo-askpass -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
