
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=kitsune-git
_pkgname=kitsune
pkgver=v0.0.1.pre.0.r23.g40ee7d0
pkgrel=1
pkgdesc=":fox_face: ActivityPub-federated microblogging"
arch=(any)
url="https://joinkitsune.org/"
license=('MIT')
depends=(gcc-libs glibc openssl zlib)
makedepends=(cargo git)
provides=($_pkgname{,-cli,-search})
conflicts=($_pkgname)
source=("git+https://github.com/kitsune-soc/kitsune.git")
sha256sums=('SKIP')

prepare() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "${pkgname%-git}"
	find target/release \
		-maxdepth 1 \
		-executable \
		-type f \
		-name "${_pkgname}*" \
		-exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
