# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kitsune-git
_pkgname=kitsune
pkgver=v0.0.1.pre.0.r23.g40ee7d0
pkgrel=1
epoch=
pkgdesc=":fox_face: ActivityPub-federated microblogging"
arch=(any)
url="https://joinkitsune.org/"
license=('MIT')
groups=()
depends=(gcc-libs glibc openssl zlib)
makedepends=(cargo git)
checkdepends=()
optdepends=()
provides=($_pkgname{,-cli,-search})
conflicts=($_pkgname)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/kitsune-soc/kitsune.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

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
